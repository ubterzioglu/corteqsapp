import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/route_paths.dart';
import '../../../shared/providers/auth_providers.dart';
import 'widgets/hero_card.dart';
import 'widgets/quick_actions_grid.dart';
import 'widgets/faq_accordion_section.dart';

/// Ana sayfa — ürün girişi + keşif (app.md 339-347). Web SEO/meta blokları taşınmaz.
/// CustomScrollView + modüler kartlar. CTA'lar: giriş, dizin, Cadde, profil.
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return Scaffold(
      body: CustomScrollView(
        key: const Key('home_page'),
        slivers: [
          const SliverAppBar(
            pinned: true,
            title: Text('Corteqs'),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList.list(
              children: [
                HeroCard(
                  isLoggedIn: isLoggedIn,
                  onPrimaryAction: () => context.go(
                    isLoggedIn ? RoutePaths.directory : RoutePaths.login,
                  ),
                ),
                const SizedBox(height: 24),
                const QuickActionsGrid(),
                const SizedBox(height: 24),
                const FaqAccordionSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
