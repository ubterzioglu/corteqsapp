import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../../auth/data/auth_repository.dart';
import '../data/profile_repository.dart';
import '../domain/profile_view_model.dart';
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
                const _PlaceholderTab('Profil alanları (sonraki iterasyon)'),
                const _PlaceholderTab(
                    'Rol başvurusu, feature talepleri, dashboard erişimleri, bekleyen talepler'),
                const _PlaceholderTab('CV / sunum yükleme (profile.cv_upload)'),
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
