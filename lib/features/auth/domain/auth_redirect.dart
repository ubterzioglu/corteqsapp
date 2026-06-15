/// Login sonrası dönülecek hedefi çözer.
/// Web karşılığı: `LoginPage.tsx` nextPath mantığı —
/// `next` veya `redirect` query param'ı `/` ile başlıyorsa kullanılır, yoksa `/profile`.
///
/// Saf fonksiyon — kolay test edilir (plan: auth_redirect_resolver_test.dart).
String resolveNextPath({String? next, String? redirect}) {
  final raw = (next?.trim().isNotEmpty ?? false)
      ? next!.trim()
      : (redirect?.trim() ?? '');
  return raw.startsWith('/') ? raw : '/profile';
}
