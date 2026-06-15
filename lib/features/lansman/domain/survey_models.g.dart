// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'survey_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SurveyQuestion _$SurveyQuestionFromJson(Map<String, dynamic> json) =>
    _SurveyQuestion(
      id: json['id'] as String,
      question: json['question'] as String? ?? '',
      description: json['description'] as String?,
      type: json['type'] as String? ?? 'text',
      isRequired: json['is_required'] as bool? ?? false,
      sortOrder: (json['sort_order'] as num?)?.toInt() ?? 0,
      placeholder: json['placeholder'] as String?,
      options: json['options'],
    );

Map<String, dynamic> _$SurveyQuestionToJson(_SurveyQuestion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'question': instance.question,
      'description': instance.description,
      'type': instance.type,
      'is_required': instance.isRequired,
      'sort_order': instance.sortOrder,
      'placeholder': instance.placeholder,
      'options': instance.options,
    };

_SurveyWithQuestions _$SurveyWithQuestionsFromJson(Map<String, dynamic> json) =>
    _SurveyWithQuestions(
      id: json['id'] as String,
      slug: json['slug'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String?,
      questions:
          (json['survey_questions'] as List<dynamic>?)
              ?.map((e) => SurveyQuestion.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <SurveyQuestion>[],
    );

Map<String, dynamic> _$SurveyWithQuestionsToJson(
  _SurveyWithQuestions instance,
) => <String, dynamic>{
  'id': instance.id,
  'slug': instance.slug,
  'title': instance.title,
  'description': instance.description,
  'survey_questions': instance.questions,
};
