import 'package:freezed_annotation/freezed_annotation.dart';

part 'cadde_models.freezed.dart';

/// Cadde reaksiyon türleri (web: like/support/idea).
enum CaddeReactionType { like, support, idea }

/// Post türü (web cadde-schemas: text/question/offer/event).
enum CaddePostType { text, question, offer, event }

/// Reaksiyon sayaçları.
@freezed
abstract class ReactionCounts with _$ReactionCounts {
  const ReactionCounts._();
  const factory ReactionCounts({
    @Default(0) int like,
    @Default(0) int support,
    @Default(0) int idea,
  }) = _ReactionCounts;

  int get total => like + support + idea;

  ReactionCounts bumped(CaddeReactionType t, int delta) => switch (t) {
        CaddeReactionType.like => copyWith(like: like + delta),
        CaddeReactionType.support => copyWith(support: support + delta),
        CaddeReactionType.idea => copyWith(idea: idea + delta),
      };
}

/// Cadde post (feed item) — list_cadde_feed_v1 + ayrı reaksiyon/yorum.
@freezed
abstract class CaddePost with _$CaddePost {
  const factory CaddePost({
    required String id,
    String? authorUserId,
    String? authorName,
    @Default('text') String type,
    String? title,
    @Default('') String body,
    String? country,
    String? city,
    String? createdAt,
    @Default(ReactionCounts()) ReactionCounts reactions,
    @Default(0) int commentCount,
    @Default(<CaddeReactionType>{}) Set<CaddeReactionType> viewerReactions,
  }) = _CaddePost;
}

/// Feed sayfası (cursor-based). nextCursor null ise son sayfa.
@freezed
abstract class CaddeFeedPage with _$CaddeFeedPage {
  const factory CaddeFeedPage({
    @Default(<CaddePost>[]) List<CaddePost> items,
    Map<String, dynamic>? nextCursor,
  }) = _CaddeFeedPage;
}
