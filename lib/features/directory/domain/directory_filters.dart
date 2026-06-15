/// Dizin filtre durumu. Web query param'larıyla birebir: q, role, country, city, featured.
/// Query map'e serialize/deserialize edilir (deep-link paylaşımı + test edilebilirlik).
class DirectoryFilters {
  const DirectoryFilters({
    this.searchText = '',
    this.roleKey = 'all',
    this.countryCode = '',
    this.city = '',
    this.featuredOnly = false,
  });

  final String searchText;
  final String roleKey; // 'all' = filtre yok
  final String countryCode;
  final String city;
  final bool featuredOnly;

  static const empty = DirectoryFilters();

  bool get isEmpty =>
      searchText.isEmpty &&
      roleKey == 'all' &&
      countryCode.isEmpty &&
      city.isEmpty &&
      !featuredOnly;

  DirectoryFilters copyWith({
    String? searchText,
    String? roleKey,
    String? countryCode,
    String? city,
    bool? featuredOnly,
  }) {
    return DirectoryFilters(
      searchText: searchText ?? this.searchText,
      roleKey: roleKey ?? this.roleKey,
      countryCode: countryCode ?? this.countryCode,
      city: city ?? this.city,
      featuredOnly: featuredOnly ?? this.featuredOnly,
    );
  }

  /// Query string map'ine çevir (boş/varsayılan değerler atlanır).
  /// Web karşılığı: DirectoryPage searchParams (q/role/country/city/featured=1).
  Map<String, String> toQuery() {
    final q = <String, String>{};
    if (searchText.trim().isNotEmpty) q['q'] = searchText.trim();
    if (roleKey != 'all' && roleKey.isNotEmpty) q['role'] = roleKey;
    if (countryCode.isNotEmpty) q['country'] = countryCode;
    if (city.trim().isNotEmpty) q['city'] = city.trim();
    if (featuredOnly) q['featured'] = '1';
    return q;
  }

  /// Query map'inden filtre oluştur (eksik anahtarlar varsayılana düşer).
  factory DirectoryFilters.fromQuery(Map<String, String> query) {
    return DirectoryFilters(
      searchText: query['q'] ?? '',
      roleKey: query['role'] ?? 'all',
      countryCode: query['country'] ?? '',
      city: query['city'] ?? '',
      featuredOnly: query['featured'] == '1',
    );
  }

  @override
  bool operator ==(Object other) =>
      other is DirectoryFilters &&
      other.searchText == searchText &&
      other.roleKey == roleKey &&
      other.countryCode == countryCode &&
      other.city == city &&
      other.featuredOnly == featuredOnly;

  @override
  int get hashCode =>
      Object.hash(searchText, roleKey, countryCode, city, featuredOnly);
}
