import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../core/ui/design_tokens.dart';

/// Shimmer iskelet — liste/kart yükleme durumları için markalı placeholder.
class ShimmerSkeleton extends StatelessWidget {
  const ShimmerSkeleton({super.key, this.itemCount = 6});

  final int itemCount;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.elevatedSurface,
      highlightColor: AppColors.surfaceNavy,
      child: ListView.builder(
        padding: const EdgeInsets.all(AppSpacing.md),
        itemCount: itemCount,
        itemBuilder: (_, _) => const _SkeletonRow(),
      ),
    );
  }
}

class _SkeletonRow extends StatelessWidget {
  const _SkeletonRow();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppSpacing.md),
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.elevatedSurface,
        borderRadius: BorderRadius.circular(AppRadii.xl),
      ),
      child: Row(
        children: [
          const CircleAvatar(radius: 24, backgroundColor: Colors.white),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _bar(width: 140, height: 14),
                const SizedBox(height: AppSpacing.sm),
                _bar(width: 90, height: 12),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _bar({required double width, required double height}) => Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(AppRadii.sm),
        ),
      );
}
