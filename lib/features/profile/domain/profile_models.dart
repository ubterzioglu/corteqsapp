import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_models.freezed.dart';
part 'profile_models.g.dart';

/// Profil alanı (attribute) durumu.
/// Web karşılığı: `ProfileAttributeState` (`src/lib/member-profile.ts`).
@freezed
abstract class ProfileAttribute with _$ProfileAttribute {
  const factory ProfileAttribute({
    @JsonKey(name: 'attribute_key') required String attributeKey,
    @Default('') String label,
    @Default('private') String visibility, // 'public' | 'private'
    @JsonKey(name: 'value_json') dynamic valueJson,
    @JsonKey(name: 'value_text') String? valueText,
  }) = _ProfileAttribute;

  factory ProfileAttribute.fromJson(Map<String, dynamic> json) =>
      _$ProfileAttributeFromJson(json);
}

/// Bekleyen onay talebi özeti.
@freezed
abstract class PendingRequest with _$PendingRequest {
  const factory PendingRequest({
    String? id,
    @JsonKey(name: 'request_type') String? requestType,
    String? status,
    String? label,
  }) = _PendingRequest;

  factory PendingRequest.fromJson(Map<String, dynamic> json) =>
      _$PendingRequestFromJson(json);
}

/// Mevcut kullanıcı profil payload'ı.
/// Web karşılığı: `CurrentUserProfilePayload` — RPC `get_current_user_profile` (Json).
@freezed
abstract class CurrentUserProfile with _$CurrentUserProfile {
  const CurrentUserProfile._();

  const factory CurrentUserProfile({
    @JsonKey(name: 'user_id') @Default('') String userId,
    String? email,
    @JsonKey(name: 'full_name') String? fullName,
    @JsonKey(name: 'profile_type') @Default('') String profileType,
    @JsonKey(name: 'role_label') @Default('') String roleLabel,
    @Default(<ProfileAttribute>[]) List<ProfileAttribute> attributes,
    @JsonKey(name: 'pending_requests')
    @Default(<PendingRequest>[]) List<PendingRequest> pendingRequests,
    @JsonKey(name: 'profile_completion')
    ProfileCompletion? profileCompletion,
  }) = _CurrentUserProfile;

  factory CurrentUserProfile.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserProfileFromJson(json);

  /// Görünen ad — full_name yoksa varsayılan.
  String get displayName =>
      (fullName != null && fullName!.trim().isNotEmpty)
          ? fullName!.trim()
          : 'CorteQS Üyesi';
}

@freezed
abstract class ProfileCompletion with _$ProfileCompletion {
  const factory ProfileCompletion({
    @Default(0) int percentage,
  }) = _ProfileCompletion;

  factory ProfileCompletion.fromJson(Map<String, dynamic> json) =>
      _$ProfileCompletionFromJson(json);
}
