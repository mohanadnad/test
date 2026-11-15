class UserQuery {
  final bool isTourism;
  final String intent;
  final List<String> intents;
  final String city;
  final int? budget;
  final List<String> keywords;
  final String travelType;
  final String originalQuestion;

  const UserQuery({
    required this.isTourism,
    required this.intent,
    required this.city,
    required this.budget,
    required this.keywords,
    required this.travelType,
    required this.originalQuestion,
    this.intents = const [],
  });

  List<String> get requestedIntents {
    final values = <String>{
      ...intents,
      if (intent != 'general') intent,
    };
    return values.where(_isValidIntent).toList();
  }

  factory UserQuery.fromJson(Map<String, dynamic> json, String question) {
    final rawIntents = json['intents'];
    final parsedIntents = <String>{};
    if (rawIntents is List) {
      for (final value in rawIntents) {
        final v = value.toString().trim().toLowerCase();
        if (_isValidIntent(v) && v != 'general') parsedIntents.add(v);
      }
    }

    final singleIntent = _normalizeIntent(json['intent']);
    if (singleIntent != 'general') parsedIntents.add(singleIntent);

    final rawKeywords = json['keywords'];
    final keywords = rawKeywords is List
        ? rawKeywords
            .map((e) => e.toString().trim())
            .where((e) => e.isNotEmpty)
            .toSet()
            .toList()
        : <String>[];

    return UserQuery(
      isTourism: _toBool(json['isTourism'], fallback: false),
      intent: singleIntent,
      intents: parsedIntents.toList(),
      city: json['city']?.toString().trim() ?? '',
      budget: _toInt(json['budget']),
      keywords: keywords,
      travelType: json['travelType']?.toString().trim().toLowerCase() ?? '',
      originalQuestion: question,
    );
  }

  static bool _isValidIntent(String value) =>
      const {'hotel', 'restaurant', 'trip', 'travel', 'attraction', 'general'}.contains(value);

  static bool _toBool(dynamic value, {required bool fallback}) {
    if (value is bool) return value;
    if (value is String) {
      final v = value.trim().toLowerCase();
      if (v == 'true' || v == 'yes' || v == '1') return true;
      if (v == 'false' || v == 'no' || v == '0') return false;
    }
    return fallback;
  }

  static int? _toInt(dynamic value) {
    if (value == null) return null;
    if (value is int) return value;
    return int.tryParse(value.toString().replaceAll(',', '').trim());
  }

  static String _normalizeIntent(dynamic value) {
    final intent = value?.toString().trim().toLowerCase() ?? 'general';
    return _isValidIntent(intent) ? intent : 'general';
  }
}
