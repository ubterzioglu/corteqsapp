# Açık Ürün Kararları (Sahiplerle Çözülecek)

app.md 812-814 + canlı repo doğrulaması. Phase 0 onayından önce netleşmeli.

| Karar | Durum / Repo izi | Gereken |
|---|---|---|
| Hedef OS / cihaz matrisi | Repoda belirtilmemiş | Min Android API + min iOS sürümü |
| App Store / Play Store sahipliği | Belirtilmemiş | Hesap sahipliği + bundle ID (`com.corteqs.corteqs_app`) |
| Push notification sağlayıcı | DB `notifications` tablosu + trigger var; push provider yok | FCM/APNs kararı |
| Crash reporting | Yok | Sentry / Crashlytics seçimi |
| Apple Sign-In | Repoda **yalnız Google OAuth** doğrulandı | iOS App Store için Apple Sign-In gerekebilir (politika) |
| Tam-admin mobil kapsam | ~71 admin sayfası | Admin-lite sınırı (aşağıda) onaylanmalı |
| Supabase env (URL/anon key) | `src/integrations/supabase/client.ts` | dev/staging/prod proje bilgileri |
| `submit-survey-response` abuse | public (jwt=false), `edge_rate_limits` tablosu mevcut | Backend rate-limit politikası teyidi |

## Admin-lite önerilen kapsam (Phase 6b)
Mobilde: **approvals** (`admin_review_approval_request`), **audit özet** (`admin_audit_logs`),
**Cadde moderation** (`cadde_moderation_queue`), **workspace hızlı erişim**, **survey yanıt özeti**, **kritik dashboard sayaçları** (`get_current_user_dashboard`).
Web'de kalır: service-finder yönetimi, catalog override editörleri, taxonomy/role matrix, bulk veri tabloları, radar pipeline yönetimi.

## Drift uzlaştırma (Phase 0 zorunlu)
- En güncel migration `20260615130000` — Supabase canlı şema ile bu klon eşleşiyor mu teyit et.
- `user_profiles` vs `user_profiles_v2`: repoda `user_profiles` + `profiles` var; v2 ayrımı doğrulanmalı.
- Supabase generated types: `src/integrations/supabase/types.ts` — Flutter domain modelleri buradan türetilebilir.
