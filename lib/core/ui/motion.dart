import 'dart:io' show Platform;

/// Ambient/sonsuz animasyonlar testte `pumpAndSettle`'ı süresiz bloke eder.
/// Bu bayrak true iken sonsuz tekrarlı animasyonlar atlanır; böylece
/// widget/integration testleri (test key'leri) takılmadan çalışır.
///
/// `flutter test` çalışırken `FLUTTER_TEST` ortam değişkeni set edilir.
/// Üretimde false — animasyonlar tam çalışır. Testler isterse override edebilir.
bool kDisableAmbientMotion = _detectTestEnv();

bool _detectTestEnv() {
  try {
    return Platform.environment.containsKey('FLUTTER_TEST');
  } catch (_) {
    return false;
  }
}
