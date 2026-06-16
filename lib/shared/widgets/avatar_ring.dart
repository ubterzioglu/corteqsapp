import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../core/ui/app_gradients.dart';
import '../../core/ui/design_tokens.dart';

/// Gradyan halkalı dairesel avatar — çevrimiçi/doğrulanmış kullanıcılarda
/// daha parlak parıltı. Dizin/Cadde/Profil kartlarında kullanılır.
class AvatarRing extends StatelessWidget {
  const AvatarRing({
    super.key,
    this.imageUrl,
    this.initial,
    this.size = 48,
    this.online = false,
    this.gradient,
  });

  final String? imageUrl;
  final String? initial;
  final double size;
  final bool online;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;
    final ring = gradient ?? AppGradients.ring;

    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(2.5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: ring,
        boxShadow: online
            ? [
                BoxShadow(
                  color: AppColors.green.withValues(alpha: 0.6),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: CircleAvatar(
        backgroundColor: AppColors.elevatedSurface,
        foregroundImage:
            hasImage ? CachedNetworkImageProvider(imageUrl!) : null,
        child: hasImage
            ? null
            : Text(
                (initial != null && initial!.isNotEmpty)
                    ? initial![0].toUpperCase()
                    : '?',
                style: TextStyle(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.w700,
                  fontSize: size * 0.36,
                ),
              ),
      ),
    );
  }
}
