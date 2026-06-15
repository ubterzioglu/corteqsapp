import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Ana kabuk — bottom nav ile member shell (Home / Directory / Cadde / Profile).
/// StatefulShellRoute her sekme için ayrı navigation stack tutar.
/// Test key'leri integration_test içindir (app.md 530,560).
class AppShell extends StatelessWidget {
  const AppShell({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) => navigationShell.goBranch(
          index,
          initialLocation: index == navigationShell.currentIndex,
        ),
        destinations: const [
          NavigationDestination(
            key: Key('bottom_nav_home'),
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          NavigationDestination(
            key: Key('bottom_nav_directory'),
            icon: Icon(Icons.people_outline),
            selectedIcon: Icon(Icons.people),
            label: 'Dizin',
          ),
          NavigationDestination(
            key: Key('bottom_nav_cadde'),
            icon: Icon(Icons.forum_outlined),
            selectedIcon: Icon(Icons.forum),
            label: 'Cadde',
          ),
          NavigationDestination(
            key: Key('bottom_nav_profile'),
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
