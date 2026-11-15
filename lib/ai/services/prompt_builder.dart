import '../models/search_result.dart';
import '../models/user_query.dart';

class PromptBuilder {
  const PromptBuilder();

  String build({
    required UserQuery query,
    required List<SearchResult> results,
    required String language,
  }) {
    final ar = language.toLowerCase().startsWith('ar');
    final data = StringBuffer();

    for (var i = 0; i < results.length; i++) {
      final p = results[i].place;
      final activities = _readList(p, 'activities');
      final activitiesEn = _readList(p, 'activitiesEn');
      data.writeln('''
RECORD ${i + 1}
Name: ${_read(p, 'titleEn').ifEmpty(_read(p, 'title'))}
Arabic name: ${_read(p, 'title')}
Type: ${_read(p, 'type')}
City: ${_read(p, 'cityNameEn').ifEmpty(_read(p, 'cityName'))}
Travel type: ${_read(p, 'travelTypeEn').ifEmpty(_read(p, 'travelType'))}
Budget: ${_read(p, 'budget')}
Rating: ${_read(p, 'avgRating')}
Activities English: ${activitiesEn.join(' | ')}
Activities Arabic: ${activities.join(' | ')}
''');
    }

    if (ar) {
      return '''
أنت مساعد ذكي ممتاز يستطيع الإجابة عن الأسئلة العامة، ومرشد سياحي يعتمد على قاعدة بيانات السياحة في السودان عند السؤال السياحي.

سؤال المستخدم:
${query.originalQuestion}

تعليمات:
- أجب عن السؤال نفسه مباشرة.
- البيانات أدناه هي مصدر الحقيقة للأماكن السياحية.
- لا تخترع اسماً أو سعراً أو نشاطاً أو موقعاً أو تقييماً غير موجود في السجلات.
- إذا قال المستخدم "أخبرني المزيد" عن مكان، استخدم الاسم والأنشطة/الوصف الموجودة في السجل.
- الأنشطة Activities هي وصف مهم للمكان ويجب استخدامها عند الإجابة عن ماذا يوجد أو ماذا يمكن أن أفعل هناك.
- إذا طلب المستخدم أكثر من نوع، مثل فندق + مطعم + أماكن للزيارة، رشح من كل نوع بدلاً من إعطاء نوع واحد فقط.
- لا تذكر Search score.
- إذا كانت معلومة غير موجودة في السجلات، قل إنها غير متوفرة بدلاً من اختلاقها.
- اجعل الإجابة طبيعية ومفيدة ومختصرة.

سجلات قاعدة البيانات:
$data
''';
    }

    return '''
You are a highly capable general assistant and a Sudan tourism advisor.

User question:
${query.originalQuestion}

Use the database records below as the source of truth ONLY for tourism-place facts.
Rules:
- Answer the exact question directly and naturally.
- Never invent a place name, price, activity, location, rating, or facility.
- Activities are important descriptions of the place. Use them for "tell me more", "what can I do", sightseeing, and activity questions.
- If the user asks for multiple categories such as hotels + restaurants + places to visit, recommend from EACH category rather than letting one category dominate.
- Do not mention search scores.
- If a requested fact is not in the records, say that it is not available instead of guessing.
- Do not say you lack information when a matching database record is provided.

Database records:
$data
''';
  }

  String buildGeneralChatPrompt({required String question, required String language}) {
    final ar = language.toLowerCase().startsWith('ar');
    if (ar) {
      return '''
أجب عن سؤال المستخدم بشكل طبيعي ومباشر كمساعد عام ذكي.
السؤال:
$question

لا تقل إنك مساعد سياحي لمجرد أن السؤال ليس سياحياً. يمكنك الإجابة عن النكات، المعلومات العامة، التاريخ، الجغرافيا، العلوم، الحياة اليومية وغيرها.
إذا كان السؤال غير واضح، اطلب توضيحاً باختصار.
إذا كان السؤال يحتاج معلومات حديثة جداً، كن واضحاً بشأن حدود معرفتك.
لا تخترع حقائق.
''';
    }

    return '''
Answer the user's question naturally and directly as a capable general AI assistant.
User question:
$question

Do NOT say that you are only a tourism assistant just because the question is unrelated to tourism. You may answer jokes, general knowledge, history, geography, science, everyday questions, and other normal requests.
If the question is ambiguous, ask a short clarification.
Do not invent facts.
''';
  }

  String _read(dynamic object, String field) {
    try {
      dynamic v;
      switch (field) {
        case 'title': v = object.title; break;
        case 'titleEn': v = object.titleEn; break;
        case 'cityName': v = object.cityName; break;
        case 'cityNameEn': v = object.cityNameEn; break;
        case 'type': v = object.type; break;
        case 'travelType': v = object.travelType; break;
        case 'travelTypeEn': v = object.travelTypeEn; break;
        case 'budget': v = object.budget; break;
        case 'avgRating': v = object.avgRating; break;
        default: v = '';
      }
      return v?.toString() ?? '';
    } catch (_) { return ''; }
  }

  List<String> _readList(dynamic object, String field) {
    try {
      final v = field == 'activities' ? object.activities : object.activitiesEn;
      if (v is List) return v.map((e) => e.toString()).where((e) => e.trim().isNotEmpty).toList();
      if (v is String && v.trim().isNotEmpty) return [v];
    } catch (_) {}
    return const [];
  }
}

extension _StringFallback on String {
  String ifEmpty(String fallback) => trim().isEmpty ? fallback : this;
}
