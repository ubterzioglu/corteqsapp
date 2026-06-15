import 'package:flutter/material.dart';

import '../../domain/profile_view_model.dart';

/// Profil özet başlığı (app.md 377): ad/rol, tamamlanma %, sayaç kartları
/// (public alan, bekleyen talep, açık dashboard).
class ProfileSummaryHeader extends StatelessWidget {
  const ProfileSummaryHeader({super.key, required this.model});

  final SelfProfileViewModel model;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      key: const Key('profile_summary_card'),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 28,
                  child: Text(
                    model.displayName.isNotEmpty
                        ? model.displayName[0].toUpperCase()
                        : '?',
                    style: const TextStyle(fontSize: 22),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(model.displayName,
                          style: theme.textTheme.titleLarge),
                      if (model.roleLabel.isNotEmpty) Text(model.roleLabel),
                      if (model.email != null) Text(model.email!),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Profil tamamlanma: %${model.completionPercentage}',
                style: theme.textTheme.bodyMedium),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: (model.completionPercentage.clamp(0, 100)) / 100,
              minHeight: 8,
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                _StatChip(
                    label: 'Public alan', value: model.publicAttributeCount),
                _StatChip(label: 'Bekleyen talep', value: model.pendingCount),
                _StatChip(
                    label: 'Açık dashboard', value: model.dashboardCount),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  const _StatChip({required this.label, required this.value});
  final String label;
  final int value;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('$label: $value'),
    );
  }
}
