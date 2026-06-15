import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../domain/survey_models.dart';

/// Anket veri erişimi — web `surveys.ts` + `survey-responses.ts` karşılığı.
/// Gönderim public edge function üzerinden (submit-survey-response, jwt=false).
class SurveyRepository {
  SurveyRepository(this._client);
  final SupabaseClient _client;

  /// Slug ile yayınlanmış anketi + sorularını getir.
  /// Filtre: status='published' + tarih aralığı (web getPublishedSurveyBySlug).
  Future<SurveyWithQuestions?> getPublishedBySlug(String slug) async {
    final nowIso = DateTime.now().toUtc().toIso8601String();
    final survey = await _client
        .from('surveys')
        .select('*')
        .eq('slug', slug)
        .eq('status', 'published')
        .or('starts_at.is.null,starts_at.lte.$nowIso')
        .or('ends_at.is.null,ends_at.gte.$nowIso')
        .maybeSingle();

    if (survey == null) return null;

    final questions = await _client
        .from('survey_questions')
        .select('*')
        .eq('survey_id', survey['id'])
        .order('sort_order', ascending: true);

    return SurveyWithQuestions.fromJson({
      ...survey,
      'survey_questions': questions,
    });
  }

  /// Anket yanıtı gönder — public edge function `submit-survey-response`.
  /// Honeypot + meta.startedAt anti-abuse içindir (gerçek koruma backend'de).
  /// Backend hata mesajları kullanıcı-dostu metne çevrilir (web ile birebir).
  Future<String> submit({
    required String surveySlug,
    required List<SurveyAnswer> answers,
    required DateTime startedAt,
    String? name,
    String? email,
    bool contactOptIn = false,
    String honeypot = '',
  }) async {
    final body = <String, dynamic>{
      'surveySlug': surveySlug,
      'answers': answers.map((a) => a.toJson()).toList(),
      'meta': {
        'startedAt': startedAt.toUtc().toIso8601String(),
        'honeypot': honeypot,
      },
    };
    if (name != null || email != null) {
      final respondent = <String, dynamic>{'contactOptIn': contactOptIn};
      if (name != null) respondent['name'] = name;
      if (email != null) respondent['email'] = email;
      body['respondent'] = respondent;
    }

    try {
      final res =
          await _client.functions.invoke('submit-survey-response', body: body);
      final data = res.data;
      if (data is Map && data['responseId'] != null) {
        return data['responseId'].toString();
      }
      return '';
    } on FunctionException catch (e) {
      throw Exception(_friendlyError(e));
    }
  }

  String _friendlyError(FunctionException e) {
    final detail = e.details;
    final msg = (detail is Map ? detail['error']?.toString() : null) ?? '';
    if (msg == 'Multiple submissions are disabled') {
      return 'Bu ankete daha önce yanıt vermiş görünüyorsunuz.';
    }
    if (msg == 'Too many requests' || e.status == 429) {
      return 'Çok hızlı tekrar deneme yapıldı. Lütfen kısa süre sonra deneyin.';
    }
    return msg.isNotEmpty ? msg : 'Gönderim başarısız oldu.';
  }
}

final surveyRepositoryProvider = Provider<SurveyRepository>((ref) {
  return SurveyRepository(ref.watch(supabaseClientProvider));
});

/// Slug ile yayınlanmış anket.
final surveyBySlugProvider =
    FutureProvider.family<SurveyWithQuestions?, String>((ref, slug) async {
  return ref.watch(surveyRepositoryProvider).getPublishedBySlug(slug);
});
