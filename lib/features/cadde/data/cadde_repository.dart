import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../domain/cadde_feed_mapper.dart';
import '../domain/cadde_models.dart';

/// Cadde veri erişimi — web `src/lib/cadde-api.ts` karşılığı (çekirdek alt küme).
/// Feed: RPC list_cadde_feed_v1 (cursor). Mutasyonlar RPC (RLS + rate-limit + bildirim DB'de).
class CaddeRepository {
  CaddeRepository(this._client);
  final SupabaseClient _client;

  static const pageSize = 20;

  String? get _userId => _client.auth.currentUser?.id;

  /// Feed sayfası çek. [cursor] null ise ilk sayfa.
  Future<CaddeFeedPage> fetchFeed({
    Map<String, dynamic>? cursor,
    List<String> countries = const [],
    List<String> cities = const [],
    bool bridge = false,
    String diaspora = 'tr',
  }) async {
    final data = await _client.rpc('list_cadde_feed_v1', params: {
      'p_filters': {
        'countries': countries,
        'cities': cities,
        'bridge': bridge,
        'diaspora': diaspora,
      },
      'p_cursor': cursor,
      'p_limit': pageSize,
    });

    final map = data is Map ? Map<String, dynamic>.from(data) : const {};
    final rawItems = (map['items'] as List?) ?? const [];
    final ids = rawItems
        .whereType<Map>()
        .map((e) => e['id']?.toString())
        .whereType<String>()
        .toList();

    final reactions = await _fetchReactions(ids);
    final comments = await _fetchComments(ids);

    return CaddeFeedMapper.mapPage(
      data,
      reactionRows: reactions,
      commentRows: comments,
      currentUserId: _userId,
    );
  }

  Future<List<Map<String, dynamic>>> _fetchReactions(List<String> postIds) async {
    if (postIds.isEmpty) return const [];
    final data = await _client
        .from('cadde_post_reactions')
        .select('id, post_id, user_id, reaction_type')
        .inFilter('post_id', postIds);
    return (data as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  Future<List<Map<String, dynamic>>> _fetchComments(List<String> postIds) async {
    if (postIds.isEmpty) return const [];
    final data = await _client
        .from('cadde_post_comments')
        .select('id, post_id, user_id, body, created_at')
        .inFilter('post_id', postIds)
        .order('created_at', ascending: true);
    return (data as List)
        .map((e) => Map<String, dynamic>.from(e as Map))
        .toList();
  }

  /// Post oluştur — RPC create_cadde_post_v1. Yeni post id döner.
  Future<String> createPost({
    required String body,
    CaddePostType type = CaddePostType.text,
    String? title,
    String country = '',
    String city = '',
    String diaspora = 'tr',
  }) async {
    final data = await _client.rpc('create_cadde_post_v1', params: {
      'p_post_type': type.name,
      'p_title': (title != null && title.trim().isNotEmpty) ? title.trim() : null,
      'p_body': body,
      'p_country': country,
      'p_city': city,
      'p_is_bridge': false,
      'p_need_category': null,
      'p_interests': <String>[],
      'p_cafe_id': null,
      'p_diaspora_key': diaspora,
    });
    return data.toString();
  }

  /// Reaksiyon toggle — RPC toggle_cadde_reaction_v1. true=eklendi, false=kaldırıldı.
  Future<bool> toggleReaction(String postId, CaddeReactionType type) async {
    final data = await _client.rpc('toggle_cadde_reaction_v1', params: {
      'p_post_id': postId,
      'p_reaction_type': type.name,
    });
    return data == true;
  }

  /// Yorum oluştur — RPC create_cadde_comment_v1.
  Future<void> createComment(String postId, String body) async {
    await _client.rpc('create_cadde_comment_v1', params: {
      'p_post_id': postId,
      'p_body': body,
    });
  }
}

final caddeRepositoryProvider = Provider<CaddeRepository>((ref) {
  return CaddeRepository(ref.watch(supabaseClientProvider));
});
