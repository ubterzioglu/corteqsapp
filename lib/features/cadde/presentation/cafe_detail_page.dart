import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/feature_gate.dart';

/// Kafe detay sayfası — community room (info hero, üyelik, kafe-içi feed).
///
/// RPC: `get_cadde_actor_context` kullanılacak.
/// UI: info hero, üyelik listesi, kafe-içi feed, owner moderation paneli.
class CafeDetailPage extends ConsumerWidget {
  const CafeDetailPage({super.key, required this.cafeId});

  final String cafeId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('Cadde Kafe'),
              background: _buildCafeHero(),
            ),
          ),
          SliverToBoxAdapter(
            child: _CafeInfoSection(
              cafeId: cafeId,
              isLoggedIn: isLoggedIn,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCafeHero() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.blue.shade400,
            Colors.blue.shade700,
          ],
        ),
      ),
      child: const Center(
        child: Icon(
          Icons.coffee,
          size: 64,
          color: Colors.white30,
        ),
      ),
    );
  }
}

class _CafeInfoSection extends StatelessWidget {
  const _CafeInfoSection({
    required this.cafeId,
    required this.isLoggedIn,
  });

  final String cafeId;
  final bool isLoggedIn;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Kafe bilgileri
        Card(
          margin: const EdgeInsets.all(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 32,
                      backgroundColor: Colors.blue.shade100,
                      child: const Icon(Icons.store, size: 32),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cadde Kafe #$cafeId',
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Diaspora topluluğu için toplanma noktası',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                const Divider(),
                const SizedBox(height: 16),
                _buildInfoRow(
                  context,
                  Icons.people,
                  'Üyeler',
                  '1,234',
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  context,
                  Icons.post_add,
                  'Gönderiler',
                  '456',
                ),
                const SizedBox(height: 12),
                _buildInfoRow(
                  context,
                  Icons.location_on,
                  'Konum',
                  'Global',
                ),
              ],
            ),
          ),
        ),

        // Üyelik listesi
        const Padding(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Text(
            'Kafe Üyeleri',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Card(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: Column(
            children: List.generate(
              5,
              (index) => ListTile(
                leading: CircleAvatar(
                  child: Text('${index + 1}'),
                ),
                title: Text('Üye ${index + 1}'),
                subtitle: Text('Diaspora üyesi'),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          ),
        ),

        // Kafe-içi feed (giriş gerekli)
        if (isLoggedIn)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Text(
                  'Kafe Feed',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: const Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Kafeye özel gönderiler burada görünecek.\n'
                    '(Bu özellik sonraki iterasyonda)',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
              ),
            ],
          )
        else
          Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Theme.of(context).colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Icon(
                      Icons.lock_outline,
                      size: 32,
                      color: Colors.grey,
                    ),
                    const SizedBox(height: 8),
                    const Text('Kafe içeriğini görmek için giriş yapın'),
                  ],
                ),
              ),
            ),
          ),

        // Feature gate - moderation
        FeatureGate(
          featureKey: 'city.manage',
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              color: Colors.amber.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.admin_panel_settings, color: Colors.amber.shade700),
                        const SizedBox(width: 8),
                        Text(
                          'Kafe Yönetimi',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.amber.shade700,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Bu kafeyi yönetme yetkiniz var.\n'
                      'Moderasyon paneli yakında.',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 80),
      ],
    );
  }

  Widget _buildInfoRow(
    BuildContext context,
    IconData icon,
    String label,
    String value,
  ) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Colors.grey.shade600),
        const SizedBox(width: 8),
        Text(
          '$label:',
          style: Theme.of(context).textTheme.bodyMedium,
        ),
        const SizedBox(width: 8),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }
}

