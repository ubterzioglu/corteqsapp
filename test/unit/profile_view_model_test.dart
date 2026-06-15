import 'package:corteqs_app/features/profile/domain/profile_models.dart';
import 'package:corteqs_app/features/profile/domain/profile_view_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  CurrentUserProfile profile({
    int percentage = 0,
    List<ProfileAttribute> attrs = const [],
    List<PendingRequest> pending = const [],
    String? fullName,
  }) {
    return CurrentUserProfile(
      userId: 'u1',
      fullName: fullName,
      roleLabel: 'Üye',
      attributes: attrs,
      pendingRequests: pending,
      profileCompletion: ProfileCompletion(percentage: percentage),
    );
  }

  group('completionPercentageOf', () {
    test('normal değer korunur', () {
      expect(completionPercentageOf(profile(percentage: 42)), 42);
    });
    test('100 üzeri 100\'e sıkışır', () {
      expect(completionPercentageOf(profile(percentage: 130)), 100);
    });
    test('negatif 0\'a sıkışır', () {
      expect(completionPercentageOf(profile(percentage: -5)), 0);
    });
    test('completion yoksa 0', () {
      expect(
        completionPercentageOf(const CurrentUserProfile(userId: 'u')),
        0,
      );
    });
  });

  group('publicAttributeCountOf', () {
    test('yalnız public alanlar sayılır', () {
      final p = profile(attrs: const [
        ProfileAttribute(attributeKey: 'a', visibility: 'public'),
        ProfileAttribute(attributeKey: 'b', visibility: 'private'),
        ProfileAttribute(attributeKey: 'c', visibility: 'public'),
      ]);
      expect(publicAttributeCountOf(p), 2);
    });
  });

  group('SelfProfileViewModel.from', () {
    test('sayaçlar ve ad doğru türetilir', () {
      final p = profile(
        percentage: 60,
        fullName: 'Ada Lovelace',
        attrs: const [
          ProfileAttribute(attributeKey: 'a', visibility: 'public'),
        ],
        pending: const [PendingRequest(id: '1'), PendingRequest(id: '2')],
      );
      final vm = SelfProfileViewModel.from(p, dashboardCount: 3);
      expect(vm.displayName, 'Ada Lovelace');
      expect(vm.completionPercentage, 60);
      expect(vm.publicAttributeCount, 1);
      expect(vm.pendingCount, 2);
      expect(vm.dashboardCount, 3);
    });

    test('full_name yoksa varsayılan ad', () {
      final vm = SelfProfileViewModel.from(profile());
      expect(vm.displayName, 'CorteQS Üyesi');
    });
  });
}
