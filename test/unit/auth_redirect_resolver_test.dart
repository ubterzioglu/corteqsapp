import 'package:corteqs_app/features/auth/domain/auth_redirect.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('resolveNextPath', () {
    test('next verilmezse /profile döner', () {
      expect(resolveNextPath(), '/profile');
    });

    test('geçerli next (/ ile başlayan) döner', () {
      expect(resolveNextPath(next: '/cadde'), '/cadde');
    });

    test('redirect param fallback olarak kullanılır', () {
      expect(resolveNextPath(redirect: '/directory'), '/directory');
    });

    test('next, redirect üzerinde önceliklidir', () {
      expect(
        resolveNextPath(next: '/cadde', redirect: '/directory'),
        '/cadde',
      );
    });

    test('/ ile başlamayan değer reddedilir → /profile', () {
      expect(resolveNextPath(next: 'https://evil.com'), '/profile');
    });

    test('boş next → /profile', () {
      expect(resolveNextPath(next: '  '), '/profile');
    });
  });
}
