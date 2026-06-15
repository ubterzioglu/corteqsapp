import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/directory_filters.dart';
import '../directory_providers.dart';

/// Filtre bottom sheet (app.md 363): rol / ülke / şehir / öne çıkanlar.
/// Geçici yerel state ile çalışır; "Uygula" ile global filtreye yazılır.
/// Not: ülke/şehir şimdilik serbest metin; tam geo range() picker ayrı adımda.
class DirectoryFilterSheet extends ConsumerStatefulWidget {
  const DirectoryFilterSheet({super.key});

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (_) => const DirectoryFilterSheet(),
    );
  }

  @override
  ConsumerState<DirectoryFilterSheet> createState() => _State();
}

class _State extends ConsumerState<DirectoryFilterSheet> {
  late DirectoryFilters _draft;
  late final TextEditingController _country;
  late final TextEditingController _city;

  @override
  void initState() {
    super.initState();
    _draft = ref.read(directoryFiltersProvider);
    _country = TextEditingController(text: _draft.countryCode);
    _city = TextEditingController(text: _draft.city);
  }

  @override
  void dispose() {
    _country.dispose();
    _city.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final roleOptions = ref.watch(directoryRoleOptionsProvider);

    return Padding(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        top: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom + 16,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Filtreler', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          roleOptions.when(
            data: (options) => DropdownButtonFormField<String>(
              key: const Key('directory_filter_role'),
              initialValue: _draft.roleKey,
              decoration: const InputDecoration(labelText: 'Rol'),
              items: [
                const DropdownMenuItem(value: 'all', child: Text('Tümü')),
                for (final o in options)
                  DropdownMenuItem(value: o.key, child: Text(o.label)),
              ],
              onChanged: (v) =>
                  setState(() => _draft = _draft.copyWith(roleKey: v ?? 'all')),
            ),
            loading: () => const LinearProgressIndicator(),
            error: (_, _) => const Text('Roller yüklenemedi'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _country,
            decoration: const InputDecoration(labelText: 'Ülke kodu (örn. DE)'),
          ),
          const SizedBox(height: 12),
          TextField(
            controller: _city,
            decoration: const InputDecoration(labelText: 'Şehir'),
          ),
          const SizedBox(height: 8),
          SwitchListTile(
            title: const Text('Sadece öne çıkanlar'),
            value: _draft.featuredOnly,
            onChanged: (v) =>
                setState(() => _draft = _draft.copyWith(featuredOnly: v)),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: TextButton(
                  onPressed: () {
                    ref.read(directoryFiltersProvider.notifier).clear();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Temizle'),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: FilledButton(
                  key: const Key('directory_filter_apply_button'),
                  onPressed: () {
                    final applied = _draft.copyWith(
                      countryCode: _country.text.trim(),
                      city: _city.text.trim(),
                    );
                    ref.read(directoryFiltersProvider.notifier).apply(applied);
                    Navigator.of(context).pop();
                  },
                  child: const Text('Uygula'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
