/// Typed rota sabitleri — web kanonik path'leri korunur (docs/contract/routes.md).
/// İlk mobil dalga (Phase 2-5) + admin-lite kökü.
class RoutePaths {
  const RoutePaths._();

  static const home = '/';
  static const login = '/login';
  static const resetPassword = '/reset-password';
  static const profile = '/profile';
  static const directory = '/directory';

  /// Kanonik public profil.
  static const directoryCatalog = '/directory/catalog/:slug';
  static String directoryCatalogOf(String slug) => '/directory/catalog/$slug';

  /// Eski biçim — kanonik'e redirect edilir.
  static const directoryProfileLegacy = '/directory/profile/:userId';

  static const cadde = '/cadde';
  static const caddeCafe = '/cadde/cafe/:cafeId';
  static String caddeCafeOf(String cafeId) => '/cadde/cafe/$cafeId';
  static const caddeCarsi = '/cadde/carsi';
  static const caddeCarsiItem = '/cadde/carsi/:itemId';
  static String caddeCarsiItemOf(String itemId) => '/cadde/carsi/$itemId';

  static const contact = '/iletisim';

  /// Public anket akışı (auth gerektirmez).
  static const survey = '/anket/:slug';
  static String surveyOf(String slug) => '/anket/$slug';

  /// Auth gerektiren kökler (router redirect guard için).
  static const protectedRoots = <String>{profile, directory, cadde};
}
