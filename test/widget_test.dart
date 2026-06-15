// Foundation smoke testi — uygulama ProviderScope altında render oluyor ve
// guard giriş yapılmamış kullanıcıyı (korumasız) Home'da bırakıyor mu? (Phase 1.9.)
//
// Supabase'e dokunan provider'lar (session) override edilir; böylece test
// Supabase.initialize gerektirmeden router'ı çalıştırır.

import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:corteqs_app/app/app.dart';
import 'package:corteqs_app/shared/providers/auth_providers.dart';

void main() {
  testWidgets('App boots to Home page (giriş yapılmamış)', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          // Giriş yapılmamış kullanıcı: oturum yok.
          isLoggedInProvider.overrideWithValue(false),
        ],
        child: const App(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byKey(const Key('home_page')), findsOneWidget);
  });
}
