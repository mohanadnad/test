import 'package:sudan_tourist_guide/ai/services/toursim_repository.dart';

import 'models/search_result.dart';
import 'models/user_query.dart';
import 'services/ai_parser.dart';
import 'services/prompt_builder.dart';
import 'services/smart_search.dart';

class RecommendationEngine {
  RecommendationEngine._();
  static final RecommendationEngine instance = RecommendationEngine._();

  final AIParser _parser = const AIParser();
  final SmartSearch _smartSearch = const SmartSearch();
  final PromptBuilder _promptBuilder = const PromptBuilder();
  final TourismRepository _repository = TourismRepository.instance;

  Future<String> getReply({
    required String message,
    required String language,
    required Future<String> Function(String prompt) sendToOpenRouter,
  }) async {
    try {
      final query = await _parser.parse(
        question: message,
        askLLM: sendToOpenRouter,
      );

      print('========== USER QUERY ==========');
      print('Original : $message');
      print('Tourism  : ${query.isTourism}');
      print('Intent   : ${query.intent}');
      print('Intents  : ${query.requestedIntents}');
      print('City     : ${query.city}');
      print('Budget   : ${query.budget}');
      print('TravelType: ${query.travelType}');
      print('Keywords : ${query.keywords}');

      // NON-TOURISM: answer normally with the LLM. The chatbot is not
      // restricted to tourism conversations. The database is simply not used
      // for unrelated questions.
      if (!query.isTourism) {
        try {
          final answer = await sendToOpenRouter(
            _promptBuilder.buildGeneralChatPrompt(
              question: message,
              language: language,
            ),
          );
          if (answer.trim().isNotEmpty) return answer.trim();
        } catch (e) {
          print('GENERAL CHAT LLM ERROR: $e');
        }
        return _generalFallback(message, language);
      }

      // TOURISM: always load all tourism records. Filtering is performed by
      // SmartSearch so a mixed request can return hotels + restaurants + trips
      // in one answer.
      final places = await _repository.getPlaces(
        intent: 'general',
        language: language,
      );
      print('========== PLACES ==========');
      print('Loaded: ${places.length}');

      if (places.isEmpty) return _noDataReply(language);

      final results = _smartSearch.search(places: places, query: query);
      print('========== RESULTS ==========');
      print('Count: ${results.length}');
      for (final result in results.take(15)) {
        print('${_safeTitle(result.place, language)} -> ${result.score}');
      }

      if (results.isEmpty) {
        return _tourismNoMatchFallback(query, language);
      }

      // A mixed recommendation must not be dominated by one type. For
      // "hotel + restaurant + places to visit", deliberately take results
      // from each requested category.
      final selected = _diversify(results, query);
      final prompt = _promptBuilder.build(
        query: query,
        results: selected,
        language: language,
      );

      try {
        final answer = await sendToOpenRouter(prompt);
        if (answer.trim().isNotEmpty) return answer.trim();
      } catch (e) {
        print('ANSWER LLM ERROR: $e');
      }

      return _databaseFallback(selected, language, query);
    } catch (e, stackTrace) {
      print('RECOMMENDATION ENGINE ERROR: $e');
      print(stackTrace);
      return _generalFallback(message, language);
    }
  }

  List<SearchResult> _diversify(List<SearchResult> results, UserQuery query) {
    final requested = query.requestedIntents;
    if (requested.isEmpty) return results.take(12).toList();

    final selected = <SearchResult>[];
    final used = <dynamic>{};

    // Three results per requested category gives the LLM enough choices while
    // preventing hotels from filling all 12 slots.
    for (final wanted in requested) {
      final matches = results.where((r) {
        final type = _read(r.place, 'type').toLowerCase();
        if (wanted == 'attraction') return type == 'trip' || type == 'travel';
        return type == wanted;
      });
      for (final result in matches.take(4)) {
        if (used.add(result.place)) selected.add(result);
      }
    }

    // If a requested category has fewer than 4 results, fill remaining slots
    // with the strongest relevant records.
    for (final result in results) {
      if (selected.length >= 12) break;
      if (used.add(result.place)) selected.add(result);
    }

    return selected;
  }

