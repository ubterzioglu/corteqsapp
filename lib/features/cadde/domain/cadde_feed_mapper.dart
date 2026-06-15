import 'cadde_models.dart';

/// Feed RPC payload'unu (`list_cadde_feed_v1` → {items, nextCursor}) domain'e çevirir.
/// Reaksiyon/yorum satırları ayrı çekilip post id'ye göre birleştirilir (web mapRpcPost).
/// Saf fonksiyon — test edilebilir (plan: cadde_feed_pagination_mapper_test).
class CaddeFeedMapper {
  const CaddeFeedMapper._();

  static CaddeReactionType? reactionFromString(String? v) => switch (v) {
        'like' => CaddeReactionType.like,
        'support' => CaddeReactionType.support,
        'idea' => CaddeReactionType.idea,
        _ => null,
      };

  static String reactionToString(CaddeReactionType t) => t.name;

  /// Ham RPC çıktısından feed sayfası kurar.
  /// [reactionRows]: {post_id, user_id, reaction_type}, [commentRows]: {post_id, ...}.
  static CaddeFeedPage mapPage(
    dynamic rpcData, {
    List<Map<String, dynamic>> reactionRows = const [],
    List<Map<String, dynamic>> commentRows = const [],
    String? currentUserId,
  }) {
    final map = rpcData is Map ? Map<String, dynamic>.from(rpcData) : const {};
    final rawItems = (map['items'] as List?) ?? const [];
    final nextCursor = map['nextCursor'];

    final items = rawItems.whereType<Map>().map((raw) {
      final row = Map<String, dynamic>.from(raw);
      final id = (row['id'] ?? '').toString();

      final postReactions = reactionRows
          .where((r) => r['post_id']?.toString() == id)
          .toList();
      final counts = postReactions.fold<ReactionCounts>(
        const ReactionCounts(),
        (acc, r) {
          final t = reactionFromString(r['reaction_type']?.toString());
          return t == null ? acc : acc.bumped(t, 1);
        },
      );
      final viewer = <CaddeReactionType>{};
      if (currentUserId != null) {
        for (final r in postReactions) {
          if (r['user_id']?.toString() == currentUserId) {
            final t = reactionFromString(r['reaction_type']?.toString());
            if (t != null) viewer.add(t);
          }
        }
      }
      final commentCount =
          commentRows.where((c) => c['post_id']?.toString() == id).length;

      return CaddePost(
        id: id,
        authorUserId: row['author_user_id']?.toString(),
        type: (row['type'] ?? 'text').toString(),
        title: row['title']?.toString(),
        body: (row['body'] ?? '').toString(),
        country: row['country']?.toString(),
        city: row['city']?.toString(),
        createdAt: row['created_at']?.toString(),
        reactions: counts,
        commentCount: commentCount,
        viewerReactions: viewer,
      );
    }).toList();

    return CaddeFeedPage(
      items: items,
      nextCursor: nextCursor is Map
          ? Map<String, dynamic>.from(nextCursor)
          : null,
    );
  }
}
