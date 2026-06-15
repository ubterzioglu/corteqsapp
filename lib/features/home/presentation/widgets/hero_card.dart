import 'package:flutter/material.dart';

/// Ana sayfa hero kartı — marka mesajı + birincil CTA (app.md 339).
class HeroCard extends StatelessWidget {
  const HeroCard({
    super.key,
    required this.isLoggedIn,
    required this.onPrimaryAction,
  });

  final bool isLoggedIn;
  final VoidCallback onPrimaryAction;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Card(
      key: const Key('home_hero_card'),
      color: scheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Diasporayı birbirine bağlayan ağ',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              'Üyeleri keşfet, toplulukla bağlan, profilini öne çıkar.',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: onPrimaryAction,
              child: Text(isLoggedIn ? 'Dizinde Ara' : 'Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}
