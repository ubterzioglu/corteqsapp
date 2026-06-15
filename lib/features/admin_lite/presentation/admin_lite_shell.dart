import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/role_gate.dart';
import '../data/admin_repository.dart';
import '../domain/admin_approval.dart';

/// Admin-lite shell (app.md 396-407) — yalnız admin (is_admin RPC) görür.
/// Çekirdek: approvals queue. Geri kalan operasyon yüzeyi web'de.
class AdminLiteShell extends ConsumerWidget {
  const AdminLiteShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Yönetim (Lite)')),
      body: RoleGate(
        fallback: const Center(
          key: Key('admin_no_access'),
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Text('Bu alana erişim yetkiniz yok.',
                textAlign: TextAlign.center),
          ),
        ),
        child: const _ApprovalsQueue(),
      ),
    );
  }
}

class _ApprovalsQueue extends ConsumerWidget {
  const _ApprovalsQueue();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final approvals = ref.watch(adminApprovalsProvider);

    return RefreshIndicator(
      onRefresh: () async => ref.invalidate(adminApprovalsProvider),
      child: AsyncValueView<List<AdminApprovalRequest>>(
        value: approvals,
        data: (requests) {
          final pending = requests.where((r) => r.isPending).toList();
          if (pending.isEmpty) {
            return ListView(
              key: const Key('admin_approvals_empty'),
              children: const [
                SizedBox(height: 120),
                Center(child: Text('Bekleyen onay talebi yok.')),
              ],
            );
          }
          return ListView.builder(
            key: const Key('admin_approvals_list'),
            padding: const EdgeInsets.all(12),
            itemCount: pending.length,
            itemBuilder: (context, i) =>
                _ApprovalCard(request: pending[i]),
          );
        },
      ),
    );
  }
}

class _ApprovalCard extends ConsumerWidget {
  const _ApprovalCard({required this.request});
  final AdminApprovalRequest request;

  Future<void> _review(
    BuildContext context,
    WidgetRef ref,
    ApprovalDecision decision,
  ) async {
    try {
      await ref.read(adminRepositoryProvider).review(
            requestId: request.id,
            decision: decision,
          );
      ref.invalidate(adminApprovalsProvider);
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(decision == ApprovalDecision.approved
                ? 'Talep onaylandı.'
                : 'Talep reddedildi.'),
          ),
        );
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('İşlem başarısız: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(request.requestType,
                style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 4),
            Text('Hedef: ${request.targetLabel}'),
            Text('Kullanıcı: ${request.userId}',
                style: Theme.of(context).textTheme.bodySmall),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () =>
                      _review(context, ref, ApprovalDecision.rejected),
                  child: const Text('Reddet'),
                ),
                const SizedBox(width: 8),
                FilledButton(
                  onPressed: () =>
                      _review(context, ref, ApprovalDecision.approved),
                  child: const Text('Onayla'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
