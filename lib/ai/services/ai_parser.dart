import 'dart:convert';

import '../models/user_query.dart';

class AIParser {
  const AIParser();

  Future<UserQuery> parse({
    required String question,
    required Future<String> Function(String prompt) askLLM,
  }) async {
    final trimmed = question.trim();
    if (trimmed.isEmpty) {
      return UserQuery(
        isTourism: false,
        intent: 'general',
        city: '',
        budget: null,
        keywords: const [],
        travelType: '',
        originalQuestion: question,
      );
    }

    // Deterministic local signals are intentionally checked before the LLM.
    // This prevents an LLM hallucination such as assigning an unmentioned
    // city to a place name.
    final local = _localSignals(trimmed);

    final prompt = '''
You are the query-understanding layer for a Sudan tourism application.
Classify the user's message, but DO NOT answer it.
Return ONLY valid JSON. No markdown and no explanation.

Schema:
{
  "isTourism": true|false,
  "intent": "hotel|restaurant|trip|travel|general",
  "intents": ["hotel","restaurant","trip","travel","attraction"],
  "city": "",
  "budget": null,
  "travelType": "sea|historical|cultural|adventure|desert|nature|family|religious|general",
  "keywords": []
}

Rules:
- isTourism=true for tourism questions about Sudan places, attractions, hotels,
  restaurants, trips, travel agencies, activities, sightseeing, destinations,
  historical sites, beaches, pyramids, museums, etc.
- A recommendation can contain MULTIPLE intents. Example:
  "recommend nice places, restaurants and a hotel in Khartoum"
  => intents=["trip","restaurant","hotel"] or, if attractions are better
  represented by trips in the available database, include "trip".
- If the user asks for general tourist places/attractions without saying hotel,
  restaurant, trip, or agency, use intent=general and intents=[].
- Never invent a city. Put a city in city ONLY if the user explicitly mentions it.
- Never invent a budget.
- travelType is the tourism style requested by the user.
- keywords should contain meaningful named places and concepts.
- Understand Arabic, English, spelling mistakes, and mixed language.
- Non-tourism questions are still valid questions; set isTourism=false.

User message:
$trimmed
''';

    try {
      final response = await askLLM(prompt);
      print('========== RAW AI RESPONSE ==========');
      print(response);
      print('=====================================');

      final decoded = _decodeJsonObject(response);
      if (decoded != null) {
        final parsed = UserQuery.fromJson(decoded, question);
        return _mergeLocal(parsed, local);
      }
    } catch (e, stackTrace) {
      print('AI PARSER ERROR: $e');
      print(stackTrace);
    }

    return _toUserQuery(local, question);
  }

  Map<String, dynamic>? _decodeJsonObject(String response) {
    var text = response.trim();
    text = text
        .replaceFirst(RegExp(r'^```(?:json)?\s*', caseSensitive: false), '')
        .replaceFirst(RegExp(r'\s*```$'), '')
        .trim();

    try {
      final decoded = jsonDecode(text);
      if (decoded is Map) return Map<String, dynamic>.from(decoded);
    } catch (_) {}

    final start = text.indexOf('{');
    final end = text.lastIndexOf('}');
    if (start >= 0 && end > start) {
      try {
        final decoded = jsonDecode(text.substring(start, end + 1));
        if (decoded is Map) return Map<String, dynamic>.from(decoded);
      } catch (_) {}
    }
    return null;
  }

