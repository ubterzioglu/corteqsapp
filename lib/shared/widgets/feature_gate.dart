import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_providers.dart';

/// Feature key bazlı görünürlük kapısı.
/// Key etkinse [child], değilse [fallback] (yoksa boş) gösterilir.
///
/// ÖNEMLİ: Bu yalnız UX katmanıdır. Gerçek yetki Supabase RLS + function policy'dedir
/// (docs/contract/feature_keys.md). Gate'i atlatmak güvenlik ihlali yaratmaz —
/// backend yine reddeder.
class FeatureGate extends ConsumerWidget {
  const FeatureGate({
    super.key,
    required this.featureKey,
    required this.child,
    this.fallback,
  });

  final String featureKey;
  final Widget child;

  /// Erişim yoksa gösterilecek (örn. "talep oluştur" CTA). Null ise hiçbir şey.
  final Widget? fallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasFeature = ref.watch(hasFeatureProvider(featureKey));
    if (hasFeature) return child;
    return fallback ?? const SizedBox.shrink();
  }
}
