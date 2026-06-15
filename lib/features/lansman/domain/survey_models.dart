import 'package:freezed_annotation/freezed_annotation.dart';

part 'survey_models.freezed.dart';
part 'survey_models.g.dart';

/// Anket sorusu — `survey_questions` tablosu (types.ts doğrulandı).
@freezed
abstract class SurveyQuestion with _$SurveyQuestion {
  const factory SurveyQuestion({
    required String id,
    @Default('') String question,
    String? description,
    @Default('text') String type, // 'text' | 'single' | 'multi' | ...
    @Default(false) @JsonKey(name: 'is_required') bool isRequired,
    @Default(0) @JsonKey(name: 'sort_order') int sortOrder,
    String? placeholder,
    dynamic options,
  }) = _SurveyQuestion;

  factory SurveyQuestion.fromJson(Map<String, dynamic> json) =>
      _$SurveyQuestionFromJson(json);
}

/// Yayınlanmış anket + soruları (`surveys` + survey_questions).
@freezed
abstract class SurveyWithQuestions with _$SurveyWithQuestions {
  const factory SurveyWithQuestions({
    required String id,
    @Default('') String slug,
    @Default('') String title,
    String? description,
    @JsonKey(name: 'survey_questions')
    @Default(<SurveyQuestion>[]) List<SurveyQuestion> questions,
  }) = _SurveyWithQuestions;

  factory SurveyWithQuestions.fromJson(Map<String, dynamic> json) =>
      _$SurveyWithQuestionsFromJson(json);
}

/// Tek soru yanıtı (submit payload: answers[]).
class SurveyAnswer {
  const SurveyAnswer({required this.questionId, required this.value});
  final String questionId;
  final dynamic value;

  Map<String, dynamic> toJson() => {'questionId': questionId, 'value': value};
}
