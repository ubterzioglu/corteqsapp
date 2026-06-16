import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/route_paths.dart';
import '../../../core/ui/design_tokens.dart';
import '../../../shared/providers/auth_providers.dart';
import 'widgets/hero_card.dart';
import 'widgets/quick_actions_grid.dart';
import 'widgets/faq_accordion_section.dart';

/// Ana sayfa — diasporanın komuta merkezi (app.md 339-347).
/// Kişiselleştirilmiş selamlama + hero + hızlı eylemler + SSS.
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final profile = ref.watch(authProfileProvider).value;
    final firstName = (profile?.fullName ?? '').trim().split(' ').first;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: CustomScrollView(
        key: const Key('home_page'),
        slivers: [
          const SliverAppBar(
            pinned: true,
            backgroundColor: Colors.transparent,
            title: Text('CorteQS'),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 120),
            sliver: SliverList.list(
              children: [
                _Greeting(firstName: firstName.isEmpty ? null : firstName),
                const SizedBox(height: AppSpacing.lg),
                HeroCard(
                  isLoggedIn: isLoggedIn,
                  onPrimaryAction: () => context.go(
                    isLoggedIn ? RoutePaths.directory : RoutePaths.login,
                  ),
                  onSecondaryAction: () => context.go(RoutePaths.directory),
                ),
                const SizedBox(height: AppSpacing.lg),
                const QuickActionsGrid(),
                const SizedBox(height: AppSpacing.lg),
                const FaqAccordionSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Greeting extends StatelessWidget {
  const _Greeting({this.firstName});
  final String? firstName;

  @override
  Widget build(BuildContext context) {
    final text = Theme.of(context).textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          firstName != null ? 'Merhaba $firstName 👋' : 'Merhaba 👋',
          style: text.headlineMedium,
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Bugün dünyadaki Türk ağına nereden bağlanmak istersin?',
          style: text.bodyMedium,
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppColors.green,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Flexible(
              child: Text(
                'Global Network Active',
                style: text.bodySmall,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
