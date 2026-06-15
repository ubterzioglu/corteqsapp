import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/directory_repository.dart';
import '../domain/directory_filters.dart';
import '../domain/directory_models.dart';

/// Aktif filtre durumu (Riverpod 3 Notifier). UI bunu günceller; sonuç provider'ı izler.
class DirectoryFiltersNotifier extends Notifier<DirectoryFilters> {
  @override
  DirectoryFilters build() => DirectoryFilters.empty;

  void setSearchText(String v) => state = state.copyWith(searchText: v);
  void setRole(String key) => state = state.copyWith(roleKey: key);
  void setCountry(String code) => state = state.copyWith(countryCode: code);
  void setCity(String city) => state = state.copyWith(city: city);
  void setFeaturedOnly(bool v) => state = state.copyWith(featuredOnly: v);
  void apply(DirectoryFilters filters) => state = filters;
  void clear() => state = DirectoryFilters.empty;
}

final directoryFiltersProvider =
    NotifierProvider<DirectoryFiltersNotifier, DirectoryFilters>(
  DirectoryFiltersNotifier.new,
);

/// Aktif filtreye göre dizin sonuçları.
final directoryResultsProvider = FutureProvider<List<DirectoryRow>>((ref) async {
  final filters = ref.watch(directoryFiltersProvider);
  return ref.watch(directoryRepositoryProvider).search(filters);
});

/// Dizinde görünür rol seçenekleri (filtre sheet için).
final directoryRoleOptionsProvider =
    FutureProvider<List<DirectoryRoleOption>>((ref) async {
  return ref.watch(directoryRepositoryProvider).roleOptions();
});

/// Toplam katalog kaydı sayısı.
final directoryTotalCountProvider = FutureProvider<int>((ref) async {
  return ref.watch(directoryRepositoryProvider).totalCount();
});
