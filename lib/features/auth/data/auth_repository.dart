import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../domain/auth_profile.dart';

/// Auth işlemleri — web `LoginPage.tsx` + `AuthProvider` davranışının karşılığı.
/// Yetki istemcide uygulanmaz; bu yalnız Supabase Auth SDK sarmalayıcısıdır.
class AuthRepository {
  AuthRepository(this._client);
  final SupabaseClient _client;

  /// OAuth callback için mobil deep link (Android/iOS custom scheme).
  /// Supabase dashboard'da redirect URL olarak da kayıtlı olmalı.
  static const oauthRedirectMobile = 'com.corteqs.corteqs_app://login-callback';

  /// Platforma göre redirect hedefi:
  /// - Web: mevcut origin (örn. https://....netlify.app) — custom scheme web'de çalışmaz.
  /// - Mobil: custom scheme deep link.
  /// Web origin'i ayrıca Supabase dashboard'da Redirect URL olarak kayıtlı olmalı.
  static String get oauthRedirect =>
      kIsWeb ? Uri.base.origin : oauthRedirectMobile;

  Session? get currentSession => _client.auth.currentSession;
  User? get currentUser => _client.auth.currentUser;
  Stream<AuthState> get onAuthStateChange => _client.auth.onAuthStateChange;

  Future<void> signInWithPassword({
    required String email,
    required String password,
  }) async {
    await _client.auth.signInWithPassword(email: email, password: password);
  }

  /// Google OAuth — web yalnız Google kullanıyor (verify: auth/v1/settings google:true).
  Future<void> signInWithGoogle() async {
    await _client.auth.signInWithOAuth(
      OAuthProvider.google,
      redirectTo: oauthRedirect,
    );
  }

  Future<void> signUp({
    required String email,
    required String password,
  }) async {
    await _client.auth.signUp(
      email: email,
      password: password,
      emailRedirectTo: oauthRedirect,
    );
  }

  Future<void> signOut() => _client.auth.signOut();

  /// Profil özeti — RPC `get_current_user_profile` (docs/contract/rpcs.md).
  /// Oturum yoksa null.
  Future<AuthProfile?> fetchProfile() async {
    if (currentSession == null) return null;
    final result = await _client.rpc('get_current_user_profile');
    if (result is Map<String, dynamic>) {
      return AuthProfile.fromJson(result);
    }
    if (result is List && result.isNotEmpty && result.first is Map) {
      return AuthProfile.fromJson(
        Map<String, dynamic>.from(result.first as Map),
      );
    }
    return null;
  }
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(ref.watch(supabaseClientProvider));
});

/// Mevcut kullanıcının profil özeti.
final authProfileProvider = FutureProvider<AuthProfile?>((ref) async {
  // Oturum değişince yeniden çek.
  ref.watch(authStateChangesProvider);
  return ref.watch(authRepositoryProvider).fetchProfile();
});

/// Auth durum akışı (repository üzerinden).
final authStateChangesProvider = StreamProvider<AuthState>((ref) {
  return ref.watch(authRepositoryProvider).onAuthStateChange;
});
