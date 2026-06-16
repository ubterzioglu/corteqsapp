import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/widgets/async_value_view.dart';
import '../data/directory_repository.dart';

/// Slug ile public profil verisi. RPC: `get_catalog_item_public_page_v2`.
final publicPageProvider =
    FutureProvider.family<Map<String, dynamic>?, String>((ref, slug) async {
  return ref.watch(directoryRepositoryProvider).publicPageBySlug(slug);
});

/// Kanonik public profil sayfası (`/directory/catalog/:slug`, app.md 359).
/// Ham JSON'dan başlık/rol/konum gösterir; tam detay view-model'i sonraki iterasyonda.
class PublicProfilePage extends ConsumerWidget {
  const PublicProfilePage({super.key, required this.slug});

  final String slug;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final page = ref.watch(publicPageProvider(slug));

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(title: const Text('Profil')),
      body: AsyncValueView<Map<String, dynamic>?>(
        value: page,
        data: (data) {
          if (data == null) {
            return const Center(
              key: Key('public_profile_not_found'),
              child: Text('Profil bulunamadı.'),
            );
          }
          final title = (data['title'] ?? data['name'] ?? slug).toString();
          final roleLabel = (data['role_label'] ?? '').toString();
          final city = (data['city'] ?? '').toString();
          final country = (data['country'] ?? '').toString();
          final location =
              [city, country].where((e) => e.isNotEmpty).join(', ');
          final imageUrl = (data['image_url'] ?? data['avatar_url'] ?? '')
              .toString();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                key: const Key('public_profile_header'),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      foregroundImage:
                          imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
                      child: Text(
                        title.isNotEmpty ? title[0].toUpperCase() : '?',
                        style: const TextStyle(fontSize: 28),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(title,
                        style: Theme.of(context).textTheme.headlineSmall),
                    if (roleLabel.isNotEmpty) Text(roleLabel),
                    if (location.isNotEmpty)
                      Text(location,
                          style: Theme.of(context).textTheme.bodySmall),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
