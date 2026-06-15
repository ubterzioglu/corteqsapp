import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../../auth/data/auth_repository.dart';
import '../domain/profile_models.dart';
import '../domain/profile_view_model.dart';

/// Profil veri erişimi — RPC `get_current_user_profile` / `get_current_user_dashboard`.
class ProfileRepository {
  ProfileRepository(this._client);
  final SupabaseClient _client;

  Future<CurrentUserProfile?> fetchCurrentProfile() async {
    if (_client.auth.currentSession == null) return null;
    final data = await _client.rpc('get_current_user_profile');
    final map = _asMap(data);
    return map == null ? null : CurrentUserProfile.fromJson(map);
  }

  /// Açık dashboard erişim sayısı (summary header için).
  Future<int> fetchDashboardCount() async {
    if (_client.auth.currentSession == null) return 0;
    final data = await _client.rpc('get_current_user_dashboard');
    if (data is List) return data.length;
    if (data is Map && data['dashboards'] is List) {
      return (data['dashboards'] as List).length;
    }
    return 0;
  }

  /// Profil alanı güncelle — RPC `update_profile_attribute`.
  /// Parametreler types.ts'ten: attribute_key / attribute_value / visibility?.
  Future<void> updateAttribute(
    String key,
    dynamic value, {
    String? visibility,
  }) async {
    final params = <String, dynamic>{
      'attribute_key': key,
      'attribute_value': value,
    };
    if (visibility != null) params['visibility'] = visibility;
    await _client.rpc('update_profile_attribute', params: params);
  }

  Map<String, dynamic>? _asMap(dynamic data) {
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is List && data.isNotEmpty && data.first is Map) {
      return Map<String, dynamic>.from(data.first as Map);
    }
    return null;
  }
}

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(supabaseClientProvider));
});

/// Mevcut kullanıcı profili.
final currentProfileProvider =
    FutureProvider<CurrentUserProfile?>((ref) async {
  ref.watch(authStateChangesProvider);
  return ref.watch(profileRepositoryProvider).fetchCurrentProfile();
});

/// Self profil summary görünüm modeli (profil + dashboard count birleşik).
final selfProfileViewModelProvider =
    FutureProvider<SelfProfileViewModel?>((ref) async {
  final profile = await ref.watch(currentProfileProvider.future);
  if (profile == null) return null;
  final dashboardCount =
      await ref.watch(profileRepositoryProvider).fetchDashboardCount();
  return SelfProfileViewModel.from(profile, dashboardCount: dashboardCount);
});
