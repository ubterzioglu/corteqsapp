import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/presentation/login_page.dart';
import '../../features/cadde/presentation/cadde_feed_page.dart';
import '../../features/cadde/presentation/cafe_detail_page.dart';
import '../../features/cadde/presentation/carsi_page.dart';
import '../../features/directory/presentation/directory_page.dart';
import '../../features/directory/presentation/public_profile_page.dart';
import '../../features/home/presentation/home_page.dart';
import '../../features/lansman/presentation/survey_page.dart';
import '../../features/profile/presentation/self_profile_page.dart';
import '../../shared/providers/auth_providers.dart';
import 'app_shell.dart';
import 'route_paths.dart';

final _rootKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellHomeKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final _shellDirectoryKey = GlobalKey<NavigatorState>(debugLabel: 'directory');
final _shellCaddeKey = GlobalKey<NavigatorState>(debugLabel: 'cadde');
final _shellProfileKey = GlobalKey<NavigatorState>(debugLabel: 'profile');

/// Uygulama router'ı. Auth oturumunu izler; oturum değişince redirect yeniden
/// değerlendirilir. Guard mantığı app.md 214-248 ile birebir.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    navigatorKey: _rootKey,
    initialLocation: RoutePaths.home,
    refreshListenable: _AuthRefresh(ref),
    redirect: (context, state) {
      final loggedIn = ref.read(isLoggedInProvider);
      final location = state.matchedLocation;
      final goingToLogin = location == RoutePaths.login;

      final needsAuth = RoutePaths.protectedRoots.any(
        (root) => location == root || location.startsWith('$root/'),
      );

      if (!loggedIn && needsAuth && !goingToLogin) {
        final next = Uri.encodeComponent(state.uri.toString());
        return '${RoutePaths.login}?next=$next';
      }
      if (loggedIn && goingToLogin) {
        return RoutePaths.profile;
      }
      return null;
    },
    routes: [
      // Kanonik public profil redirect: eski /directory/profile/:userId → catalog
      GoRoute(
        path: RoutePaths.directoryProfileLegacy,
        redirect: (context, state) {
          final userId = state.pathParameters['userId'];
          if (userId == null) return RoutePaths.directory;
          // UUID-vs-slug ayrımı Phase 3'te ProfileRouteResolver ile netleşecek.
          return RoutePaths.directoryCatalogOf(userId);
        },
      ),
      // Public anket (auth gerektirmez) — root navigator.
      GoRoute(
        path: RoutePaths.survey,
        parentNavigatorKey: _rootKey,
        builder: (context, state) =>
            SurveyPage(slug: state.pathParameters['slug']!),
      ),
      GoRoute(
        path: RoutePaths.login,
        parentNavigatorKey: _rootKey,
        builder: (context, state) =>
            LoginPage(next: state.uri.queryParameters['next']),
      ),
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) =>
            AppShell(navigationShell: navigationShell),
        branches: [
          StatefulShellBranch(
            navigatorKey: _shellHomeKey,
            routes: [
              GoRoute(
                path: RoutePaths.home,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellDirectoryKey,
            routes: [
              GoRoute(
                path: RoutePaths.directory,
                builder: (context, state) => const DirectoryPage(),
                routes: [
                  // Kanonik public profil: /directory/catalog/:slug
                  GoRoute(
                    path: 'catalog/:slug',
                    builder: (context, state) => PublicProfilePage(
                      slug: state.pathParameters['slug']!,
                    ),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellCaddeKey,
            routes: [
              GoRoute(
                path: RoutePaths.cadde,
                builder: (context, state) => const CaddeFeedPage(),
                routes: [
                  GoRoute(
                    path: 'cafe/:cafeId',
                    builder: (context, state) => CafeDetailPage(
                      cafeId: state.pathParameters['cafeId']!,
                    ),
                  ),
                  GoRoute(
                    path: 'carsi',
                    builder: (context, state) => const CarsiPage(),
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            navigatorKey: _shellProfileKey,
            routes: [
              GoRoute(
                path: RoutePaths.profile,
                builder: (context, state) => const SelfProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
});

/// Auth durumu değişince GoRouter'ı yeniden değerlendirmeye zorlar.
class _AuthRefresh extends ChangeNotifier {
  _AuthRefresh(Ref ref) {
    ref.listen(authStateChangesProvider, (_, _) => notifyListeners());
  }
}
