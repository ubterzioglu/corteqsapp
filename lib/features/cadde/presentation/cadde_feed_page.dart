import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/ui/design_tokens.dart';
import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/corteqs_empty_state.dart';
import '../../../shared/widgets/corteqs_loader.dart';
import '../../../shared/widgets/glass_card.dart';
import '../../../shared/widgets/gradient_button.dart';
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
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Cadde')),
      body: RefreshIndicator(
        color: AppColors.purple,
        backgroundColor: AppColors.elevatedSurface,
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
                padding: EdgeInsets.symmetric(vertical: 48),
                child: CorteqsEmptyState(
                  icon: Icons.cloud_off_outlined,
                  title: 'Bir bağlantı kopmuş gibi görünüyor.',
                  message: 'Aşağı çekerek tekrar deneyebilirsin.',
                ),
              )
            else if (feedState.items.isEmpty)
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 48),
                child: CorteqsEmptyState(
                  icon: Icons.forum_outlined,
                  title: 'Yeni bağlantılar yeni sohbetlerle başlar.',
                  message: 'İlk gönderiyi sen paylaşabilirsin.',
                ),
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
                      child: CorteqsLoader(size: 36),
                    )
                  else if (!feedState.canLoadMore && feedState.items.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Başka gönderi yok.',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
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

    return GlassCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
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
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          GradientButton(
            key: const Key('cadde_post_submit_button'),
            label: 'Paylaş',
            icon: Icons.send_rounded,
            expand: false,
            loading: isLoading,
            onPressed: isLoading
                ? null
                : () async {
                    final ok = await ref
                        .read(caddeComposerProvider.notifier)
                        .submit(_ctrl.text);
                    if (ok) _ctrl.clear();
                  },
          ),
        ],
      ),
    );
  }
}
