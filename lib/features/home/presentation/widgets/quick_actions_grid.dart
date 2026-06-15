import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../app/router/route_paths.dart';

/// Hızlı eylem ızgarası — dizin / Cadde / profil keşif kartları (app.md 343).
class QuickActionsGrid extends StatelessWidget {
  const QuickActionsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = <_QuickAction>[
      const _QuickAction('Dizin', Icons.people, RoutePaths.directory),
      const _QuickAction('Cadde', Icons.forum, RoutePaths.cadde),
      const _QuickAction('Profilim', Icons.person, RoutePaths.profile),
      const _QuickAction('İletişim', Icons.mail_outline, RoutePaths.contact),
    ];

    return GridView.count(
      key: const Key('home_quick_actions'),
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      childAspectRatio: 2.4,
      children: [
        for (final a in actions)
          Card(
            child: InkWell(
              onTap: () => context.go(a.path),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(a.icon),
                    const SizedBox(width: 8),
                    Flexible(child: Text(a.label)),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}

class _QuickAction {
  const _QuickAction(this.label, this.icon, this.path);
  final String label;
  final IconData icon;
  final String path;
}
