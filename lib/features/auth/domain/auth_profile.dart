import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_profile.freezed.dart';
part 'auth_profile.g.dart';

/// Oturum açmış kullanıcının profil özeti.
/// Web karşılığı: `src/components/auth/auth-context.ts` → `Profile`.
@freezed
abstract class AuthProfile with _$AuthProfile {
  const factory AuthProfile({
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'avatar_url') String? avatarUrl,
    String? phone,
    @JsonKey(name: 'account_type') String? accountType,
    @JsonKey(name: 'onboarding_completed')
    @Default(false) bool onboardingCompleted,
  }) = _AuthProfile;

  factory AuthProfile.fromJson(Map<String, dynamic> json) =>
      _$AuthProfileFromJson(json);
}
