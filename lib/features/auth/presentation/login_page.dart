import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'login_controller.dart';

/// Giriş / Kayıt ekranı — web `LoginPage.tsx` karşılığı.
/// login/signup tab, Google OAuth, email/şifre form, hata MaterialBanner.
/// Başarılı girişte router guard `/login` → `/profile` (veya `next`) yönlendirir.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, this.next});

  /// Başarılı girişten sonra dönülecek hedef (şu an guard `/profile`'a alır;
  /// `next` derin-bağ akışında Phase 2 sonu deep-link ile kullanılacak).
  final String? next;

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  AuthMode _mode = AuthMode.login;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    await ref.read(loginControllerProvider.notifier).submit(
          mode: _mode,
          email: _emailCtrl.text.trim(),
          password: _passwordCtrl.text,
        );
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginControllerProvider);
    final isLoading = state.isLoading;
    final isLogin = _mode == AuthMode.login;

    return Scaffold(
      appBar: AppBar(title: const Text('Giriş Yap')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            key: const Key('login_page'),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (state.hasError)
                MaterialBanner(
                  key: const Key('login_error_banner'),
                  content: Text(_friendlyError(state.error!)),
                  backgroundColor:
                      Theme.of(context).colorScheme.errorContainer,
                  actions: [
                    TextButton(
                      onPressed: () => ref.invalidate(loginControllerProvider),
                      child: const Text('Kapat'),
                    ),
                  ],
                ),
              const SizedBox(height: 8),
              SegmentedButton<AuthMode>(
                key: const Key('login_tab_button'),
                segments: const [
                  ButtonSegment(value: AuthMode.login, label: Text('Giriş')),
                  ButtonSegment(value: AuthMode.signup, label: Text('Kayıt')),
                ],
                selected: {_mode},
                onSelectionChanged: isLoading
                    ? null
                    : (s) => setState(() => _mode = s.first),
              ),
              const SizedBox(height: 16),
              OutlinedButton.icon(
                key: const Key('login_google_button'),
                onPressed: isLoading
                    ? null
                    : () => ref
                        .read(loginControllerProvider.notifier)
                        .signInWithGoogle(),
                icon: const Icon(Icons.g_mobiledata),
                label: const Text('Google ile devam et'),
              ),
              const SizedBox(height: 16),
              const Divider(),
              const SizedBox(height: 8),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      key: const Key('login_email_input'),
                      controller: _emailCtrl,
                      keyboardType: TextInputType.emailAddress,
                      autofillHints: const [AutofillHints.email],
                      decoration: const InputDecoration(labelText: 'E-posta'),
                      validator: (v) =>
                          (v == null || !v.contains('@')) ? 'Geçerli e-posta girin' : null,
                    ),
                    const SizedBox(height: 12),
                    TextFormField(
                      key: const Key('login_password_input'),
                      controller: _passwordCtrl,
                      obscureText: true,
                      autofillHints: const [AutofillHints.password],
                      decoration: const InputDecoration(labelText: 'Şifre'),
                      validator: (v) =>
                          (v == null || v.length < 6) ? 'En az 6 karakter' : null,
                    ),
                    const SizedBox(height: 20),
                    FilledButton(
                      key: const Key('login_submit_button'),
                      onPressed: isLoading ? null : _submit,
                      child: isLoading
                          ? const SizedBox(
                              height: 20,
                              width: 20,
                              child: CircularProgressIndicator(strokeWidth: 2),
                            )
                          : Text(isLogin ? 'Giriş Yap' : 'Kayıt Ol'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _friendlyError(Object error) {
    final msg = error.toString();
    if (msg.contains('Invalid login credentials')) {
      return 'E-posta veya şifre hatalı.';
    }
    if (msg.contains('already registered')) {
      return 'Bu e-posta zaten kayıtlı.';
    }
    return 'İşlem başarısız: $msg';
  }
}
