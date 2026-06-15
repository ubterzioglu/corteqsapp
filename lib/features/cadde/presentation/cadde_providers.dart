import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/cadde_repository.dart';
import '../domain/cadde_models.dart';

/// Cadde feed (ilk sayfa). Mutasyon sonrası invalidate edilir → yeniden çekilir.
/// Tam sonsuz-scroll (cursor zinciri) sonraki iterasyonda; çekirdekte ilk sayfa.
final caddeFeedProvider = FutureProvider<CaddeFeedPage>((ref) async {
  return ref.watch(caddeRepositoryProvider).fetchFeed();
});

/// Composer controller — post gönderimi (loading/error UI).
class CaddeComposerController extends AsyncNotifier<void> {
  @override
  Future<void> build() async {}

  Future<bool> submit(String body) async {
    if (body.trim().isEmpty) return false;
    state = const AsyncValue.loading();
    try {
      await ref.read(caddeRepositoryProvider).createPost(body: body.trim());
      state = const AsyncValue.data(null);
      ref.invalidate(caddeFeedProvider); // feed kökünü tazele
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
    ref.invalidate(caddeFeedProvider);
    return added;
  };
});
