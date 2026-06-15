# Storage Buckets

Kaynak: `supabase/migrations/` (`storage.buckets` insert'leri) + `src/` (`.storage.from(...)` çağrıları). Canlı repodan.

| Bucket | Kullanım | İlgili feature |
|---|---|---|
| `avatars` | Profil avatarları | `update_profile_avatar` RPC |
| `cv-files` / `profile-cv-files` | CV/özgeçmiş dosyaları | `profile.cv_upload` |
| `profile-presentation-files` | Sunum/tanıtım dosyaları | `profile.presentation_upload` |
| `user-documents` | Genel kullanıcı belgeleri | profil belgeler sekmesi |
| `submission-documents` | Form gönderim belgeleri | lansman/survey |
| `job-applications` | İş başvuru dosyaları | iş ilanları |
| `service-attachments` | Hizmet ekleri | service-finder |
| `interest-uploads` | Cadde ilgi alanı görselleri | cadde |
| `post-archive` | Cadde post arşivi | cadde feed |
| `newsimage` | Radar haber görselleri | radar |
| `whatsapp-landing-hero` | WhatsApp landing hero | whatsapp landings |
| `world-cup-images` | Dünya Kupası görselleri | dunya-kupasi |
| `arge-files` | AR-GE workspace dosyaları | admin workspace |

## Flutter karşılığı
- Avatar upload: `profile/data/profile_repository.dart` → `update_profile_avatar` RPC + `avatars` bucket.
- CV/sunum: `profile.cv_upload` / `profile.presentation_upload` gated → ilgili bucket'a `supabase.storage.from(bucket).upload(...)`.
- İlk dalga yalnız avatar + CV/sunum bucket'larını gerektirir; diğerleri ilgili feature dalgasında.
