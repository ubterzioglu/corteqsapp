import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../domain/cadde_models.dart' as m;
import 'cadde_providers.dart';
import 'widgets/cadde_post_card.dart';

/// Cadde feed — composer + feed listesi + reaksiyon (app.md 388-390).
/// `cadde.access` feature gate giriş + yetki gerektirir (UX katmanı; gerçek yetki RLS).
class CaddeFeedPage extends ConsumerWidget {
  const CaddeFeedPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);
    final feed = ref.watch(caddeFeedProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Cadde')),
      body: RefreshIndicator(
        onRefresh: () async => ref.invalidate(caddeFeedProvider),
        child: ListView(
          key: const Key('cadde_feed_page'),
          padding: const EdgeInsets.all(12),
          children: [
            if (isLoggedIn) const _Composer(),
            const SizedBox(height: 8),
            AsyncValueView<m.CaddeFeedPage>(
              value: feed,
              data: (page) {
                final posts = page.items;
                if (posts.isEmpty) {
                  return const Padding(
                    padding: EdgeInsets.all(24),
                    child: Center(child: Text('Henüz gönderi yok.')),
                  );
                }
                return Column(
                  children: [
                    for (var i = 0; i < posts.length; i++)
                      CaddePostCard(
                        post: posts[i],
                        isFirst: i == 0,
                        onReact: (type) => ref
                            .read(caddeReactionProvider)(posts[i].id, type),
                      ),
                  ],
                );
              },
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
