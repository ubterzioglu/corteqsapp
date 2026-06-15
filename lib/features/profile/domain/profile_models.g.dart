// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ProfileAttribute _$ProfileAttributeFromJson(Map<String, dynamic> json) =>
    _ProfileAttribute(
      attributeKey: json['attribute_key'] as String,
      label: json['label'] as String? ?? '',
      visibility: json['visibility'] as String? ?? 'private',
      valueJson: json['value_json'],
      valueText: json['value_text'] as String?,
    );

Map<String, dynamic> _$ProfileAttributeToJson(_ProfileAttribute instance) =>
    <String, dynamic>{
      'attribute_key': instance.attributeKey,
      'label': instance.label,
      'visibility': instance.visibility,
      'value_json': instance.valueJson,
      'value_text': instance.valueText,
    };

_PendingRequest _$PendingRequestFromJson(Map<String, dynamic> json) =>
    _PendingRequest(
      id: json['id'] as String?,
      requestType: json['request_type'] as String?,
      status: json['status'] as String?,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$PendingRequestToJson(_PendingRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'request_type': instance.requestType,
      'status': instance.status,
      'label': instance.label,
    };

_CurrentUserProfile _$CurrentUserProfileFromJson(Map<String, dynamic> json) =>
    _CurrentUserProfile(
      userId: json['user_id'] as String? ?? '',
      email: json['email'] as String?,
      fullName: json['full_name'] as String?,
      profileType: json['profile_type'] as String? ?? '',
      roleLabel: json['role_label'] as String? ?? '',
      attributes:
          (json['attributes'] as List<dynamic>?)
              ?.map((e) => ProfileAttribute.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ProfileAttribute>[],
      pendingRequests:
          (json['pending_requests'] as List<dynamic>?)
              ?.map((e) => PendingRequest.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <PendingRequest>[],
      profileCompletion: json['profile_completion'] == null
          ? null
          : ProfileCompletion.fromJson(
              json['profile_completion'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CurrentUserProfileToJson(_CurrentUserProfile instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'email': instance.email,
      'full_name': instance.fullName,
      'profile_type': instance.profileType,
      'role_label': instance.roleLabel,
      'attributes': instance.attributes,
      'pending_requests': instance.pendingRequests,
      'profile_completion': instance.profileCompletion,
    };

_ProfileCompletion _$ProfileCompletionFromJson(Map<String, dynamic> json) =>
    _ProfileCompletion(percentage: (json['percentage'] as num?)?.toInt() ?? 0);

Map<String, dynamic> _$ProfileCompletionToJson(_ProfileCompletion instance) =>
    <String, dynamic>{'percentage': instance.percentage};
