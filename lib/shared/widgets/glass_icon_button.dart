import 'package:flutter/material.dart';

import '../../core/ui/design_tokens.dart';

/// Cam daire ikon butonu — aktifken marka parıltısı. AppBar aksiyonları ve
/// ikincil eylemler için.
class GlassIconButton extends StatelessWidget {
  const GlassIconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
    this.active = false,
    this.glowColor = AppColors.purple,
    this.iconKey,
  });

  final IconData icon;
  final VoidCallback? onPressed;
  final String? tooltip;
  final bool active;
  final Color glowColor;
  final Key? iconKey;

  @override
  Widget build(BuildContext context) {
    final button = Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.glassFill,
        border: Border.all(
          color: active ? glowColor : AppColors.glassBorder,
        ),
        boxShadow: active
            ? [
                BoxShadow(
                  color: glowColor.withValues(alpha: 0.4),
                  blurRadius: 14,
                  spreadRadius: 1,
                ),
              ]
            : null,
      ),
      child: IconButton(
        key: iconKey,
        icon: Icon(icon, size: 20),
        color: active ? glowColor : AppColors.textPrimary,
        onPressed: onPressed,
        tooltip: tooltip,
      ),
    );
    return button;
  }
}
