import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/survey_repository.dart';
import '../domain/survey_models.dart';

/// Anket gönderim durumu.
sealed class SurveySubmitState {
  const SurveySubmitState();
}

class SurveyIdle extends SurveySubmitState {
  const SurveyIdle();
}

class SurveySubmitting extends SurveySubmitState {
  const SurveySubmitting();
}

class SurveySubmitted extends SurveySubmitState {
  const SurveySubmitted(this.responseId);
  final String responseId;
}

class SurveyFailed extends SurveySubmitState {
  const SurveyFailed(this.message);
  final String message;
}

/// Anket gönderim controller'ı. Form açılış anı (startedAt) anti-bot meta içindir.
class SurveyController extends Notifier<SurveySubmitState> {
  late final DateTime _startedAt;

  @override
  SurveySubmitState build() {
    _startedAt = DateTime.now();
    return const SurveyIdle();
  }

  Future<void> submit({
    required String slug,
    required List<SurveyAnswer> answers,
    String? name,
    String? email,
    bool contactOptIn = false,
    String honeypot = '',
  }) async {
    state = const SurveySubmitting();
    try {
      final id = await ref.read(surveyRepositoryProvider).submit(
            surveySlug: slug,
            answers: answers,
            startedAt: _startedAt,
            name: name,
            email: email,
            contactOptIn: contactOptIn,
            honeypot: honeypot,
          );
      state = SurveySubmitted(id);
    } catch (e) {
      state = SurveyFailed(e.toString().replaceFirst('Exception: ', ''));
    }
  }
}

/// autoDispose: her anket açılışında taze controller (startedAt yeniden sabitlenir).
final surveyControllerProvider =
    NotifierProvider.autoDispose<SurveyController, SurveySubmitState>(
  SurveyController.new,
);
