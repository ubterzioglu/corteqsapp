import 'package:freezed_annotation/freezed_annotation.dart';

part 'admin_approval.freezed.dart';
part 'admin_approval.g.dart';

/// Admin onay talebi — `approval_requests` tablosu (web admin-approvals-api.ts).
@freezed
abstract class AdminApprovalRequest with _$AdminApprovalRequest {
  const AdminApprovalRequest._();

  const factory AdminApprovalRequest({
    required String id,
    @JsonKey(name: 'request_type') @Default('') String requestType,
    @JsonKey(name: 'user_id') @Default('') String userId,
    @JsonKey(name: 'target_role_key') String? targetRoleKey,
    @JsonKey(name: 'target_feature_key') String? targetFeatureKey,
    @JsonKey(name: 'target_entity_type') String? targetEntityType,
    @Default('pending') String status,
    @JsonKey(name: 'admin_note') String? adminNote,
    @JsonKey(name: 'created_at') String? createdAt,
  }) = _AdminApprovalRequest;

  factory AdminApprovalRequest.fromJson(Map<String, dynamic> json) =>
      _$AdminApprovalRequestFromJson(json);

  bool get isPending => status == 'pending';

  /// Talebin neyle ilgili olduğunu özetleyen kısa etiket.
  String get targetLabel =>
      targetRoleKey ?? targetFeatureKey ?? targetEntityType ?? requestType;
}

/// Onay kararı (web: 'approved' | 'rejected').
enum ApprovalDecision {
  approved,
  rejected;

  String get value => name;
}
