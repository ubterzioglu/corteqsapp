import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../core/config/env.dart';
import '../core/storage/local_store.dart';
import 'app.dart';

/// Uygulama başlatma — Supabase init + SharedPreferences + ProviderScope.
/// Tüm flavor entrypoint'leri (main_dev/staging/prod) buraya gelir.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Env.isConfigured) {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      // ignore: deprecated_member_use
      anonKey: Env.supabaseAnonKey,
    );
  } else {
    // Env verilmemişse (örn. ilk `flutter run` denemesi) uygulama yine açılır;
    // Supabase çağrıları yapılana kadar çökme olmaz. CI/gerçek çalıştırma
    // --dart-define ile URL+anon key verir (docs/contract/decisions.md).
    debugPrint('UYARI: SUPABASE_URL/ANON_KEY verilmedi — Supabase init atlandı.');
  }

  final prefs = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        localStoreProvider.overrideWithValue(LocalStore(prefs)),
      ],
      child: const App(),
    ),
  );
}
