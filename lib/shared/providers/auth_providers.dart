import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/network/supabase_provider.dart';

/// Supabase auth durum akışını Riverpod'a köprüler.
/// Router redirect guard bunu izler (oturum değişince rotalar yeniden değerlendirilir).
final authStateChangesProvider = StreamProvider<AuthState>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return client.auth.onAuthStateChange;
});

/// Mevcut oturum (yoksa null). Senkron erişim için.
final currentSessionProvider = Provider<Session?>((ref) {
  // Akışı izleyerek değişimlerde yeniden hesaplanır.
  ref.watch(authStateChangesProvider);
  return ref.watch(supabaseClientProvider).auth.currentSession;
});

/// Kullanıcı giriş yapmış mı?
final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(currentSessionProvider) != null;
});

/// Mevcut kullanıcının feature key seti.
/// Kaynak RPC: `get_current_user_features` (Schema Pack: docs/contract/rpcs.md).
/// Gerçek alan/biçim Phase 4'te RPC çıktısına göre tiplenecek; şimdilik key seti döner.
final featureFlagsProvider = FutureProvider<Set<String>>((ref) async {
  final loggedIn = ref.watch(isLoggedInProvider);
  if (!loggedIn) return <String>{};

  final client = ref.watch(supabaseClientProvider);
  final response = await client.rpc('get_current_user_features');

  // RPC çıktısı henüz tiplenmedi (Phase 0 drift uzlaştırması sonrası netleşecek).
  // Beklenen: feature key string listesi içeren bir yapı.
  if (response is List) {
    return response
        .map((e) => e is Map ? e['feature_key']?.toString() : e?.toString())
        .whereType<String>()
        .toSet();
  }
  return <String>{};
});

/// Bir feature key'in mevcut kullanıcıda etkin olup olmadığını döner.
/// İstemci gating yalnız UX'tir; gerçek yetki RLS'tedir (docs/contract/feature_keys.md).
final hasFeatureProvider = Provider.family<bool, String>((ref, featureKey) {
  final flags = ref.watch(featureFlagsProvider).value ?? const <String>{};
  return flags.contains(featureKey);
});
