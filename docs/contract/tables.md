# Tablo Envanteri

Kaynak: `supabase/migrations/` `create table` ifadeleri (canlı repodan, ~170 ad — bazıları backup/partial).
Kolon detayları için ilgili migration okunmalı. **İlk dalga kritik ⭐.**

## Kimlik / profil / yetki ⭐
`profiles`, `user_profiles`, `user_profile_attributes`⭐, `user_role_assignments`⭐, `user_roles`, `roles`,
`role_feature_flags`, `role_feature_defaults`, `feature_catalog`, `feature_definitions`, `user_feature_overrides`,
`individual_profile_details`, `independent_profiles`, `person_profile_details`, `profile_views`, `profile_section_catalog`,
`profile_onboarding_imports`, `attribute_catalog`, `user_taxonomy_selections`, `taxonomy_groups`, `taxonomy_options`,
`approval_requests`⭐, `admin_users`, `admin_audit_logs`, `user_verifications`, `phone_verifications`, `user_connections`.

## Directory / catalog ⭐
`catalog_items`⭐, `catalog_item_attributes`, `catalog_item_attribute_overrides`, `catalog_item_categories`,
`catalog_item_contacts`, `catalog_item_favorites`, `catalog_item_feature_overrides`, `catalog_item_languages`,
`catalog_item_links`, `catalog_item_locations`⭐, `catalog_item_media`, `catalog_item_memberships`, `catalog_item_relations`,
`catalog_item_reports`, `catalog_item_reviews`, `catalog_item_roles`, `catalog_item_section_overrides`,
`catalog_item_services`, `catalog_item_tags`, `catalog_item_types`, `catalog_item_verification_records`,
`catalog_categories`, `catalog_search_documents`, `catalog_claim_requests`, `catalog_audit_logs`,
`business_details`, `consultant_categories`, `organization_details`, `community_group_details`, `advisor_details`,
`event_details`, `job_posting_details`, `marketplace_listing_details`, çeşitli `*_social_media_links`.

## Cadde ⭐
`cadde_posts`⭐, `cadde_post_comments`⭐, `cadde_post_reactions`⭐, `cadde_post_interests`, `feed_posts`, `feed_likes`,
`cadde_cafes`⭐, `cadde_cafe_members`, `cafes`, `cafe_memberships`⭐, `cadde_countries`, `cadde_cities`,
`cadde_interest_catalog`, `user_cadde_interests`, `cadde_billboard_cards`, `cadde_sponsored_placements`,
`cadde_promotion_campaigns`, `cadde_promotion_events`, `cadde_promotion_placements`, `cadde_promotion_placement_catalog`,
`cadde_moderation_queue`, `cadde_reports`, `cadde_user_bans`, `cadde_settings`,
`carsi_items`⭐, `carsi_categories`, `user_follows`, `notifications`⭐.

## Geo ⭐
`geo_countries`, `geo_cities` (→ `geo.md`, 1000-satır paging).

## Mesajlaşma / içerik
`messages`, `direct_messages`, `contact_messages`, `generated_posts`, `blog_posts`, `events`, `service_requests`,
`service_proposals`, `job_listings`, `job_applications`, `coupon_purchases`, `appointments`, `marquee_items`, `matches`.

## Lansman / survey / form
`surveys`, `survey_questions`, `survey_answers`, `survey_responses`, `submissions`, `lansman_registrations`,
`interest_registrations`, `founding_*`, `welcome_pack_orders`, `welcome_pack_proposals`.

## Radar / service-finder / muhasebe / workspace (çoğu web/admin)
`radar_news_*` (candidates/keywords/review_logs/scan_runs/sources),
`service_finder_*` (jobs/candidates/queries/sources/events/cost_ledger/provider_configs/profession_templates),
`expenses`, `incomes`, `command_center_items`, `mvp_items`, `meeting_notes`(bucket), `resource_entries`, `todos`.

## WhatsApp / kampanya / misyon
`whatsapp_landings`, `whatsapp_landing_editors`, `whatsapp_join_requests`, `wa_users`, `city_ambassador_applications`,
`world_cup_*`, `turkish_missions`/`turkish_mission_units`/`turkish_mission_relations`, `consulate`/`site_settings`,
`edge_rate_limits` (abuse koruması), `referral_*`.

> Not: `_member_backup_`, `afs_backup`, `merge_history`, `duplicate_candidates`, `source_records`, `may`, `founding_` gibi
> adlar backup/migration/partial artifact'leridir; istemci sözleşmesi değildir.
