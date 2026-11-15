import 'package:sudan_tourist_guide/ai/models/search_result.dart';
import 'package:sudan_tourist_guide/ai/models/user_query.dart';

class SmartSearch {
  const SmartSearch();

  List<SearchResult> search({
    required List<dynamic> places,
    required UserQuery query,
  }) {
    final results = <SearchResult>[];

    for (final place in places) {
      final score = _calculateScore(place, query);
      if (score > 0) {
        results.add(SearchResult(place: place, score: score));
      }
    }

    results.sort((a, b) => b.score.compareTo(a.score));
    return results;
  }

  int _calculateScore(dynamic place, UserQuery query) {
    int score = 0;
    bool realEvidence = false;
    bool contentMatch = false;

    final title = _normalize('${_read(place, 'title')} ${_read(place, 'titleEn')}');
    final city = _normalize('${_read(place, 'cityName')} ${_read(place, 'cityNameEn')}');
    final type = _normalize(_read(place, 'type'));
    final travelType = _normalize('${_read(place, 'travelType')} ${_read(place, 'travelTypeEn')}');
    final categories = _normalize('${_read(place, 'categories')} ${_read(place, 'categoryId')}');
    final activities = _normalize('${_readList(place, 'activities').join(' ')} ${_readList(place, 'activitiesEn').join(' ')}');
    final all = '$title $city $travelType $categories $activities';

    final requestedTypes = query.requestedIntents;

    // ---------------- TYPE / INTENT ----------------
    if (requestedTypes.isNotEmpty) {
      if (requestedTypes.contains(type)) {
        score += 65;
        realEvidence = true;
      } else if (requestedTypes.contains('attraction') &&
          (type == 'trip' || type == 'travel')) {
        // Your database does not have an attraction table/type. Trips and
        // travel records are the closest database-backed source for places to
        // visit, so they are eligible for attraction recommendations.
        score += 42;
        realEvidence = true;
      } else {
        // Do not allow a hotel to become a restaurant recommendation merely
        // because it happens to be in the requested city.
        return 0;
      }
    }

    // ---------------- CITY ----------------
    if (query.city.isNotEmpty) {
      final aliases = _cityAliases(query.city);
      if (aliases.any((a) => city.contains(_normalize(a)))) {
        score += 70;
        realEvidence = true;
      } else {
        return 0;
      }
    }

    // ---------------- TRAVEL TYPE ----------------
    if (query.travelType.isNotEmpty) {
      final aliases = _semanticAliases(query.travelType);
      if (aliases.any((a) => travelType.contains(_normalize(a)))) {
        score += 70;
        realEvidence = true;
      } else if (aliases.any((a) => all.contains(_normalize(a)))) {
        score += 40;
        realEvidence = true;
      }
    }

    // ---------------- KEYWORDS / PLACE NAMES / ACTIVITIES ----------------
    for (final keyword in query.keywords) {
      final aliases = _semanticAliases(keyword);
      final titleHit = aliases.any((a) => title.contains(_normalize(a)));
      final activityHit = aliases.any((a) => activities.contains(_normalize(a)));
      final travelHit = aliases.any((a) => travelType.contains(_normalize(a)));
      final categoryHit = aliases.any((a) => categories.contains(_normalize(a)));

      if (titleHit) {
        score += 95;
        contentMatch = true;
        realEvidence = true;
      }
      if (activityHit) {
        score += 75;
        contentMatch = true;
        realEvidence = true;
      }
      if (travelHit) {
        score += 45;
        contentMatch = true;
        realEvidence = true;
      }
      if (categoryHit) {
        score += 25;
        contentMatch = true;
        realEvidence = true;
      }

      final tokens = _tokensForKeyword(keyword);
      final titleTokens = _countTokenHits(tokens, title);
      final activityTokens = _countTokenHits(tokens, activities);
      if (titleTokens > 0) {
        score += titleTokens * 38;
        contentMatch = true;
        realEvidence = true;
      }
      if (activityTokens > 0) {
        score += activityTokens * 30;
        contentMatch = true;
        realEvidence = true;
      }
    }

    // For a named/concept search, city alone is never enough.
    if (query.keywords.isNotEmpty && !contentMatch) return 0;

    // ---------------- BUDGET ----------------
    if (query.budget != null && query.budget! > 0) {
      final placeBudget = _readInt(place, 'budget');
      if (placeBudget > 0) {
        final difference = (placeBudget - query.budget!).abs();
        final percent = difference / query.budget!;
        if (percent <= .05) score += 35;
        else if (percent <= .10) score += 28;
        else if (percent <= .20) score += 20;
        else if (percent <= .35) score += 10;
        else score -= 10;
      }
    }

    // Rating is ONLY a tie breaker after actual matching evidence.
    if (realEvidence) {
      score += _readDouble(place, 'avgRating').round().clamp(0, 5).toInt();
    }

    // For a broad city recommendation, city + requested type is enough.
    // For a fully broad tourism query, rating can rank only real records.
    if (!realEvidence) return 0;
    return score < 1 ? 0 : score;
  }