  Map<String, dynamic> _localSignals(String original) {
    final q = _normalize(original);
    final intents = <String>{};

    if (_containsAny(q, [
      'hotel', 'hotels', 'resort', 'accommodation', 'stay', 'lodge', 'inn',
      'فندق', 'فنادق', 'منتجع', 'اقامه', 'اقامة', 'سكن',
    ])) intents.add('hotel');

    if (_containsAny(q, [
      'restaurant', 'restaurants', 'cafe', 'cafes', 'coffee', 'food', 'eat',
      'dining', 'مطعم', 'مطاعم', 'كافيه', 'مقهى', 'اكل', 'أكل', 'طعام',
    ])) intents.add('restaurant');

    if (_containsAny(q, [
      'travel agency', 'tour operator', 'tourism office', 'travel office',
      'agency', 'agencies', 'مكتب سياحة', 'مكتب سفر', 'شركة سياحة', 'وكالة',
    ])) intents.add('travel');

    if (_containsAny(q, [
      'trip', 'trips', 'tour', 'tours', 'excursion', 'excursions', 'package',
      'رحلة', 'رحلات', 'جولة', 'جولات', 'برنامج سياحي',
    ])) intents.add('trip');

    if (_containsAny(q, [
      'places to visit', 'place to visit', 'tourist places', 'tourist attractions',
      'attractions', 'sightseeing', 'things to do', 'nice places',
      'اماكن سياحية', 'أماكن سياحية', 'اماكن للزيارة', 'أماكن للزيارة',
      'معالم سياحية', 'اماكن للذهاب', 'أماكن للذهاب',
    ])) intents.add('attraction');

    // Attraction/place recommendations are represented by the tourism data
    // broadly; trips are only added when the user explicitly asks for trips.
    final travelType = _detectTravelType(q);
    final city = _detectCity(q);
    final keywords = _extractKeywords(q, travelType);
    final budget = _detectBudget(q);

    final tourism = intents.isNotEmpty ||
        travelType.isNotEmpty ||
        city.isNotEmpty ||
        keywords.isNotEmpty ||
        _looksTourism(q);

    return {
      'isTourism': tourism,
      'intent': intents.length == 1 ? intents.first : 'general',
      'intents': intents.toList(),
      'city': city,
      'budget': budget,
      'travelType': travelType,
      'keywords': keywords,
    };
  }

  UserQuery _mergeLocal(UserQuery parsed, Map<String, dynamic> local) {
    final localIntents = List<String>.from(local['intents'] as List? ?? const []);
    final mergedIntents = <String>{
      ...parsed.requestedIntents,
      ...localIntents,
    }.toList();

    final explicitCity = (local['city'] ?? '').toString();
    final localTravelType = (local['travelType'] ?? '').toString();
    final localKeywords = List<String>.from(local['keywords'] as List? ?? const []);
    final mergedKeywords = <String>{...parsed.keywords, ...localKeywords}.toList();

    final isTourism = parsed.isTourism || local['isTourism'] == true ||
        mergedIntents.isNotEmpty || explicitCity.isNotEmpty ||
        localTravelType.isNotEmpty || mergedKeywords.isNotEmpty;

    return UserQuery(
      isTourism: isTourism,
      intent: mergedIntents.length == 1 ? mergedIntents.first : 'general',
      intents: mergedIntents,
      city: explicitCity.isNotEmpty ? explicitCity : '',
      budget: parsed.budget ?? local['budget'] as int?,
      keywords: mergedKeywords,
      travelType: localTravelType.isNotEmpty ? localTravelType : parsed.travelType,
      originalQuestion: parsed.originalQuestion,
    );
  }

  UserQuery _toUserQuery(Map<String, dynamic> data, String question) {
    final intents = List<String>.from(data['intents'] as List? ?? const []);
    final intent = data['intent']?.toString() ?? 'general';
    return UserQuery(
      isTourism: data['isTourism'] == true,
      intent: intents.length == 1 ? intents.first : intent,
      intents: intents,
      city: data['city']?.toString() ?? '',
      budget: data['budget'] as int?,
      keywords: List<String>.from(data['keywords'] as List? ?? const []),
      travelType: data['travelType']?.toString() ?? '',
      originalQuestion: question,
    );
  }

  String _detectCity(String q) {
    const cities = <String, List<String>>{
      'Khartoum': ['khartoum', 'الخرطوم'],
      'Omdurman': ['omdurman', 'omdorman', 'ام درمان', 'أم درمان'],
      'Port Sudan': ['port sudan', 'portsudan', 'بورتسودان', 'بورت سودان'],
      'Kassala': ['kassala', 'kasala', 'كسلا'],
      'Suakin': ['suakin', 'سواكن'],
      'Meroe': ['meroe', 'مروي', 'مروى'],
      'Karima': ['karima', 'كرمة', 'كريمة'],
      'Damazin': ['damazin', 'ad-damazin', 'الدمازين'],
    };
    for (final entry in cities.entries) {
      if (entry.value.any((x) => q.contains(_normalize(x)))) return entry.key;
    }
    return '';
  }

