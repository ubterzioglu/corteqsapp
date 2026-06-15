import 'package:flutter/material.dart';

/// Giriş ekranı — Phase 2'de DefaultTabController (login/signup), Google OAuth,
/// email/şifre TextFormField, MaterialBanner ile doldurulacak (app.md 322).
/// `next`/`redirect` query parametreleri auth_repository tarafından onurlandırılır.
class LoginPage extends StatelessWidget {
  const LoginPage({super.key, this.next});

  /// Başarılı girişten sonra dönülecek hedef (router'dan geçer).
  final String? next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Giriş Yap')),
      body: Center(
        key: const Key('login_page'),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Giriş / Kayıt (Phase 2)'),
            if (next != null) Text('next: $next'),
          ],
        ),
      ),
    );
  }
}
