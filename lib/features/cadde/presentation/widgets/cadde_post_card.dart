import 'package:flutter/material.dart';

import '../../domain/cadde_models.dart';
import 'comment_bottom_sheet.dart';

/// Tek bir Cadde post kartı — içerik + reaksiyon bar + yorum sayısı (app.md 388-390).
class CaddePostCard extends StatelessWidget {
  const CaddePostCard({
    super.key,
    required this.post,
    required this.onReact,
    this.isFirst = false,
  });

  final CaddePost post;
  final void Function(CaddeReactionType) onReact;

  /// İlk kart reaksiyon butonuna stabil test key'i verir (integration test).
  final bool isFirst;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (post.title != null && post.title!.isNotEmpty)
              Text(post.title!, style: theme.textTheme.titleMedium),
            Text(post.body),
            if ((post.city ?? '').isNotEmpty || (post.country ?? '').isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  [post.city, post.country]
                      .where((e) => e != null && e.isNotEmpty)
                      .join(', '),
                  style: theme.textTheme.bodySmall,
                ),
              ),
            const SizedBox(height: 8),
            Row(
              children: [
                _ReactionButton(
                  key: isFirst ? const Key('cadde_reaction_like_button') : null,
                  icon: Icons.thumb_up_outlined,
                  count: post.reactions.like,
                  active: post.viewerReactions.contains(CaddeReactionType.like),
                  onTap: () => onReact(CaddeReactionType.like),
                ),
                _ReactionButton(
                  icon: Icons.favorite_outline,
                  count: post.reactions.support,
                  active:
                      post.viewerReactions.contains(CaddeReactionType.support),
                  onTap: () => onReact(CaddeReactionType.support),
                ),
                _ReactionButton(
                  icon: Icons.lightbulb_outline,
                  count: post.reactions.idea,
                  active: post.viewerReactions.contains(CaddeReactionType.idea),
                  onTap: () => onReact(CaddeReactionType.idea),
                ),
                const Spacer(),
                // Yorum butonu
                TextButton.icon(
                  key: isFirst
                      ? const Key('cadde_comment_button')
                      : null,
                  onPressed: () => CommentBottomSheet.show(
                    context,
                    postId: post.id,
                    commentCount: post.commentCount,
                  ),
                  icon: const Icon(Icons.mode_comment_outlined, size: 18),
                  label: Text('${post.commentCount}'),
                  style: TextButton.styleFrom(
                    foregroundColor: theme.disabledColor,
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

class _ReactionButton extends StatelessWidget {
  const _ReactionButton({
    super.key,
    required this.icon,
    required this.count,
    required this.active,
    required this.onTap,
  });

  final IconData icon;
  final int count;
  final bool active;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color =
        active ? Theme.of(context).colorScheme.primary : null;
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18, color: color),
      label: Text('$count', style: TextStyle(color: color)),
    );
  }
}
