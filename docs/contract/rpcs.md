# Postgres RPC'leri

Kaynak: `src/` içindeki `.rpc('...')` çağrıları (canlı repodan). 73 RPC. Çoğu admin (`admin_*`).
**İlk mobil dalga için kritik olanlar ⭐ ile işaretli.**

## Kullanıcı / profil (member dalgası)
- ⭐ `get_current_user_profile` — self profil özeti (Phase 4)
- ⭐ `get_current_user_features` — feature seti → `featureFlagsProvider` (Phase 1/4)
- ⭐ `get_current_user_dashboard` — dashboard sayaçları (Phase 4)
- ⭐ `update_profile_attribute` — profil alanı güncelle (Phase 4)
- ⭐ `update_profile_avatar` — avatar (Phase 4)
- `get_current_profile_onboarding_activation` / `complete_current_profile_onboarding_activation` — onboarding (Phase 2)
- `submit_feature_request` / `submit_role_change_request` — talepler (Phase 4)
- `get_public_independent_profile` — public bireysel profil
- `get_current_member_catalog_profile` / `list_member_catalog_names`
- `validate_and_bind_referral_code` — referral

## Directory / catalog (Phase 3)
- ⭐ `search_directory_catalog` — dizin araması (Phase 3)
- ⭐ `get_catalog_item_profile` — kanonik public profil (Phase 3)
- `get_catalog_item_rules` / `get_my_editable_catalog_items` / `update_catalog_item_attribute`
- `submit_catalog_claim_request`

## Cadde (Phase 5)
- ⭐ `get_cadde_actor_context` — Cadde aktör bağlamı (Phase 5)

## WhatsApp landing
- `current_user_can_edit_whatsapp_landing` / `get_current_user_editable_whatsapp_landing` / `update_current_user_editable_whatsapp_landing`

## Sistem
- ⭐ `is_admin` — admin kontrolü (route guard / admin-lite)
- `get_flat_roles` / `get_role_management_bundle` / `get_rebuild_status_report` / `get_submission_documents_bucket_stats`

## Admin (admin-lite dalgası — Phase 6b, seçili)
`admin_review_approval_request`, `admin_search_profiles`, `admin_list_unified_records`, `admin_list_member_catalog_profiles`,
`admin_set_user_role`, `admin_set_user_feature_override[_detailed]`, `admin_clear_user_feature_override`,
`admin_set_role_feature_flag`, `admin_set_feature_global_state`, `admin_update_user_profile_attribute`,
`admin_set_attribute_rule`, `admin_update_user_taxonomy_selection`, `admin_set_taxonomy_option_active`.

## Admin (web'de kalır — service-finder + catalog yönetimi)
`admin_*_service_finder_*` (create/cancel/retry/get/list/publish/review/upsert), `admin_*_catalog_*`
(approve/reject/list claims, grant/revoke editor, set/upsert/delete attribute/feature/section overrides, set role),
`admin_grant_whatsapp_landing_editor` / `admin_revoke_whatsapp_landing_editor`,
`admin_upsert_entity_metadata`, `admin_upsert_role_profile_section_rule`, `admin_upsert_role_taxonomy_rule`,
`admin_set_member_catalog_role`, `admin_set_catalog_item_editor`.
