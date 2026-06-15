import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_providers.dart';
import '../domain/cadde_models.dart';
import 'cadde_providers.dart';
import 'widgets/cadde_post_card.dart';

/// Cadde feed — composer + feed listesi + reaksiyon + sonsuz scroll (app.md 388-390).
/// `cadde.access` feature gate giriş + yetki gerektirir (UX katmanı; gerçek yetki RLS).
class CaddeFeedPage extends ConsumerStatefulWidget {
  const CaddeFeedPage({super.key});

  @override
  ConsumerState<CaddeFeedPage> createState() => _CaddeFeedPageState();
}

class _CaddeFeedPageState extends ConsumerState<CaddeFeedPage> {
  final _scrollController = ScrollController();
  bool _showLoadingIndicator = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    final feedState = ref.read(caddeFeedProvider);
    // Sayfa sonuna yaklaştıkça daha fazla yükle
    if (_scrollController.position.pixels >=
        _scrollController.position.maxScrollExtent - 200) {
      if (feedState.canLoadMore && !_showLoadingIndicator) {
        _showLoadingIndicator = true;
        ref.read(caddeFeedProvider.notifier).loadMore().then((_) {
          if (mounted) setState(() => _showLoadingIndicator = false);
        });
      }
    }
  }

  Future<void> _refresh() async {
    await ref.read(caddeFeedProvider.notifier).refresh();
  }

  @override
  Widget build(BuildContext context) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final feedState = ref.watch(caddeFeedProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadde')),
      body: RefreshIndicator(
        onRefresh: _refresh,
        child: ListView(
          key: const Key('cadde_feed_page'),
          controller: _scrollController,
          padding: const EdgeInsets.all(12),
          children: [
            if (isLoggedIn) const _Composer(),
            const SizedBox(height: 8),
            if (feedState.hasError)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Center(
                  child: Text('Bir hata oluştu. Yenilemeyi deneyin.'),
                ),
              )
            else if (feedState.items.isEmpty)
              const Padding(
                padding: EdgeInsets.all(24),
                child: Center(child: Text('Henüz gönderi yok.')),
              )
            else
              Column(
                children: [
                  for (var i = 0; i < feedState.items.length; i++)
                    CaddePostCard(
                      post: feedState.items[i],
                      isFirst: i == 0,
                      onReact: (type) =>
                          ref.read(caddeReactionProvider)(feedState.items[i].id, type),
                    ),
                  // Loading indicator for infinite scroll
                  if (feedState.isLoadingMore || _showLoadingIndicator)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    )
                  else if (!feedState.canLoadMore && feedState.items.isNotEmpty)
                    const Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text('Başka gönderi yok.'),
                      ),
                    ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class _Composer extends ConsumerStatefulWidget {
  const _Composer();
  @override
  ConsumerState<_Composer> createState() => _ComposerState();
}

class _ComposerState extends ConsumerState<_Composer> {
  final _ctrl = TextEditingController();

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(caddeComposerProvider);
    final isLoading = state.isLoading;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              key: const Key('cadde_post_body_input'),
              controller: _ctrl,
              minLines: 2,
              maxLines: 5,
              decoration: const InputDecoration(
                hintText: 'Bir şeyler paylaş…',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 8),
            FilledButton(
              key: const Key('cadde_post_submit_button'),
              onPressed: isLoading
                  ? null
                  : () async {
                      final ok = await ref
                          .read(caddeComposerProvider.notifier)
                          .submit(_ctrl.text);
                      if (ok) _ctrl.clear();
                    },
              child: isLoading
                  ? const SizedBox(
                      height: 18,
                      width: 18,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Text('Paylaş'),
            ),
          ],
        ),
      ),
    );
  }
}
