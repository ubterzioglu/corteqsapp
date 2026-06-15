import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/network/supabase_provider.dart';
import '../domain/admin_approval.dart';

/// Admin-lite veri erişimi — web `admin-approvals-api.ts` + `admin` review sarmalayıcısı.
/// Tüm yetki RLS + RPC policy'de; istemci RoleGate yalnız UX.
class AdminRepository {
  AdminRepository(this._client);
  final SupabaseClient _client;

  /// Onay talepleri (en yeni önce). RLS admin'e açık.
  Future<List<AdminApprovalRequest>> fetchApprovals() async {
    final data = await _client
        .from('approval_requests')
        .select(
          'id, request_type, user_id, target_role_key, target_feature_key, '
          'target_entity_type, payload, status, admin_note, created_at',
        )
        .order('created_at', ascending: false);

    return (data as List)
        .map((e) =>
            AdminApprovalRequest.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList();
  }

  /// Talebi onayla/reddet — RPC `admin_review_approval_request`.
  Future<void> review({
    required String requestId,
    required ApprovalDecision decision,
    String? note,
  }) async {
    final params = <String, dynamic>{
      'request_id': requestId,
      'decision': decision.value,
    };
    if (note != null && note.trim().isNotEmpty) params['note'] = note.trim();
    await _client.rpc('admin_review_approval_request', params: params);
  }
}

final adminRepositoryProvider = Provider<AdminRepository>((ref) {
  return AdminRepository(ref.watch(supabaseClientProvider));
});

/// Onay talepleri listesi (review sonrası invalidate edilir).
final adminApprovalsProvider =
    FutureProvider<List<AdminApprovalRequest>>((ref) async {
  return ref.watch(adminRepositoryProvider).fetchApprovals();
});
