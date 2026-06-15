# Feature Keys

Kaynak: `src/lib/features.ts` (canlı repodan birebir çıkarıldı).
İki kategori: **generic** (rol-tabanlı) ve **legacy-individual** (bireysel profil, `individual.` prefix'li).

Feature kaynağı (`FeatureSource`): `"override" | "role_default" | "fallback"`.

## Generic Feature Keys (`GENERIC_FEATURE_KEYS`)

| Key | Label | Subkategori | Flutter gated alan |
|---|---|---|---|
| `profile.view_own` | Kendi Profilini Gör | 📋 Profil Yönetimi | SelfProfilePage erişimi |
| `profile.edit_own` | Kendi Profilini Düzenle | 📋 Profil Yönetimi | Profil düzenleme formları |
| `profile.edit_public` | Public Alanları Düzenle | 📋 Profil Yönetimi | Public alan editörü |
| `profile.linkedin_card` | LinkedIn Kartı | 📋 Profil Yönetimi | LinkedIn kart widget |
| `profile.website_card` | Web Sitesi Kartı | 📋 Profil Yönetimi | Website kart widget |
| `profile.cv_upload` | CV Yükleme | 📋 Profil Yönetimi | Belgeler sekmesi → CV upload |
| `profile.presentation_upload` | Sunum Yükleme | 📋 Profil Yönetimi | Belgeler sekmesi → sunum upload |
| `directory.visible` | Directory Görünürlüğü | 🗂️ Directory | Directory listeleme |
| `directory.featured` | Öne Çıkarılmış Profil | 🗂️ Directory | Featured kart rozeti |
| `contact.receive` | İletişim Talebi Al | 💬 İletişim | İletişim CTA |
| `contact.show_whatsapp` | WhatsApp Göster | 💬 İletişim | WhatsApp public alanı |
| `content.create` | İçerik Oluştur | ✍️ İçerik | Cadde composer |
| `content.edit_own` | İçeriğini Düzenle | ✍️ İçerik | Post düzenleme |
| `events.create` | Etkinlik Oluştur | 🎯 Üretim | Etkinlik akışı |
| `offers.create` | Teklif Oluştur | 🎯 Üretim | Teklif/hizmet akışı |
| `referral.create` | Referral Oluştur | 🎯 Üretim | Referral akışı |
| `cadde.access` | Cadde Erişimi | 🌐 Platform | Cadde shell route guard |
| `city.manage` | Şehir Yönetimi | 🌐 Platform | Şehir yönetim alanı |
| `whatsapp_landing.edit_assigned` | Atanmış Topluluk Landing Düzenleme | 🌐 Platform | Admin-lite landing editör |
| `admin.requires_approval` | Admin Onayı Gerekir | ⚙️ Sistem | Onay gerektiren akış işareti |

## Legacy-Individual Feature Keys (`INDIVIDUAL_FEATURE_KEYS`)

| Key | Label |
|---|---|
| `individual.about` | Hakkında |
| `individual.service_requests` | Hizmet Talepleri |
| `individual.events` | Etkinlikler |
| `individual.follows` | Takipler |
| `individual.whatsapp` | WhatsApp |
| `individual.messages` | Mesajlar |
| `individual.activity` | Aktivite |
| `individual.cv_request` | CV Talebi |
| `individual.job_seeking_badge` | İş Arıyorum Badge'i |
| `individual.moving_soon_badge` | Yakında Taşınacağım |
| `individual.volunteer_mentorship` | Gönüllü Mentörlük |

## Flutter karşılığı

- `core/` veya `shared/` altında `AppFeatureKey` enum/const sınıfı bu listeyi birebir yansıtmalı.
- `featureFlagsProvider`, kullanıcı feature setini RPC `get_current_user_features` üzerinden çeker.
- `FeatureGate(featureKey, child, fallback)` widget → key yoksa fallback / "talep oluştur" CTA.
- **İstemci gating yalnız UX'tir; gerçek yetki RLS + function policy.**
