import 'profile_models.dart';

/// Self profil summary görünüm modeli — web `buildSelfProfileViewModel` karşılığı.
/// Türetilmiş sayaçlar saf fonksiyonlarla hesaplanır (test edilebilir, app.md 803).
class SelfProfileViewModel {
  const SelfProfileViewModel({
    required this.displayName,
    required this.roleLabel,
    required this.email,
    required this.completionPercentage,
    required this.publicAttributeCount,
    required this.pendingCount,
    required this.dashboardCount,
  });

  final String displayName;
  final String roleLabel;
  final String? email;
  final int completionPercentage;
  final int publicAttributeCount;
  final int pendingCount;
  final int dashboardCount;

  factory SelfProfileViewModel.from(
    CurrentUserProfile profile, {
    int dashboardCount = 0,
  }) {
    return SelfProfileViewModel(
      displayName: profile.displayName,
      roleLabel: profile.roleLabel,
      email: profile.email,
      completionPercentage: completionPercentageOf(profile),
      publicAttributeCount: publicAttributeCountOf(profile),
      pendingCount: profile.pendingRequests.length,
      dashboardCount: dashboardCount,
    );
  }
}

/// Tamamlanma yüzdesi (0-100 aralığına sıkıştırılır).
int completionPercentageOf(CurrentUserProfile p) {
  final v = p.profileCompletion?.percentage ?? 0;
  if (v < 0) return 0;
  if (v > 100) return 100;
  return v;
}

/// Public görünür alan sayısı (visibility == 'public').
int publicAttributeCountOf(CurrentUserProfile p) {
  return p.attributes.where((a) => a.visibility == 'public').length;
}
