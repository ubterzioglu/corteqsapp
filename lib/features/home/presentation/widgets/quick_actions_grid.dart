import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';
import '../../../../core/ui/design_tokens.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../../../shared/widgets/section_header.dart';

/// Hızlı eylem ızgarası — dizin / Cadde / profil / iletişim keşif kartları
/// (app.md 343). Cam + marka renkli ikon + basışta ölçek.
class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    const actions = <_QuickAction>[
      _QuickAction(
        'Dizin',
        Icons.people_alt_rounded,
        AppColors.blue,
        RoutePaths.directory,
      ),
      _QuickAction(
        'Cadde',
        Icons.forum_rounded,
        AppColors.purple,
        RoutePaths.cadde,
      ),
      _QuickAction(
        'Profilim',
        Icons.account_circle_rounded,
        AppColors.green,
        RoutePaths.profile,
      ),
      _QuickAction(
        'İletişim',
        Icons.mail_rounded,
        AppColors.red,
        RoutePaths.contact,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionHeader(title: 'Hızlı Erişim'),
        const SizedBox(height: AppSpacing.sm),
        GridView.count(
          key: const Key('home_quick_actions'),
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: AppSpacing.md,
          crossAxisSpacing: AppSpacing.md,
          childAspectRatio: 2.2,
          children: [
            for (final a in actions)
              GlassCard(
                glowColor: a.color,
                borderRadius: AppRadii.lg,
                padding: const EdgeInsets.all(AppSpacing.md),
                onTap: () => context.go(a.path),
                child: Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: a.color.withValues(alpha: 0.18),
                        border: Border.all(
                          color: a.color.withValues(alpha: 0.5),
                        ),
                      ),
                      child: Icon(a.icon, color: a.color, size: 20),
                    ),
                    const SizedBox(width: AppSpacing.sm),
                    Flexible(
                      child: Text(
                        a.label,
                        style: Theme.of(context).textTheme.titleMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _QuickAction {
  const _QuickAction(this.label, this.icon, this.color, this.path);
  final String label;
  final IconData icon;
  final Color color;
  final String path;
}
