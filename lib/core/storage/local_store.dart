import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Yerel anahtar-değer deposu — yalnız UI tercihleri, form taslakları,
/// son kullanılan filtreler ve okundu bayrakları için. Ürün verisinin
/// kopya sahibi DEĞİLDİR (remote source of truth korunur, app.md 411-413).
///
/// Hassas oturum bilgisi supabase_flutter / flutter_secure_storage tarafından yönetilir.
class LocalStore {
  LocalStore(this._prefs);
  final SharedPreferences _prefs;

  String? getString(String key) => _prefs.getString(key);
  Future<void> setString(String key, String value) =>
      _prefs.setString(key, value);
  Future<void> remove(String key) => _prefs.remove(key);
}

/// Bootstrap'ta override edilir (gerçek SharedPreferences instance'ı ile).
final localStoreProvider = Provider<LocalStore>((ref) {
  throw UnimplementedError('localStoreProvider bootstrap içinde override edilmeli');
});
