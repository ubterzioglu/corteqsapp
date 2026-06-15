import 'package:corteqs_app/features/directory/domain/directory_filters.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DirectoryFilters serialization', () {
    test('boş filtre boş query üretir', () {
      expect(DirectoryFilters.empty.toQuery(), isEmpty);
    });

    test('toQuery yalnız varsayılan-olmayan alanları içerir', () {
      const f = DirectoryFilters(
        searchText: 'avukat',
        roleKey: 'lawyer',
        countryCode: 'DE',
        city: 'Berlin',
        featuredOnly: true,
      );
      expect(f.toQuery(), {
        'q': 'avukat',
        'role': 'lawyer',
        'country': 'DE',
        'city': 'Berlin',
        'featured': '1',
      });
    });

    test('role=all query\'ye yazılmaz', () {
      const f = DirectoryFilters(roleKey: 'all', searchText: 'x');
      expect(f.toQuery().containsKey('role'), isFalse);
    });

    test('fromQuery round-trip korunur', () {
      const original = DirectoryFilters(
        searchText: 'doktor',
        roleKey: 'consultant',
        countryCode: 'NL',
        city: 'Amsterdam',
        featuredOnly: true,
      );
      final restored = DirectoryFilters.fromQuery(original.toQuery());
      expect(restored, original);
    });

    test('fromQuery eksik anahtarlarda varsayılana düşer', () {
      final f = DirectoryFilters.fromQuery({'q': 'merhaba'});
      expect(f.searchText, 'merhaba');
      expect(f.roleKey, 'all');
      expect(f.countryCode, '');
      expect(f.featuredOnly, isFalse);
    });

    test('featured yalnız "1" iken true', () {
      expect(DirectoryFilters.fromQuery({'featured': '1'}).featuredOnly, isTrue);
      expect(DirectoryFilters.fromQuery({'featured': '0'}).featuredOnly, isFalse);
    });
  });
}
