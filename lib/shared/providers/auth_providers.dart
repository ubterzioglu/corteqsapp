import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../core/network/supabase_provider.dart';
import '../../features/auth/data/auth_repository.dart';

// authStateChangesProvider + authRepositoryProvider + authProfileProvider
// auth_repository.dart içinde tanımlıdır; buradan re-export edilir.
export '../../features/auth/data/auth_repository.dart'
    show authStateChangesProvider, authRepositoryProvider, authProfileProvider;

/// Mevcut oturum (yoksa null).
final currentSessionProvider = Provider<Session?>((ref) {
  ref.watch(authStateChangesProvider);
  return ref.watch(supabaseClientProvider).auth.currentSession;
});

/// Kullanıcı giriş yapmış mı?
final isLoggedInProvider = Provider<bool>((ref) {
  return ref.watch(currentSessionProvider) != null;
});

/// Mevcut kullanıcının feature key seti.
/// Kaynak RPC: `get_current_user_features` (docs/contract/rpcs.md).
final featureFlagsProvider = FutureProvider<Set<String>>((ref) async {
  final loggedIn = ref.watch(isLoggedInProvider);
  if (!loggedIn) return <String>{};

  final client = ref.watch(supabaseClientProvider);
  final response = await client.rpc('get_current_user_features');

  if (response is List) {
    return response
        .map((e) => e is Map ? e['feature_key']?.toString() : e?.toString())
        .whereType<String>()
        .toSet();
  }
  return <String>{};
});

/// Bir feature key'in mevcut kullanıcıda etkin olup olmadığı.
/// İstemci gating yalnız UX'tir; gerçek yetki RLS'te (docs/contract/feature_keys.md).
final hasFeatureProvider = Provider.family<bool, String>((ref, featureKey) {
  final flags = ref.watch(featureFlagsProvider).value ?? const <String>{};
  return flags.contains(featureKey);
});
