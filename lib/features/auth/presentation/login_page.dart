import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/app_gradients.dart';
import '../../../core/ui/design_tokens.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/gradient_button.dart';
import 'login_controller.dart';

/// Giriş / Kayıt ekranı — web `LoginPage.tsx` karşılığı.
/// login/signup tab, Google OAuth, email/şifre form, hata banner.
/// Premium koyu cam kart + marka gradyan CTA.
class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key, this.next});

  /// Başarılı girişten sonra dönülecek hedef.
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
    final theme = Theme.of(context);
    final isLoading = state.isLoading;
    final isLogin = _mode == AuthMode.login;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          child: Column(
            key: const Key('login_page'),
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppSpacing.xl),
              const Center(child: _LogoMark()),
              const SizedBox(height: AppSpacing.md),
              Text(
                'CorteQS',
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineMedium,
              ),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Dünyadaki Türk ağına bağlan.',
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium,
              ),
              const SizedBox(height: AppSpacing.xl),
              GlassCard(
                glowColor: AppColors.purple,
                borderRadius: AppRadii.xxl,
                padding: const EdgeInsets.all(AppSpacing.lg),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (state.hasError)
                      Container(
                        key: const Key('login_error_banner'),
                        margin: const EdgeInsets.only(bottom: AppSpacing.md),
                        padding: const EdgeInsets.all(AppSpacing.md),
                        decoration: BoxDecoration(
                          color: AppColors.red.withValues(alpha: 0.14),
                          borderRadius: BorderRadius.circular(AppRadii.md),
                          border: Border.all(
                            color: AppColors.red.withValues(alpha: 0.5),
                          ),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                _friendlyError(state.error!),
                                style: theme.textTheme.bodyMedium
                                    ?.copyWith(color: AppColors.textPrimary),
                              ),
                            ),
                            TextButton(
                              onPressed: () =>
                                  ref.invalidate(loginControllerProvider),
                              child: const Text('Kapat'),
                            ),
                          ],
                        ),
                      ),
                    SegmentedButton<AuthMode>(
                      key: const Key('login_tab_button'),
                      segments: const [
                        ButtonSegment(
                            value: AuthMode.login, label: Text('Giriş')),
                        ButtonSegment(
                            value: AuthMode.signup, label: Text('Kayıt')),
                      ],
                      selected: {_mode},
                      onSelectionChanged: isLoading
                          ? null
                          : (s) => setState(() => _mode = s.first),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    OutlinedButton.icon(
                      key: const Key('login_google_button'),
                      onPressed: isLoading
                          ? null
                          : () => ref
                              .read(loginControllerProvider.notifier)
                              .signInWithGoogle(),
                      icon: const Icon(Icons.g_mobiledata_rounded, size: 22),
                      label: const Text('Google ile devam et'),
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size.fromHeight(48),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.md),
                    const _OrDivider(),
                    const SizedBox(height: AppSpacing.md),
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
                            decoration: const InputDecoration(
                              labelText: 'E-posta',
                              prefixIcon:
                                  Icon(Icons.mail_outline_rounded, size: 18),
                            ),
                            validator: (v) => (v == null || !v.contains('@'))
                                ? 'Geçerli e-posta girin'
                                : null,
                          ),
                          const SizedBox(height: AppSpacing.md),
                          TextFormField(
                            key: const Key('login_password_input'),
                            controller: _passwordCtrl,
                            obscureText: true,
                            autofillHints: const [AutofillHints.password],
                            decoration: const InputDecoration(
                              labelText: 'Şifre',
                              prefixIcon: Icon(
                                  Icons.lock_outline_rounded, size: 18),
                            ),
                            validator: (v) => (v == null || v.length < 6)
                                ? 'En az 6 karakter'
                                : null,
                          ),
                          const SizedBox(height: AppSpacing.lg),
                          GradientButton(
                            key: const Key('login_submit_button'),
                            label: isLogin ? 'Giriş Yap' : 'Kayıt Ol',
                            gradient: AppGradients.a,
                            loading: isLoading,
                            onPressed: isLoading ? null : _submit,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.lg),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.shield_outlined,
                    size: 14,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: Text(
                      'Bilgilerin güvende — gizliliğine saygı duyuyoruz.',
                      style: theme.textTheme.bodySmall,
                    ),
                  ),
                ],
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

/// Marka logo işareti — gradyan halkalı orb.
class _LogoMark extends StatelessWidget {
  const _LogoMark();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 72,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppGradients.a,
        boxShadow: [
          BoxShadow(
            color: AppColors.purple.withValues(alpha: 0.5),
            blurRadius: 28,
            spreadRadius: 2,
          ),
        ],
      ),
      child: const Icon(
        Icons.public_rounded,
        color: AppColors.textPrimary,
        size: 34,
      ),
    );
  }
}

class _OrDivider extends StatelessWidget {
  const _OrDivider();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Text('veya', style: Theme.of(context).textTheme.bodySmall),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
