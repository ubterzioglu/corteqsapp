import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../domain/directory_filters.dart';
import '../directory_providers.dart';

/// Filtre bottom sheet (app.md 363): rol / ülke / şehir / öne çıkanlar.
/// Geçici yerel state ile çalışır; "Uygula" ile global filtreye yazılır.
/// Ülke/şehir için geo picker dropdown kullanılır.
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
  String? _selectedCountry;
  String? _selectedCity;

  // Geo data - gerçek uygulamada veritabanından çekilir
  static const _countries = [
    {'code': 'TR', 'name': 'Türkiye'},
    {'code': 'DE', 'name': 'Almanya'},
    {'code': 'US', 'name': 'Amerika Birleşik Devletleri'},
    {'code': 'GB', 'name': 'Birleşik Krallık'},
    {'code': 'FR', 'name': 'Fransa'},
    {'code': 'NL', 'name': 'Hollanda'},
    {'code': 'AT', 'name': 'Avusturya'},
    {'code': 'CH', 'name': 'İsviçre'},
    {'code': 'BE', 'name': 'Belçika'},
    {'code': 'all', 'name': 'Tüm Ülkeler'},
  ];

  static final Map<String, List<String>> _citiesByCountry = {
    'TR': [
      'İstanbul',
      'Ankara',
      'İzmir',
      'Bursa',
      'Antalya',
    ],
    'DE': [
      'Berlin',
      'Münih',
      'Frankfurt',
      'Hamburg',
      'Köln',
    ],
    'US': [
      'New York',
      'Los Angeles',
      'Chicago',
      'Houston',
      'Phoenix',
    ],
    'GB': [
      'Londra',
      'Manchester',
      'Birmingham',
      'Liverpool',
      'Leeds',
    ],
    'FR': [
      'Paris',
      'Lyon',
      'Marsilya',
      'Toulouse',
      'Nice',
    ],
  };

  @override
  void initState() {
    super.initState();
    _draft = ref.read(directoryFiltersProvider);
    _selectedCountry =
        _draft.countryCode.isEmpty ? null : _draft.countryCode;
    _selectedCity = _draft.city.isEmpty ? null : _draft.city;
  }

  List<String> get _availableCities {
    if (_selectedCountry == null || _selectedCountry == 'all') {
      return [];
    }
    return _citiesByCountry[_selectedCountry!] ?? [];
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
              value: _draft.roleKey,
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
          // Ülke dropdown
          DropdownButtonFormField<String>(
            value: _selectedCountry,
            decoration: const InputDecoration(labelText: 'Ülke'),
            items: _countries.map((country) {
              return DropdownMenuItem<String>(
                value: country['code'],
                child: Text(country['name']!),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedCountry = value;
                _selectedCity = null; // Şehri sıfırla
              });
            },
          ),
          const SizedBox(height: 12),
          // Şehir dropdown (ülke seçiliyse)
          if (_selectedCountry != null && _selectedCountry != 'all')
            DropdownButtonFormField<String>(
              value: _selectedCity,
              decoration: const InputDecoration(labelText: 'Şehir'),
              items: [
                const DropdownMenuItem<String>(
                  value: null,
                  child: Text('Tüm Şehirler'),
                ),
                ..._availableCities.map((city) {
                  return DropdownMenuItem<String>(
                    value: city,
                    child: Text(city),
                  );
                }),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedCity = value;
                });
              },
            )
          else
            const TextField(
              enabled: false,
              decoration: InputDecoration(
                labelText: 'Şehir',
                hintText: 'Önce ülke seçin',
              ),
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
                      countryCode: _selectedCountry == 'all' ? '' : (_selectedCountry ?? ''),
                      city: _selectedCity ?? '',
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