  String _tourismNoMatchFallback(UserQuery query, String language) {
    final ar = language.toLowerCase().startsWith('ar');
    if (ar) {
      return 'لم أجد نتيجة مطابقة لطلبك في قاعدة البيانات. حاول استخدام اسم المدينة أو نوع المكان أو نوع الرحلة بشكل مختلف.';
    }
    return 'I could not find a matching tourism record in the database. Try another city, place type, or travel type.';
  }

  String _generalFallback(String message, String language) {
    final ar = language.toLowerCase().startsWith('ar');
    if (message.trim().isEmpty)
      return ar ? 'كيف يمكنني مساعدتك؟' : 'How can I help you?';
    return ar
        ? 'أستطيع مساعدتك في هذا السؤال، لكن تعذر الاتصال بخدمة الإجابة الآن. حاول مرة أخرى.'
        : 'I can help with general questions too, but the answer service is temporarily unavailable. Please try again.';
  }

  String _noDataReply(String language) =>
      language.toLowerCase().startsWith('ar')
      ? 'لا توجد بيانات سياحية متاحة حالياً. حاول مرة أخرى بعد قليل.'
      : 'No tourism data is available right now. Please try again shortly.';

  String _databaseFallback(
    List<SearchResult> results,
    String language,
    UserQuery query,
  ) {
    final ar = language.toLowerCase().startsWith('ar');
    final lines = <String>[];
    for (final result in results.take(9)) {
      final p = result.place;
      final title = ar
          ? _read(p, 'title').ifEmpty(_read(p, 'titleEn'))
          : _read(p, 'titleEn').ifEmpty(_read(p, 'title'));
      final city = ar
          ? _read(p, 'cityName').ifEmpty(_read(p, 'cityNameEn'))
          : _read(p, 'cityNameEn').ifEmpty(_read(p, 'cityName'));
      final activities = ar
          ? _readList(p, 'activities')
          : _readList(p, 'activitiesEn');
      final text = activities.join(ar ? '، ' : '; ');
      lines.add(
        ar
            ? '$title — $city${text.isNotEmpty ? ' — الأنشطة: $text' : ''}'
            : '$title — $city${text.isNotEmpty ? ' — activities: $text' : ''}',
      );
    }
    return ar
        ? 'بناءً على قاعدة البيانات${query.city.isNotEmpty ? ' في ${query.city}' : ''}:\n${lines.join('\n')}'
        : 'Based on the database${query.city.isNotEmpty ? ' in ${query.city}' : ''}:\n${lines.join('\n')}';
  }

  String _safeTitle(dynamic place, String language) =>
      language.toLowerCase().startsWith('ar')
      ? _read(place, 'title').ifEmpty(_read(place, 'titleEn'))
      : _read(place, 'titleEn').ifEmpty(_read(place, 'title'));

  String _read(dynamic object, String field) {
    try {
      dynamic v;
      switch (field) {
        case 'title':
          v = object.title;
          break;
        case 'titleEn':
          v = object.titleEn;
          break;
        case 'cityName':
          v = object.cityName;
          break;
        case 'cityNameEn':
          v = object.cityNameEn;
          break;
        case 'type':
          v = object.type;
          break;
        default:
          v = '';
      }
      return v?.toString() ?? '';
    } catch (_) {
      return '';
    }
  }

  List<String> _readList(dynamic object, String field) {
    try {
      final v = field == 'activities' ? object.activities : object.activitiesEn;
      if (v is List)
        return v
            .map((e) => e.toString())
            .where((e) => e.trim().isNotEmpty)
            .toList();
      if (v is String && v.trim().isNotEmpty) return [v];
    } catch (_) {}
    return const [];
  }
}

extension _StringFallback on String {
  String ifEmpty(String fallback) => trim().isEmpty ? fallback : this;
}
