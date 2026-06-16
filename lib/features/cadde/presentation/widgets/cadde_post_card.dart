import 'package:flutter/material.dart';

import '../../../../core/ui/design_tokens.dart';
import '../../../../shared/widgets/glass_card.dart';
import '../../domain/cadde_models.dart';
import 'comment_bottom_sheet.dart';

/// Tek bir Cadde post kartı — içerik + reaksiyon bar + yorum sayısı
/// (app.md 388-390). Cam kart + parıltılı aktif reaksiyonlar.
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
    final location = [post.city, post.country]
        .where((e) => e != null && e.isNotEmpty)
        .join(', ');

    return GlassCard(
      margin: const EdgeInsets.only(bottom: AppSpacing.sm),
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (post.title != null && post.title!.isNotEmpty) ...[
            Text(post.title!, style: theme.textTheme.titleMedium),
            const SizedBox(height: 4),
          ],
          Text(post.body, style: theme.textTheme.bodyLarge),
          if (location.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 6),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(
                    Icons.place_outlined,
                    size: 13,
                    color: AppColors.textMuted,
                  ),
                  const SizedBox(width: 4),
                  Text(location, style: theme.textTheme.bodySmall),
                ],
              ),
            ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              _ReactionButton(
                key: isFirst ? const Key('cadde_reaction_like_button') : null,
                icon: Icons.thumb_up_outlined,
                count: post.reactions.like,
                color: AppColors.blue,
                active: post.viewerReactions.contains(CaddeReactionType.like),
                onTap: () => onReact(CaddeReactionType.like),
              ),
              _ReactionButton(
                icon: Icons.favorite_outline,
                count: post.reactions.support,
                color: AppColors.red,
                active:
                    post.viewerReactions.contains(CaddeReactionType.support),
                onTap: () => onReact(CaddeReactionType.support),
              ),
              _ReactionButton(
                icon: Icons.lightbulb_outline,
                count: post.reactions.idea,
                color: AppColors.yellow,
                active: post.viewerReactions.contains(CaddeReactionType.idea),
                onTap: () => onReact(CaddeReactionType.idea),
              ),
              const Spacer(),
              TextButton.icon(
                key: isFirst ? const Key('cadde_comment_button') : null,
                onPressed: () => CommentBottomSheet.show(
                  context,
                  postId: post.id,
                  commentCount: post.commentCount,
                ),
                icon: const Icon(Icons.mode_comment_outlined, size: 18),
                label: Text('${post.commentCount}'),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.textMuted,
                ),
              ),
            ],
          ),
        ],
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
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final int count;
  final bool active;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final fg = active ? color : AppColors.textMuted;
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        size: 18,
        color: fg,
        shadows: active
            ? [Shadow(color: color.withValues(alpha: 0.8), blurRadius: 12)]
            : null,
      ),
      label: Text('$count', style: TextStyle(color: fg)),
      style: TextButton.styleFrom(
        foregroundColor: fg,
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
        minimumSize: const Size(0, 40),
      ),
    );
  }
}
