import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/supabase_provider.dart';

/// Admin rolü kapısı — `is_admin` RPC'sine dayanır (docs/contract/rpcs.md).
/// Admin-lite ekranlarını (Phase 6b) sarmalar. UX katmanı; gerçek yetki RLS'te.
final isAdminProvider = FutureProvider<bool>((ref) async {
  final client = ref.watch(supabaseClientProvider);
  if (client.auth.currentSession == null) return false;
  final result = await client.rpc('is_admin');
  return result == true;
});

class RoleGate extends ConsumerWidget {
  const RoleGate({
    super.key,
    required this.child,
    this.fallback,
  });

  final Widget child;
  final Widget? fallback;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(isAdminProvider).value ?? false;
    if (isAdmin) return child;
    return fallback ?? const SizedBox.shrink();
  }
}
