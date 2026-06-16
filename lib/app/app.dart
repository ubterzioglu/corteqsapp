import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../core/ui/app_theme.dart';
import '../shared/widgets/corteqs_background.dart';
import 'router/app_router.dart';

/// Kök widget — MaterialApp.router ile go_router'a bağlanır, CorteQS koyu
/// temasını kullanır. `builder` ile ambient marka arka planı tüm rotaların
/// arkasına yerleşir (Scaffold'lar şeffaf).
class App extends ConsumerWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(appRouterProvider);
    return MaterialApp.router(
      title: 'Corteqs',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark(),
      darkTheme: AppTheme.dark(),
      themeMode: ThemeMode.dark,
      routerConfig: router,
      builder: (context, child) => CorteqsBackground(child: child),
    );
  }
}
