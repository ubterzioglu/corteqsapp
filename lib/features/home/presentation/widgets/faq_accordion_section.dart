import 'package:flutter/material.dart';

/// SSS accordion bölümü (app.md 346). Web'deki uzun SEO metin blokları yerine
/// mobil-dostu genişleyebilir kartlar.
class FaqAccordionSection extends StatelessWidget {
  const FaqAccordionSection({super.key});

  static const _faqs = <(String, String)>[
    ('Corteqs nedir?', 'Diaspora üyelerini buluşturan topluluk ve dizin platformu.'),
    ('Nasıl üye olurum?', 'Giriş ekranından e-posta veya Google ile kayıt olabilirsin.'),
    ('Cadde nedir?', 'Topluluk akışı, kafeler ve çarşı ilanlarını içeren sosyal alan.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Card(
      key: const Key('home_faq_section'),
      child: Column(
        children: [
          for (final faq in _faqs)
            ExpansionTile(
              title: Text(faq.$1),
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(faq.$2),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
