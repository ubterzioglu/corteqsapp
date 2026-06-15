// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_approval.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AdminApprovalRequest _$AdminApprovalRequestFromJson(
  Map<String, dynamic> json,
) => _AdminApprovalRequest(
  id: json['id'] as String,
  requestType: json['request_type'] as String? ?? '',
  userId: json['user_id'] as String? ?? '',
  targetRoleKey: json['target_role_key'] as String?,
  targetFeatureKey: json['target_feature_key'] as String?,
  targetEntityType: json['target_entity_type'] as String?,
  status: json['status'] as String? ?? 'pending',
  adminNote: json['admin_note'] as String?,
  createdAt: json['created_at'] as String?,
);

Map<String, dynamic> _$AdminApprovalRequestToJson(
  _AdminApprovalRequest instance,
) => <String, dynamic>{
  'id': instance.id,
  'request_type': instance.requestType,
  'user_id': instance.userId,
  'target_role_key': instance.targetRoleKey,
  'target_feature_key': instance.targetFeatureKey,
  'target_entity_type': instance.targetEntityType,
  'status': instance.status,
  'admin_note': instance.adminNote,
  'created_at': instance.createdAt,
};
