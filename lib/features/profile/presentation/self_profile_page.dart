import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../auth/data/auth_repository.dart';
import '../data/profile_repository.dart';
import '../domain/profile_models.dart';
import '../domain/profile_view_model.dart';
import 'applications_access_page.dart';
import 'document_upload_page.dart';
import 'profile_edit_page.dart';
import 'widgets/profile_summary_header.dart';

/// Kendi profili (member hub) — sekmeli yapı (app.md 373-386).
/// Tek uzun scroll DEĞİL: summary header + TabBar.
class SelfProfilePage extends ConsumerWidget {
  const SelfProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(selfProfileViewModelProvider);

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profilim'),
          actions: [
            IconButton(
              key: const Key('profile_edit_button'),
              icon: const Icon(Icons.edit),
              tooltip: 'Profili Düzenle',
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const ProfileEditPage(),
                  ),
                );
              },
            ),
            IconButton(
              key: const Key('profile_signout_button'),
              icon: const Icon(Icons.logout),
              tooltip: 'Çıkış',
              onPressed: () => ref.read(authRepositoryProvider).signOut(),
            ),
          ],
          bottom: const TabBar(
            isScrollable: true,
            tabs: [
              Tab(text: 'Özet'),
              Tab(text: 'Profil Alanları'),
              Tab(text: 'Başvurular & Erişimler'),
              Tab(text: 'Belgeler'),
              Tab(text: 'Yardım'),
            ],
          ),
        ),
        body: AsyncValueView<SelfProfileViewModel?>(
          value: vm,
          data: (model) {
            if (model == null) {
              return const Center(child: Text('Profil yüklenemedi.'));
            }
            return TabBarView(
              children: [
                _SummaryTab(model: model),
                const _ProfileFieldsTab(),
                const _ApplicationsAccessTab(),
                const _DocumentsTab(),
                const _HelpTab(),
              ],
            );
          },
        ),
      ),
    );
  }
}

class _SummaryTab extends StatelessWidget {
  const _SummaryTab({required this.model});
  final SelfProfileViewModel model;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        ProfileSummaryHeader(model: model),
      ],
    );
  }
}

/// Profil alanları tab'ı — mevcut alanları gösterir ve düzenleme sayfasına link verir.
class _ProfileFieldsTab extends ConsumerWidget {
  const _ProfileFieldsTab();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profile = ref.watch(currentProfileProvider);

    return AsyncValueView<CurrentUserProfile?>(
      value: profile,
      data: (profile) {
        if (profile == null) {
          return const Center(child: Text('Profil yüklenemedi.'));
        }

        if (profile.attributes.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(Icons.person_outline, size: 48),
                const SizedBox(height: 16),
                const Text('Henüz profil alanı yok.'),
                const SizedBox(height: 16),
                FilledButton.icon(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const ProfileEditPage(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.add),
                  label: const Text('İlk Alanını Ekle'),
                ),
              ],
            ),
          );
        }

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
                        const Icon(Icons.info_outline),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Aşağıdaki alanları düzenlemek için butona tıklayın.',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    FilledButton.icon(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const ProfileEditPage(),
                          ),
                        );
                      },
                      icon: const Icon(Icons.edit),
                      label: const Text('Tümünü Düzenle'),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            ...profile.attributes.map((attr) => Card(
              child: ListTile(
                title: Text(attr.label.isEmpty ? attr.attributeKey : attr.label),
                subtitle: Text(
                  attr.valueText ?? 'Boş',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: Chip(
                  label: Text(attr.visibility == 'public' ? 'Public' : 'Private'),
                  visualDensity: VisualDensity.compact,
                ),
              ),
            )),
          ],
        );
      },
    );
  }
}

/// Başvurular & Erişimler tab'ı.
class _ApplicationsAccessTab extends StatelessWidget {
  const _ApplicationsAccessTab();

  @override
  Widget build(BuildContext context) {
    return const ApplicationsAccessPage();
  }
}

/// Belgeler tab'ı — CV ve sunum yükleme sayfası.
class _DocumentsTab extends StatelessWidget {
  const _DocumentsTab();

  @override
  Widget build(BuildContext context) {
    return const DocumentUploadPage();
  }
}

class _PlaceholderTab extends StatelessWidget {
  const _PlaceholderTab(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Text(label, textAlign: TextAlign.center),
      ),
    );
  }
}

class _HelpTab extends StatelessWidget {
  const _HelpTab();

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Card(
          child: ExpansionTile(
            title: Text('Profilimi nasıl tamamlarım?'),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Text(
                    'Profil Alanları sekmesinden bilgilerini doldur; tamamlanma yüzdesi artar.'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