  String _read(dynamic object, String field) {
    try {
      dynamic value;
      switch (field) {
        case 'title': value = object.title; break;
        case 'titleEn': value = object.titleEn; break;
        case 'cityName': value = object.cityName; break;
        case 'cityNameEn': value = object.cityNameEn; break;
        case 'type': value = object.type; break;
        case 'travelType': value = object.travelType; break;
        case 'travelTypeEn': value = object.travelTypeEn; break;
        case 'categories': value = object.categories; break;
        case 'categoryId': value = object.categoryId; break;
        default: value = '';
      }
      return value?.toString() ?? '';
    } catch (_) { return ''; }
  }

  List<String> _readList(dynamic object, String field) {
    try {
      dynamic value = field == 'activities' ? object.activities : object.activitiesEn;
      if (value == null) return const [];
      if (value is List) return value.map((e) => e.toString()).where((e) => e.trim().isNotEmpty).toList();
      if (value is String && value.trim().isNotEmpty) return [value];
    } catch (_) {}
    return const [];
  }

  int _readInt(dynamic object, String field) {
    try { return int.tryParse(object.budget?.toString() ?? '') ?? 0; } catch (_) { return 0; }
  }

  double _readDouble(dynamic object, String field) {
    try { return double.tryParse(object.avgRating?.toString() ?? '') ?? 0; } catch (_) { return 0; }
  }

  String _normalize(String value) => value
      .toLowerCase()
      .replaceAll(RegExp(r'[إأآ]'), 'ا')
      .replaceAll('ى', 'ي')
      .replaceAll('ة', 'ه')
      .replaceAll('ؤ', 'و')
      .replaceAll('ئ', 'ي')
      .replaceAll(RegExp(r'[\-_/.,،؛:!?؟()\[\]{}]'), ' ')
      .replaceAll(RegExp(r'\s+'), ' ')
      .trim();

  List<String> _cityAliases(String city) {
    final c = _normalize(city);
    const map = <String, List<String>>{
      'khartoum': ['khartoum', 'الخرطوم'],
      'omdurman': ['omdurman', 'omdorman', 'ام درمان', 'أم درمان'],
      'port sudan': ['port sudan', 'portsudan', 'بورتسودان', 'بورت سودان'],
      'kassala': ['kassala', 'kasala', 'كسلا'],
      'suakin': ['suakin', 'سواكن'],
      'meroe': ['meroe', 'مروي', 'مروى'],
      'karima': ['karima', 'كريمة', 'كرمة'],
      'damazin': ['damazin', 'ad damazin', 'الدمازين'],
    };
    for (final e in map.entries) {
      if (c == _normalize(e.key) || e.value.any((x) => c == _normalize(x))) return e.value;
    }
    return [city];
  }

  List<String> _semanticAliases(String value) {
    final v = _normalize(value);
    const groups = <String, List<String>>{
      'hotel': ['hotel', 'hotels', 'resort', 'accommodation', 'فندق', 'فنادق', 'منتجع'],
      'restaurant': ['restaurant', 'restaurants', 'cafe', 'food', 'dining', 'مطعم', 'مطاعم', 'كافيه', 'مقهى'],
      'pyramids': ['pyramid', 'pyramids', 'أهرامات', 'اهرامات', 'أهرام', 'اهرام', 'هرم'],
      'nuri': ['nuri', 'نوري'],
      'meroe': ['meroe', 'مروي', 'مروى'],
      'temple': ['temple', 'temples', 'معبد', 'معابد'],
      'museum': ['museum', 'متحف', 'متاحف'],
      'tomb': ['tomb', 'tombs', 'قبر', 'مقبرة', 'مقابر'],
      'sea': ['sea', 'seaside', 'beach', 'coast', 'coastal', 'red sea', 'marine', 'بحر', 'بحرية', 'شاطئ', 'ساحل', 'البحر الاحمر'],
      'historical': ['historical', 'historic', 'history', 'heritage', 'ancient', 'archaeological', 'museum', 'تاريخ', 'تاريخي', 'تاريخية', 'تراث', 'اثري', 'اثار', 'متحف', 'حضارة'],
      'cultural': ['cultural', 'culture', 'ثقافي', 'ثقافية', 'ثقافة'],
      'adventure': ['adventure', 'hiking', 'camping', 'safari', 'مغامرة', 'تخييم', 'سفاري'],
      'nature': ['nature', 'natural', 'طبيعة', 'طبيعي', 'طبيعية'],
      'family': ['family', 'families', 'children', 'kids', 'عائلي', 'عائلية', 'عائلة', 'اطفال', 'أطفال'],
    };
    for (final e in groups.entries) {
      if (v == e.key || e.value.any((x) => v == _normalize(x))) return e.value.map(_normalize).toList();
    }
    return [v];
  }

  List<String> _tokensForKeyword(String keyword) =>
      _semanticAliases(keyword).expand((a) => _normalize(a).split(' ')).where((x) => x.length >= 2).toSet().toList();

  int _countTokenHits(List<String> tokens, String text) {
    final padded = ' ${_normalize(text)} ';
    return tokens.where((t) => padded.contains(' $t ')).length;
  }
}
