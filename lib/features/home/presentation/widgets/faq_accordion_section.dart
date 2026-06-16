import 'package:flutter/material.dart';

import '../../../../core/ui/design_tokens.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';

/// SSS accordion bölümü (app.md 346). Web'deki uzun SEO metin blokları yerine
/// mobil-dostu genişleyebilir cam kartlar.
class FaqAccordionSection extends StatelessWidget {
  const FaqAccordionSection({super.key});

  static const _faqs = <(String, String)>[
    ('CorteQS nedir?', 'Diaspora üyelerini buluşturan topluluk ve dizin platformu.'),
    ('Nasıl üye olurum?', 'Giriş ekranından e-posta veya Google ile kayıt olabilirsin.'),
    ('Cadde nedir?', 'Topluluk akışı, kafeler ve çarşı ilanlarını içeren sosyal alan.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Sıkça Sorulanlar'),
        const SizedBox(height: AppSpacing.sm),
        GlassCard(
          key: const Key('home_faq_section'),
          padding: EdgeInsets.zero,
          child: Theme(
            data: Theme.of(context)
                .copyWith(dividerColor: Colors.transparent),
            child: Column(
              children: [
                for (final faq in _faqs)
                  ExpansionTile(
                    title: Text(
                      faq.$1,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    childrenPadding:
                        const EdgeInsets.fromLTRB(16, 0, 16, 16),
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          faq.$2,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
