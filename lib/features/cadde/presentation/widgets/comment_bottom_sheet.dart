import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/cadde_models.dart';
import '../cadde_providers.dart';

/// Yorum bottom sheet — post'un yorumlarını gösterir ve yeni yorum ekler.
class CommentBottomSheet extends ConsumerStatefulWidget {
  const CommentBottomSheet({
    super.key,
    required this.postId,
    required this.commentCount,
  });

  final String postId;
  final int commentCount;

  static Future<void> show(
    BuildContext context, {
    required String postId,
    required int commentCount,
  }) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => CommentBottomSheet(
        postId: postId,
        commentCount: commentCount,
      ),
    );
  }

  @override
  ConsumerState<CommentBottomSheet> createState() =>
      _CommentBottomSheetState();
}

class _CommentBottomSheetState extends ConsumerState<CommentBottomSheet> {
  final _commentController = TextEditingController();
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _commentController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_commentController.text.trim().isEmpty) return;
    ref
        .read(caddeCommentControllerProvider.notifier)
        .submit(postId: widget.postId, body: _commentController.text.trim())
        .then((ok) {
      if (ok) {
        _commentController.clear();
        // Scroll to bottom
        if (_scrollController.hasClients) {
          Future.delayed(const Duration(milliseconds: 100), () {
            _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeOut,
            );
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final comments = ref.watch(caddeCommentsProvider(widget.postId));
    final submitState = ref.watch(caddeCommentControllerProvider);
    final isSubmitting = submitState.isLoading;

    return DraggableScrollableSheet(
      initialChildSize: 0.6,
      minChildSize: 0.3,
      maxChildSize: 0.95,
      expand: false,
      builder: (context, scroll) {
        return Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  bottom: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  const Text('Yorumlar', style: TextStyle(fontSize: 18)),
                  const Spacer(),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
            ),
            // Comments list
            Expanded(
              child: comments.when(
                data: (commentList) {
                  if (commentList.isEmpty) {
                    return const Center(
                      child: Text('Henüz yorum yok. İlk yorumu sen yap!'),
                    );
                  }
                  return ListView.builder(
                    controller: _scrollController,
                    padding: const EdgeInsets.all(16),
                    itemCount: commentList.length,
                    itemBuilder: (context, index) {
                      final comment = commentList[index];
                      return _CommentTile(comment: comment);
                    },
                  );
                },
                loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
                error: (e, _) => Center(
                  child: Text('Hata: $e'),
                ),
              ),
            ),
            // Input area
            Container(
              padding: EdgeInsets.only(
                left: 16,
                right: 16,
                top: 12,
                bottom: MediaQuery.of(context).viewInsets.bottom + 12,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                border: Border(
                  top: BorderSide(
                    color: Theme.of(context).dividerColor,
                    width: 1,
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      key: const Key('comment_input'),
                      controller: _commentController,
                      decoration: const InputDecoration(
                        hintText: 'Yorum yaz…',
                        border: OutlineInputBorder(),
                      ),
                      minLines: 1,
                      maxLines: 3,
                      textInputAction: TextInputAction.send,
                      onSubmitted: (_) => _submit(),
                    ),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    key: const Key('comment_send_button'),
                    onPressed: isSubmitting ? null : _submit,
                    icon: isSubmitting
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(Icons.send),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CommentTile extends StatelessWidget {
  const _CommentTile({required this.comment});

  final dynamic comment;

  @override
  Widget build(BuildContext context) {
    // comment is CaddeComment from providers
    final authorName = comment.authorName ?? 'Misafir';
    final body = comment.body;
    final createdAt = comment.createdAt;

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: comment.authorAvatarUrl != null
                ? NetworkImage(comment.authorAvatarUrl!)
                : null,
            child: comment.authorAvatarUrl == null
                ? Text(authorName.isNotEmpty ? authorName[0].toUpperCase() : '?')
                : null,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      authorName,
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      _formatDate(createdAt),
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(body),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(String dateStr) {
    try {
      final date = DateTime.parse(dateStr);
      final now = DateTime.now();
      final diff = now.difference(date);

      if (diff.inMinutes < 1) return 'Az önce';
      if (diff.inMinutes < 60) return '${diff.inMinutes} dk önce';
      if (diff.inHours < 24) return '${diff.inHours} saat önce';
      if (diff.inDays < 7) return '${diff.inDays} gün önce';
      return '${date.day}/${date.month}/${date.year}';
    } catch (_) {
      return '';
    }
  }
}