  String _detectTravelType(String q) {
    if (_containsAny(q, [
      'sea', 'seaside', 'beach', 'coast', 'coastal', 'red sea', 'marine',
      'diving', 'snorkeling', 'بحر', 'بحري', 'بحرية', 'شاطئ', 'ساحل',
      'البحر الاحمر', 'غوص', 'سنوركل',
    ])) return 'sea';
    if (_containsAny(q, [
      'historical', 'historic', 'history', 'heritage', 'ancient',
      'archaeological', 'museum', 'تاريخ', 'تاريخي', 'تاريخية', 'تراث',
      'اثري', 'اثرية', 'اثار', 'آثار', 'متحف', 'حضارة',
    ])) return 'historical';
    if (_containsAny(q, ['cultural', 'culture', 'ثقافي', 'ثقافية', 'ثقافة'])) return 'cultural';
    if (_containsAny(q, ['adventure', 'hiking', 'camping', 'safari', 'مغامرة', 'تخييم', 'سفاري'])) return 'adventure';
    if (_containsAny(q, ['desert', 'صحراء', 'صحراوي', 'صحراوية'])) return 'desert';
    if (_containsAny(q, ['nature', 'natural', 'طبيعة', 'طبيعي', 'طبيعية'])) return 'nature';
    if (_containsAny(q, ['family', 'families', 'children', 'kids', 'عائلي', 'عائلية', 'عائلة', 'اطفال', 'أطفال'])) return 'family';
    if (_containsAny(q, ['religious', 'religion', 'mosque', 'church', 'ديني', 'مسجد', 'كنيسة'])) return 'religious';
    return '';
  }

  List<String> _extractKeywords(String q, String travelType) {
    final result = <String>{};
    if (travelType.isNotEmpty) result.add(travelType);

    const entities = <String, List<String>>{
      'pyramids': ['pyramid', 'pyramids', 'أهرامات', 'اهرامات', 'أهرام', 'اهرام', 'هرم'],
      'nuri': ['nuri', 'نوري'],
      'meroe': ['meroe', 'مروي', 'مروى'],
      'temple': ['temple', 'temples', 'معبد', 'معابد'],
      'tomb': ['tomb', 'tombs', 'قبر', 'مقبرة', 'مقابر'],
      'museum': ['museum', 'متحف', 'متاحف'],
      'beach': ['beach', 'شاطئ'],
      'sea': ['sea', 'seaside', 'red sea', 'بحر', 'بحرية', 'البحر الاحمر'],
      'historical': ['historical', 'history', 'historic', 'تاريخي', 'تاريخية', 'تاريخ'],
    };
    for (final entry in entities.entries) {
      if (entry.value.any((x) => q.contains(_normalize(x)))) result.add(entry.key);
    }
    return result.toList();
  }

  int? _detectBudget(String q) {
    final match = RegExp(r'(?:under|below|less than|budget|price|cost|سعر|ميزانية|اقل من|أقل من)\s*([0-9]+)').firstMatch(q);
    return match == null ? null : int.tryParse(match.group(1)!);
  }

  bool _looksTourism(String q) => _containsAny(q, [
    'tourism', 'tourist', 'travel', 'trip', 'hotel', 'restaurant', 'resort',
    'attraction', 'pyramid', 'pyramids', 'temple', 'tomb', 'museum', 'beach',
    'sea', 'heritage', 'archaeological', 'sightseeing', 'destination',
    'places to visit', 'things to do', 'مطعم', 'فندق', 'رحلة', 'سياحة',
    'سفر', 'أهرامات', 'معبد', 'مقبرة', 'متحف', 'شاطئ', 'بحر', 'تراث', 'زيارة',
    'أماكن سياحية', 'اماكن سياحية',
  ]);

  bool _containsAny(String text, List<String> values) => values.any((v) => text.contains(_normalize(v)));

  String _normalize(String text) => text
      .toLowerCase()
      .replaceAll(RegExp(r'[إأآ]'), 'ا')
      .replaceAll('ى', 'ي')
      .replaceAll('ة', 'ه')
      .replaceAll(RegExp(r'[؟?!.,،؛:()\[\]{}]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();
}
