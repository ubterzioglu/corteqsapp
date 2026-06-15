# Corteqs Sözleşme Paketi (Schema Pack)

Bu klasör, Flutter istemcisinin karşı kodladığı **tek doğru sözleşme** (source of truth) referansıdır.
Kaynak: GitHub `ubterzioglu/corteqsmvp` (klon: `c:\tmp\corteqsmvp-src`, `main` branch).

> **Önemli:** Bu dosyalar canlı repodan **doğrulanarak** çıkarılmıştır (app.md'deki placeholder'lar değil).
> Backend değiştikçe bu paket güncellenmeli ve Flutter tarafı buna göre uyarlanmalıdır.
> Yetki **asla** istemcide uygulanmaz — gerçek otorite Supabase Auth + RLS + function politikalarıdır.

## İçindekiler

| Dosya | Kapsam |
|---|---|
| `feature_keys.md` | Tüm feature key'leri (`src/lib/features.ts`) + gated ekran eşlemesi |
| `routes.md` | Tüm web rotaları (`src/App.tsx`, `src/pages/admin/routes.tsx`) + kanonik kurallar |
| `query_keys.md` | `caddeQueryKeys` (`src/lib/cadde-query-keys.ts`) → Riverpod provider family eşlemesi |
| `functions.md` | Edge functions + `verify_jwt` (`supabase/config.toml`, `supabase/functions/`) |
| `rpcs.md` | Kullanılan Postgres RPC'leri (`.rpc(...)` çağrıları) |
| `tables.md` | Tablo envanteri (`supabase/migrations/`) |
| `buckets.md` | Storage bucket'ları |
| `geo.md` | Geo veri + PostgREST 1000-satır paging kuralı (`src/lib/geo.ts`) |
| `decisions.md` | Sahiplerle çözülecek açık ürün kararları |

## Doğrulanmış üst-düzey gerçekler

- React Router **7.17.0** (drift: doküman 6 diyordu).
- **256 migration**, en güncel `20260615130000`. Drift app.md'nin sandığından büyük.
- **121 tablo**, **100+ RPC** (çoğu admin), **14 storage bucket**, **5 edge function**.
- **~69 üst-düzey sayfa + ~71 admin sayfası** → admin-lite kararı doğru.
- Auth: Supabase, **yalnız Google OAuth** + email/şifre (Apple yok).
