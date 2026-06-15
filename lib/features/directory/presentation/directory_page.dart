import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../app/router/route_paths.dart';
import '../../../shared/providers/auth_providers.dart';
import '../../../shared/widgets/async_value_view.dart';
import '../domain/directory_models.dart';
import 'directory_providers.dart';
import 'widgets/directory_filter_sheet.dart';
import 'widgets/directory_result_card.dart';

/// Dizin — arama-öncelikli liste (app.md 355-369).
/// Auth gate: giriş yoksa tam dizin kapalı (web DirectoryPage davranışı, app.md 35).
class DirectoryPage extends ConsumerWidget {
  const DirectoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoggedIn = ref.watch(isLoggedInProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dizin'),
        actions: [
          if (isLoggedIn)
            IconButton(
              key: const Key('directory_filter_open_button'),
              icon: const Icon(Icons.filter_list),
              tooltip: 'Filtreler',
              onPressed: () => DirectoryFilterSheet.show(context),
            ),
        ],
      ),
      body: isLoggedIn ? const _DirectoryBody() : const _AuthGate(),
    );
  }
}

/// Giriş yapılmamış kullanıcı için kapı (app.md 35,802).
class _AuthGate extends StatelessWidget {
  const _AuthGate();

  @override
  Widget build(BuildContext context) {
    return Center(
      key: const Key('directory_auth_gate'),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.lock_outline, size: 48),
            const SizedBox(height: 16),
            const Text(
              'Dizini görüntülemek için giriş yapın.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => context.go(RoutePaths.login),
              child: const Text('Giriş Yap'),
            ),
          ],
        ),
      ),
    );
  }
}

class _DirectoryBody extends ConsumerWidget {
  const _DirectoryBody();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filters = ref.watch(directoryFiltersProvider);
    final results = ref.watch(directoryResultsProvider);
    final totalCount = ref.watch(directoryTotalCountProvider).value;

    return Column(
      key: const Key('directory_page'),
      children: [
        Padding(
          padding: const EdgeInsets.all(12),
          child: SearchBar(
            key: const Key('directory_search_input'),
            hintText: 'İsim, rol, şehir ara…',
            leading: const Icon(Icons.search),
            onChanged: (v) =>
                ref.read(directoryFiltersProvider.notifier).setSearchText(v),
          ),
        ),
        Expanded(
          child: AsyncValueView<List<DirectoryRow>>(
            value: results,
            data: (rows) {
              if (rows.isEmpty) {
                return const Center(
                  key: Key('directory_empty'),
                  child: Text('Sonuç bulunamadı.'),
                );
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        '${rows.length} sonuç'
                        '${totalCount != null ? ' / toplam $totalCount' : ''}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      key: const Key('directory_result_list'),
                      itemCount: rows.length,
                      itemBuilder: (context, i) {
                        final row = rows[i];
                        return DirectoryResultCard(
                          row: row,
                          onTap: () => context.go(
                            RoutePaths.directoryCatalogOf(row.slug),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        if (!filters.isEmpty)
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextButton.icon(
              onPressed: () =>
                  ref.read(directoryFiltersProvider.notifier).clear(),
              icon: const Icon(Icons.clear),
              label: const Text('Filtreleri temizle'),
            ),
          ),
      ],
    );
  }
}
