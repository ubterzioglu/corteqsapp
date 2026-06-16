import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/role_gate.dart';
import '../../profile/data/profile_repository.dart';
import '../../profile/domain/profile_models.dart';
import '../data/admin_repository.dart';
import '../domain/admin_approval.dart';

/// Admin-lite shell (app.md 396-407) — yalnız admin (is_admin RPC) görür.
/// Çekirdek: approvals queue + moderation özeti + dashboard sayaçları.
class AdminLiteShell extends ConsumerWidget {
  const AdminLiteShell({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: const Text('Yönetim (Lite)'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Onaylar'),
              Tab(text: 'Moderasyon'),
              Tab(text: 'Dashboard'),
            ],
          ),
        ),
        body: RoleGate(
          fallback: const Center(
            key: Key('admin_no_access'),
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text('Bu alana erişim yetkiniz yok.',
                  textAlign: TextAlign.center),
            ),
          ),
          child: const TabBarView(
            children: [
              _ApprovalsQueueTab(),
              _ModerationSummaryTab(),
              _DashboardTab(),
            ],
          ),
        ),
      ),
    );
  }
}

/// Onaylar tab'ı — bekleyen talepler listesi.
class _ApprovalsQueueTab extends ConsumerWidget {
  const _ApprovalsQueueTab();

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
            itemBuilder: (context, i) => _ApprovalCard(request: pending[i]),
          );
        },
      ),
    );
  }
}

/// Moderasyon özeti tab'ı — Cadde moderation queue ve raporlar.
class _ModerationSummaryTab extends StatelessWidget {
  const _ModerationSummaryTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.flag, color: Colors.orange),
                    const SizedBox(width: 8),
                    Text(
                      'Moderasyon Kuyruğu',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                _ModerationStatCard(
                  label: 'Bekleyen İhbarlar',
                  count: 5,
                  color: Colors.orange,
                ),
                const SizedBox(height: 12),
                _ModerationStatCard(
                  label: 'Bugün İşlenen',
                  count: 12,
                  color: Colors.green,
                ),
                const SizedBox(height: 12),
                _ModerationStatCard(
                  label: 'Toplam İhbar',
                  count: 156,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Tüm İhbarlar'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              // İhbarlar listesi sayfasına git
            },
          ),
        ),
      ],
    );
  }
}

class _ModerationStatCard extends StatelessWidget {
  const _ModerationStatCard({
    required this.label,
    required this.count,
    required this.color,
  });

  final String label;
  final int count;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Container(
            width: 4,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const Spacer(),
          Text(
            '$count',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  color: color,
                  fontWeight: FontWeight.bold,
                ),
          ),
        ],
      ),
    );
  }
}

/// Dashboard tab'ı — sayaçlar ve özet bilgiler.
class _DashboardTab extends ConsumerWidget {
  const _DashboardTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider);

    return AsyncValueView<CurrentUserProfile?>(
      value: profile,
      data: (profile) {
        if (profile == null) {
          return const Center(child: Text('Profil yüklenemedi.'));
        }

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Admin bilgileri
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.admin_panel_settings),
                        const SizedBox(width: 8),
                        Text(
                          'Yönetici Paneli',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _DashboardStatCard(
                      label: 'Toplam Kullanıcı',
                      value: '1,234',
                      icon: Icons.people,
                    ),
                    const SizedBox(height: 12),
                    _DashboardStatCard(
                      label: 'Aktif Kullanıcı',
                      value: '856',
                      icon: Icons.person_pin,
                    ),
                    const SizedBox(height: 12),
                    _DashboardStatCard(
                      label: 'Yeni Üye (Bu Hafta)',
                      value: '+24',
                      icon: Icons.trending_up,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Hızlı erişim
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.approval),
                    title: const Text('Tüm Onay Talepleri'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.folder),
                    title: const Text('Audit Loglar'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
                  ),
                  const Divider(height: 1),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Sistem Ayarları'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {},
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

class _DashboardStatCard extends StatelessWidget {
  const _DashboardStatCard({
    required this.label,
    required this.value,
    required this.icon,
    this.color,
  });

  final String label;
  final String value;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final defaultColor = color ?? Theme.of(context).colorScheme.primary;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        border: Border.all(color: defaultColor.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(icon, color: defaultColor),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      color: defaultColor,
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ],
          ),
        ],
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
