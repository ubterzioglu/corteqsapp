// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AuthProfile _$AuthProfileFromJson(Map<String, dynamic> json) => _AuthProfile(
  fullName: json['full_name'] as String?,
  avatarUrl: json['avatar_url'] as String?,
  phone: json['phone'] as String?,
  accountType: json['account_type'] as String?,
  onboardingCompleted: json['onboarding_completed'] as bool? ?? false,
);

Map<String, dynamic> _$AuthProfileToJson(_AuthProfile instance) =>
    <String, dynamic>{
      'full_name': instance.fullName,
      'avatar_url': instance.avatarUrl,
      'phone': instance.phone,
      'account_type': instance.accountType,
      'onboarding_completed': instance.onboardingCompleted,
    };
