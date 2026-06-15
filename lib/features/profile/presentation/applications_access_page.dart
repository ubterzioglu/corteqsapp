import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../../shared/widgets/feature_gate.dart';
import '../data/profile_repository.dart';
import '../domain/profile_models.dart';

/// Başvurular & Erişimler tab'ı.
///
/// Bu tab şunları gösterir:
/// - Bekleyen talepler (role change, feature access)
/// - Mevcut feature'lar
/// - Feature talep oluşturma
class ApplicationsAccessPage extends ConsumerWidget {
  const ApplicationsAccessPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider);

    return AsyncValueView<CurrentUserProfile?>(
      value: profile,
      data: (profile) {
        if (profile == null) {
          return const Center(child: Text('Profil yüklenemedi.'));
        }

        final pendingRequests = profile.pendingRequests;

        return ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Bekleyen talepler
            if (pendingRequests.isNotEmpty) ...[
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.pending_actions),
                          const SizedBox(width: 8),
                          Text(
                            'Bekleyen Talepler',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(width: 8),
                          Chip(
                            label: Text('${pendingRequests.length}'),
                            visualDensity: VisualDensity.compact,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      ...pendingRequests.map((request) => ListTile(
                            title: Text(request.label ?? request.requestType ?? 'Talep'),
                            subtitle: Text(request.requestType ?? ''),
                            trailing: _buildStatusChip(request.status),
                          )),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],

            // Feature talep oluştur
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.add_circle_outline),
                        const SizedBox(width: 8),
                        Text(
                          'Yeni Talep Oluştur',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Rol değişikliği veya feature erişimi için talep oluşturun.',
                      style: TextStyle(color: Colors.grey),
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton.icon(
                      onPressed: () => _showRequestDialog(context, ref),
                      icon: const Icon(Icons.add),
                      label: const Text('Talep Oluştur'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Mevcut Feature'lar
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.check_circle_outline),
                        const SizedBox(width: 8),
                        Text(
                          'Mevcut Erişimler',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _FeatureList(profile: profile),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildStatusChip(String? status) {
    if (status == null) {
      return const Chip(
        label: Text('Bilinmiyor'),
        visualDensity: VisualDensity.compact,
      );
    }

    switch (status.toLowerCase()) {
      case 'pending':
        return const Chip(
          label: Text('Beklemede'),
          backgroundColor: Colors.orange,
          visualDensity: VisualDensity.compact,
        );
      case 'approved':
        return const Chip(
          label: Text('Onaylandı'),
          backgroundColor: Colors.green,
          visualDensity: VisualDensity.compact,
        );
      case 'rejected':
        return const Chip(
          label: Text('Reddedildi'),
          backgroundColor: Colors.red,
          visualDensity: VisualDensity.compact,
        );
      default:
        return Chip(
          label: Text(status),
          visualDensity: VisualDensity.compact,
        );
    }
  }

  void _showRequestDialog(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (_) => _RequestDialog(),
    );
  }
}

class _FeatureList extends ConsumerWidget {
  const _FeatureList({required this.profile});

  final CurrentUserProfile profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final features = ref.watch(featureFlagsProvider).value ?? const <String>{};

    if (features.isEmpty) {
      return const Text('Henüz feature erişimi yok.');
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '${features.length} aktif feature',
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: features.map((key) {
            return Chip(
              label: Text(key),
              avatar: const Icon(Icons.check, size: 16),
              visualDensity: VisualDensity.compact,
            );
          }).toList(),
        ),
      ],
    );
  }
}

class _RequestDialog extends StatefulWidget {
  @override
  State<_RequestDialog> createState() => _RequestDialogState();
}

class _RequestDialogState extends State<_RequestDialog> {
  final _formKey = GlobalKey<FormState>();
  final _typeController = TextEditingController();
  final _reasonController = TextEditingController();
  bool _isSubmitting = false;

  @override
  void dispose() {
    _typeController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _submit() {
    // Implement request submission
    // This would call an RPC to create a request
    Navigator.of(context).pop();
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Talep oluşturuldu (demo).')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Yeni Talep'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              controller: _typeController,
              decoration: const InputDecoration(
                labelText: 'Talep Türü',
                hintText: 'Örn: role_change, feature_access',
              ),
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Bu alan zorunlu' : null,
            ),
            const SizedBox(height: 12),
            TextFormField(
              controller: _reasonController,
              decoration: const InputDecoration(
                labelText: 'Açıklama',
                hintText: 'Talebinizi açıklayın...',
              ),
              maxLines: 3,
              validator: (v) =>
                  v == null || v.trim().isEmpty ? 'Bu alan zorunlu' : null,
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('İptal'),
        ),
        FilledButton(
          onPressed: _isSubmitting ? null : _submit,
          child: _isSubmitting
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(strokeWidth: 2),
                )
              : const Text('Gönder'),
        ),
      ],
    );
  }
}
