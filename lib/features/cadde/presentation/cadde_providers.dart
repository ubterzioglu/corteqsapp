import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../data/cadde_repository.dart';
import '../domain/cadde_models.dart';

/// Cadde feed state — sonsuz scroll için tüm sayfalar + loading durumu.
@immutable
class CaddeFeedState {
  const CaddeFeedState({
    this.items = const [],
    this.nextCursor,
    this.isLoadingMore = false,
    this.hasError = false,
  });

  final List<CaddePost> items;
  final Map<String, dynamic>? nextCursor;
  final bool isLoadingMore;
  final bool hasError;

  CaddeFeedState copyWith({
    List<CaddePost>? items,
    Map<String, dynamic>? nextCursor,
    bool? isLoadingMore,
    bool? hasError,
  }) {
    return CaddeFeedState(
      items: items ?? this.items,
      nextCursor: nextCursor ?? this.nextCursor,
      isLoadingMore: isLoadingMore ?? this.isLoadingMore,
      hasError: hasError ?? this.hasError,
    );
  }

  bool get canLoadMore => nextCursor != null && !isLoadingMore;
}

/// Cadde feed controller — sonsuz scroll + refresh.
class CaddeFeedController extends Notifier<CaddeFeedState> {
  @override
  CaddeFeedState build() {
    // İlk açılışta otomatik yükle
    _loadInitial();
    return const CaddeFeedState();
  }

  Future<void> _loadInitial() async {
    try {
      final page = await ref.read(caddeRepositoryProvider).fetchFeed();
      state = CaddeFeedState(
        items: page.items,
        nextCursor: page.nextCursor,
      );
    } catch (e) {
      state = CaddeFeedState(hasError: true);
    }
  }

  /// Yenile (pull-to-refresh).
  Future<void> refresh() async {
    await _loadInitial();
  }

  /// Sonraki sayfayı yükle (sonsuz scroll).
  Future<void> loadMore() async {
    if (!state.canLoadMore) return;

    state = state.copyWith(isLoadingMore: true);
    try {
      final page = await ref.read(caddeRepositoryProvider).fetchFeed(
            cursor: state.nextCursor,
          );
      state = state.copyWith(
        items: [...state.items, ...page.items],
        nextCursor: page.nextCursor,
        isLoadingMore: false,
      );
    } catch (e) {
      state = state.copyWith(isLoadingMore: false, hasError: true);
    }
  }

  /// Yeni post gönderince listenin başına ekler (optimistic).
  void prependPost(CaddePost post) {
    state = state.copyWith(items: [post, ...state.items]);
  }
}

final caddeFeedProvider =
    NotifierProvider<CaddeFeedController, CaddeFeedState>(
  CaddeFeedController.new,
);

/// Composer controller — post gönderimi (loading/error UI).
class CaddeComposerController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<bool> submit(String body) async {
    if (body.trim().isEmpty) return false;
    state = const AsyncValue.loading();
    try {
      final postId = await ref.read(caddeRepositoryProvider).createPost(
            body: body.trim(),
          );
      state = const AsyncValue.data(null);

      // Yeni post'u listenin başına ekle (geçici placeholder)
      final tempPost = CaddePost(
        id: postId,
        authorName: 'Sen',
        body: body.trim(),
        createdAt: DateTime.now().toIso8601String(),
        reactions: const ReactionCounts(),
        commentCount: 0,
      );
      ref.read(caddeFeedProvider.notifier).prependPost(tempPost);

      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final caddeComposerProvider =
    AsyncNotifierProvider<CaddeComposerController, void>(
  CaddeComposerController.new,
);

/// Reaksiyon toggle — başarıda feed'i tazeler (optimistic UI widget'ta).
final caddeReactionProvider =
    Provider<Future<bool> Function(String, CaddeReactionType)>((ref) {
  return (postId, type) async {
    final added =
        await ref.read(caddeRepositoryProvider).toggleReaction(postId, type);
    // Feed'i yenile (reaksiyon sayıları güncellenir)
    await ref.read(caddeFeedProvider.notifier).refresh();
    return added;
  };
});

/// Yorumlar için provider — post ID'ye göre yorumları çeker.
final caddeCommentsProvider =
    FutureProvider.family<List<CaddeComment>, String>((ref, postId) async {
  final client = ref.watch(supabaseClientProvider);
  final data = await client
      .from('cadde_post_comments')
      .select('id, post_id, user_id, body, created_at, user_profiles(id, display_name, avatar_url)')
      .eq('post_id', postId)
      .order('created_at', ascending: true);

  return (data as List)
      .map((e) => CaddeComment.fromJson(Map<String, dynamic>.from(e as Map)))
      .toList();
});

/// Yorum controller — create comment.
class CaddeCommentController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<bool> submit({required String postId, required String body}) async {
    if (body.trim().isEmpty) return false;
    state = const AsyncValue.loading();
    try {
      await ref.read(caddeRepositoryProvider).createComment(postId, body.trim());
      state = const AsyncValue.data(null);
      // Yorumları invalidate et
      ref.invalidate(caddeCommentsProvider(postId));
      // Feed'i yenile (yorum sayısı güncellenir)
      await ref.read(caddeFeedProvider.notifier).refresh();
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final caddeCommentControllerProvider =
    AsyncNotifierProvider<CaddeCommentController, void>(
  CaddeCommentController.new,
);

/// Yorum modeli — tablo yanından gelen veri.
class CaddeComment {
  CaddeComment({
    required this.id,
    required this.postId,
    required this.userId,
    required this.body,
    required this.createdAt,
    this.authorName,
    this.authorAvatarUrl,
  });

  factory CaddeComment.fromJson(Map<String, dynamic> json) {
    // user_profiles yan tablosundan gelen veriler
    final profile = json['user_profiles'] as Map?;
    return CaddeComment(
      id: json['id'] as String,
      postId: json['post_id'] as String,
      userId: json['user_id'] as String,
      body: json['body'] as String,
      createdAt: json['created_at'] as String,
      authorName: profile?['display_name'] as String?,
      authorAvatarUrl: profile?['avatar_url'] as String?,
    );
  }

  final String id;
  final String postId;
  final String userId;
  final String body;
  final String createdAt;
  final String? authorName;
  final String? authorAvatarUrl;
}
