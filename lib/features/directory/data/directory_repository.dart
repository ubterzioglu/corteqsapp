import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../domain/directory_filters.dart';
import '../domain/directory_models.dart';

/// Dizin veri erişimi — web `src/lib/catalog-directory.ts` karşılığı.
/// Tüm sorgular Supabase RPC/tablo üzerinden; yetki RLS'te.
class DirectoryRepository {
  DirectoryRepository(this._client);
  final SupabaseClient _client;

  /// Birleşik dizin araması. RPC: `search_directory_catalog`.
  /// Parametre adları web ile birebir (p_search_text/p_role_key/...).
  Future<List<DirectoryRow>> search(DirectoryFilters f) async {
    final data = await _client.rpc('search_directory_catalog', params: {
      'p_search_text': f.searchText.trim().isEmpty ? null : f.searchText.trim(),
      'p_role_key': f.roleKey == 'all' ? null : f.roleKey,
      'p_country_code': f.countryCode.isEmpty ? null : f.countryCode,
      'p_city': f.city.trim().isEmpty ? null : f.city.trim(),
      'p_featured_only': f.featuredOnly,
    });

    if (data is! List) return const [];
    return data
        .whereType<Map>()
        .map((e) => DirectoryRow.fromJson(Map<String, dynamic>.from(e)))
        .toList();
  }

  /// Dizinde görünür rol seçenekleri (`roles`, is_directory_visible != false).
  Future<List<DirectoryRoleOption>> roleOptions() async {
    final data = await _client
        .from('roles')
        .select('key, label, is_directory_visible')
        .eq('is_active', true)
        .order('sort_order', ascending: true);

    return (data as List)
        .where((r) => (r as Map)['is_directory_visible'] != false)
        .map((r) => DirectoryRoleOption(
              key: (r as Map)['key'] as String,
              label: r['label'] as String,
            ))
        .toList();
  }

  /// Toplam katalog kaydı sayısı (üst bilgi için).
  Future<int> totalCount() async {
    final res = await _client
        .from('catalog_items')
        .count(CountOption.exact);
    return res;
  }

  /// Slug ile kanonik public profil sayfası. RPC: `get_catalog_item_public_page_v2(p_slug)`.
  /// (types.ts doğrulandı: profil-by-slug bu RPC'dir; `get_catalog_item_profile`
  /// ise p_item_id alır.) Dönen ham JSON Phase 3 view-model'inde tiplenecek.
  Future<Map<String, dynamic>?> publicPageBySlug(String slug) async {
    final data = await _client.rpc('get_catalog_item_public_page_v2', params: {
      'p_slug': slug,
    });
    return _asMap(data);
  }

  /// item_id ile profil. RPC: `get_catalog_item_profile(p_item_id)`.
  Future<Map<String, dynamic>?> profileByItemId(String itemId) async {
    final data = await _client.rpc('get_catalog_item_profile', params: {
      'p_item_id': itemId,
    });
    return _asMap(data);
  }

  Map<String, dynamic>? _asMap(dynamic data) {
    if (data is Map) return Map<String, dynamic>.from(data);
    if (data is List && data.isNotEmpty && data.first is Map) {
      return Map<String, dynamic>.from(data.first as Map);
    }
    return null;
  }
}

final directoryRepositoryProvider = Provider<DirectoryRepository>((ref) {
  return DirectoryRepository(ref.watch(supabaseClientProvider));
});
