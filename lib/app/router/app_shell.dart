import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../shared/widgets/floating_bottom_nav.dart';

/// Ana kabuk — yüzen cam bottom nav ile member shell
/// (Home / Directory / Cadde / Profile).
/// StatefulShellRoute her sekme için ayrı navigation stack tutar.
/// Test key'leri integration_test içindir (app.md 530,560) — korunur.
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      body: navigationShell,
      bottomNavigationBar: FloatingBottomNav(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        items: const [
          FloatingNavItem(
            itemKey: Key('bottom_nav_home'),
            icon: Icons.home_outlined,
            selectedIcon: Icons.home_rounded,
            label: 'Ana Sayfa',
          ),
          FloatingNavItem(
            itemKey: Key('bottom_nav_directory'),
            icon: Icons.people_outline_rounded,
            selectedIcon: Icons.people_rounded,
            label: 'Dizin',
          ),
          FloatingNavItem(
            itemKey: Key('bottom_nav_cadde'),
            icon: Icons.forum_outlined,
            selectedIcon: Icons.forum_rounded,
            label: 'Cadde',
          ),
          FloatingNavItem(
            itemKey: Key('bottom_nav_profile'),
            icon: Icons.person_outline_rounded,
            selectedIcon: Icons.person_rounded,
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
