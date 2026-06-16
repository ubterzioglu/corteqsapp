import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/async_value_view.dart';
import '../data/survey_repository.dart';
import '../domain/survey_models.dart';
import 'survey_controller.dart';

/// Public anket akışı — `/anket/:slug` (app.md 330). Soruları render eder,
/// honeypot ile anti-bot, public edge function ile gönderir, teşekkürler gösterir.
class SurveyPage extends ConsumerWidget {
  const SurveyPage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final survey = ref.watch(surveyBySlugProvider(slug));
    final submitState = ref.watch(surveyControllerProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Anket')),
      body: switch (submitState) {
        SurveySubmitted() => const _ThankYou(),
        _ => AsyncValueView<SurveyWithQuestions?>(
            value: survey,
            data: (s) {
              if (s == null) {
                return const Center(
                  key: Key('survey_not_found'),
                  child: Text('Anket bulunamadı veya yayında değil.'),
                );
              }
              return _SurveyForm(survey: s);
            },
          ),
      },
    );
  }
}

class _ThankYou extends StatelessWidget {
  const _ThankYou();
  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key('survey_thank_you'),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.check_circle_outline, size: 56, color: Colors.green),
          SizedBox(height: 16),
          Text('Teşekkürler! Yanıtınız alındı.'),
        ],
      ),
    );
  }
}

class _SurveyForm extends ConsumerStatefulWidget {
  const _SurveyForm({required this.survey});
  final SurveyWithQuestions survey;
  @override
  ConsumerState<_SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends ConsumerState<_SurveyForm> {
  final _formKey = GlobalKey<FormState>();
  final _answers = <String, dynamic>{};
  final _honeypot = TextEditingController(); // gizli — bot doldurursa reddedilir

  @override
  void dispose() {
    _honeypot.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    final answers = widget.survey.questions
        .map((q) => SurveyAnswer(questionId: q.id, value: _answers[q.id]))
        .toList();
    ref.read(surveyControllerProvider.notifier).submit(
          slug: widget.survey.slug,
          answers: answers,
          honeypot: _honeypot.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(surveyControllerProvider);
    final isSubmitting = state is SurveySubmitting;

    return Form(
      key: _formKey,
      child: ListView(
        key: const Key('survey_form'),
        padding: const EdgeInsets.all(16),
        children: [
          Text(widget.survey.title,
              style: Theme.of(context).textTheme.headlineSmall),
          if (widget.survey.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(widget.survey.description!),
            ),
          const SizedBox(height: 16),
          for (final q in widget.survey.questions) _buildQuestion(q),
          // Honeypot: ekran okuyucu/görsel olarak gizli; insan doldurmaz.
          SizedBox(
            height: 0,
            width: 0,
            child: ExcludeSemantics(
              child: TextField(controller: _honeypot),
            ),
          ),
          if (state is SurveyFailed)
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(state.message,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.error)),
            ),
          const SizedBox(height: 16),
          FilledButton(
            key: const Key('survey_submit_button'),
            onPressed: isSubmitting ? null : _submit,
            child: isSubmitting
                ? const SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator(strokeWidth: 2))
                : const Text('Gönder'),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestion(SurveyQuestion q) {
    final options = _optionsOf(q);
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            q.question + (q.isRequired ? ' *' : ''),
            style: Theme.of(context).textTheme.titleSmall,
          ),
          if (q.description != null)
            Text(q.description!,
                style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(height: 8),
          if (q.type == 'single' && options.isNotEmpty)
            RadioGroup<String>(
              groupValue: _answers[q.id] as String?,
              onChanged: (v) => setState(() => _answers[q.id] = v),
              child: Column(
                children: [
                  for (final opt in options)
                    RadioListTile<String>(
                      contentPadding: EdgeInsets.zero,
                      title: Text(opt),
                      value: opt,
                    ),
                ],
              ),
            )
          else if (q.type == 'multiple' && options.isNotEmpty)
            _buildMultiChoiceQuestion(q.id, options)
          else
            TextFormField(
              decoration: InputDecoration(
                hintText: q.placeholder ?? 'Yanıtınız',
                border: const OutlineInputBorder(),
              ),
              onChanged: (v) => _answers[q.id] = v,
              validator: (v) => (q.isRequired && (v == null || v.trim().isEmpty))
                  ? 'Bu alan zorunlu'
                  : null,
            ),
        ],
      ),
    );
  }

  Widget _buildMultiChoiceQuestion(String questionId, List<String> options) {
    // Initialize as empty set if not present
    if (_answers[questionId] == null) {
      _answers[questionId] = <String>[];
    }

    final selectedOptions = _answers[questionId] as List<String>;

    return Column(
      children: [
        for (final opt in options)
          CheckboxListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(opt),
            value: selectedOptions.contains(opt),
            onChanged: (checked) {
              setState(() {
                final currentList = List<String>.from(_answers[questionId] as List<String> ?? []);
                if (checked == true) {
                  currentList.add(opt);
                } else {
                  currentList.remove(opt);
                }
                _answers[questionId] = currentList;
              });
            },
          ),
      ],
    );
  }

  List<String> _optionsOf(SurveyQuestion q) {
    final raw = q.options;
    if (raw is List) {
      return raw.map((e) {
        if (e is String) return e;
        if (e is Map && e['label'] != null) return e['label'].toString();
        if (e is Map && e['value'] != null) return e['value'].toString();
        return e.toString();
      }).toList();
    }
    return const [];
  }
}
