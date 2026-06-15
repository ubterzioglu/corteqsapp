# Corteqs Flutter — Handover & Sıfırdan Kurulum Kılavuzu

> **GİZLİ — repoya commit edilmez.** Bu dosya Supabase anahtarları içerir ve `.gitignore` ile dışlanmıştır.
> Yeni bilgisayara **güvenli kanaldan** (şifreli USB / parola yöneticisi) taşıyın; e-postayla göndermeyin.

Son güncelleme: 2026-06-15 · Hazırlayan: Claude Code oturumu

---

## 1. Proje Nedir?

`ubterzioglu/corteqsmvp` (React + Vite + TypeScript + Supabase web uygulaması) için **Flutter mobil istemci**.
Backend **yeniden yazılmadı**; mevcut Supabase sözleşmesi korunarak yeni istemci inşa ediliyor.

- **Flutter repo (bu proje):** https://github.com/ubterzioglu/corteqsapp  (branch: `main`)
- **Kaynak web repo (sözleşme referansı):** https://github.com/ubterzioglu/corteqsmvp
- **Mimari:** Riverpod + go_router + supabase_flutter + feature-first modüler yapı
- **Strateji belgesi:** `app.md` (repoda değil, kök çalışma dizininde — gitignore'lı)
- **Plan dosyası:** `C:\Users\<user>\.claude\plans\app-md-oku-ayr-nt-l-plan-foamy-nova.md`

---

## 2. Önkoşullar (Yeni Bilgisayarda Sıfırdan)

### 2.1 Git
- Git kurulu olmalı. Kontrol: `git --version`
- GitHub SSH erişimi: `ubterzioglu` hesabının SSH anahtarı yeni makineye taşınmalı
  (veya yeni anahtar üretip GitHub'a eklenmeli). Test: `ssh -T git@github.com`
  → "Hi ubterzioglu!" görmelisin.

### 2.2 Flutter SDK (3.44.2 stable ile doğrulandı)
Windows için (bu projede kullanılan yöntem — git clone):
```powershell
# 1) SDK'yı klonla (kısa yol, boşluksuz dizin önemli)
New-Item -ItemType Directory -Force C:\src
git clone --depth 1 -b stable https://github.com/flutter/flutter.git C:\src\flutter

# 2) PATH'e ekle (kalıcı, kullanıcı düzeyi)
$p = [Environment]::GetEnvironmentVariable("Path","User")
[Environment]::SetEnvironmentVariable("Path", "$p;C:\src\flutter\bin", "User")
# Mevcut terminal için: $env:Path = "$env:Path;C:\src\flutter\bin"

# 3) İlk çalıştırma (Dart SDK'yı indirir, birkaç dk)
flutter --version    # → Flutter 3.44.x • Dart 3.12.x

# 4) Ortam sağlığı
flutter doctor
```

> macOS/Linux: `git clone -b stable ... ~/flutter`, `export PATH="$PATH:$HOME/flutter/bin"` (`.zshrc`/`.bashrc`).

### 2.3 Android (APK/emülatör için)
- Android Studio veya Android SDK komut satırı araçları kurulu olmalı.
- Lisanslar: `flutter doctor --android-licenses` → tümünü kabul et.
- `flutter doctor` çıktısında `[√] Android toolchain` ve `[√] Connected device` görünmeli.
- **Not:** Visual Studio (Windows masaüstü) GEREKMEZ — hedef android/ios.

### 2.4 iOS (yalnız macOS)
- Xcode + CocoaPods. `ios/Runner/Info.plist`'e OAuth URL scheme eklenmesi gerekecek
  (`com.corteqs.corteqs_app` — Android'de yapıldı, iOS henüz yapılmadı; bkz. §7 Kalan İşler).

---

## 3. Repoyu Klonla ve Çalıştır

```powershell
# Çalışma dizinine git (örn. C:\projeler)
git clone git@github.com:ubterzioglu/corteqsapp.git
cd corteqsapp

# Bağımlılıklar
flutter pub get

# Kod üretimi (freezed / json_serializable / riverpod_generator)
dart run build_runner build
#  (gerekirse çakışmaları silerek: dart run build_runner build --delete-conflicting-outputs)

# Statik analiz + testler (her şey yeşil olmalı)
flutter analyze          # → No issues found!
flutter test             # → All tests passed! (26 test)
```

### 3.1 Env / Supabase credential'ları (ZORUNLU — repoda yok)
`env/dev.json` dosyası `.gitignore`'da olduğu için klonda **gelmez**. Elle oluştur:

`env/dev.json`:
```json
{
  "APP_ENV": "dev",
  "SUPABASE_URL": "https://injprdrsklkxgnaiixzh.supabase.co",
  "SUPABASE_ANON_KEY": "<ANON_KEY_BURAYA>"
}
```
> **Anon key bu repoda yok** — güvenli kanaldan (parola yöneticisi / şifreli not) alıp yapıştır.
> Kaynağı: web projesinin `.env.local` → `NEXT_PUBLIC_SUPABASE_ANON_KEY` (veya `VITE_SUPABASE_PUBLISHABLE_KEY`).
> Sadece **anon key** kullanılır (RLS arkasında güvenli). Service-role key / DB şifresi mobil istemciye ASLA konmaz.
> Supabase projesi: `injprdrsklkxgnaiixzh`. Google OAuth + email/şifre açık.

### 3.2 Çalıştırma
```powershell
# Cihaz/emülatör listele
flutter devices

# Dev flavor + env dosyasıyla çalıştır
flutter run -t lib/main_dev.dart --dart-define-from-file=env/dev.json

# Argümansız da çalışır (main.dart bootstrap'a yönlendirir) ama env vermezsen
# Supabase init atlanır (UI açılır, sadece backend çağrıları çalışmaz).
```

---

## 4. Proje Yapısı (feature-first)

```
lib/
  app/            app.dart, bootstrap.dart, router/{app_router, app_shell, route_paths}
  core/           config/env, network/supabase_provider, storage/local_store,
                  ui/{design_tokens, app_theme}, utils/result
  features/
    auth/         data/auth_repository · domain/{auth_profile, auth_redirect}
                  presentation/{login_page, login_controller}
    home/         presentation/{home_page, widgets/*}
    directory/    data/directory_repository · domain/{directory_models, directory_filters}
                  presentation/{directory_page, public_profile_page, directory_providers, widgets/*}
    profile/      data/profile_repository · domain/{profile_models, profile_view_model}
                  presentation/{self_profile_page, widgets/profile_summary_header}
    cadde/        data/cadde_repository · domain/{cadde_models, cadde_feed_mapper}
                  presentation/{cadde_feed_page, cadde_providers, cafe_detail_page, carsi_page, widgets/*}
    lansman/      data/survey_repository · domain/survey_models
                  presentation/{survey_page, survey_controller}
    admin_lite/   data/admin_repository · domain/admin_approval · presentation/admin_lite_shell
  shared/         providers/{auth_providers, feature_keys} · widgets/{feature_gate, role_gate, async_value_view}
  main.dart, main_dev.dart, main_staging.dart, main_prod.dart
docs/contract/    SCHEMA PACK — backend sözleşme referansı (9 dosya, §6)
test/             unit/* (redirect, filter serializer, profile vm, cadde feed mapper) + widget_test
.github/workflows/flutter_ci.yml   GitHub Actions CI (analyze + test)
```

---

## 5. Tamamlanan Fazlar (commit'lerle)

| Faz | İçerik | Commit |
|-----|--------|--------|
| 0 | Schema Pack (`docs/contract/`, 9 dosya — canlı repodan doğrulandı) | `42e6441` |
| 1 | Foundation: env/flavor, M3 tema, supabase provider, guard'lı go_router + StatefulShell bottom nav, FeatureGate/RoleGate, bootstrap, 3 flavor entrypoint | `42e6441` |
| 2 | Auth + Home: login/signup (Google OAuth + email/şifre), redirect resolver, HomePage; Android OAuth deep-link | `caa6a31` |
| 3 | Directory + Public Profile: arama/filtre, `search_directory_catalog`, kanonik `/directory/catalog/:slug` | `cb20abb` |
| 4 | Self Profile (member hub): summary header + sekmeler, `get_current_user_profile`/`dashboard` | `2daf8fa` |
| 5 | Cadde (anchor): feed (`list_cadde_feed_v1`), post oluştur, reaksiyon (like/support/idea), yorum | `70ac1ce` |
| 6a | Anket akışı (`/anket/:slug`, public edge fn `submit-survey-response` + honeypot) + **GitHub Actions CI** | `4860fb3` |
| 6b | Admin-lite: `is_admin` gate'li shell + onay kuyruğu (`admin_review_approval_request`) | `5168e1d` |

**Durum:** `flutter analyze` temiz · **26 test geçiyor** · CI yeşil (run doğrulandı).
Tüm RPC/tablo/feature-key imzaları canlı `corteqsmvp` reposundan doğrulandı.

---

## 6. Backend Sözleşmesi (Schema Pack — `docs/contract/`)

Flutter istemcisinin karşı kodladığı tek doğru kaynak. Backend değişince güncellenmeli.
- `feature_keys.md` — 20 generic + 11 individual feature key (web `src/lib/features.ts`)
- `routes.md` — tüm web rotaları + kanonik kurallar
- `query_keys.md` — `caddeQueryKeys` → Riverpod provider eşlemesi
- `functions.md` — 5 edge function + `verify_jwt` (submit-survey-response public!)
- `rpcs.md` — 73 RPC (kritik olanlar ⭐)
- `tables.md` — ~120 tablo envanteri
- `buckets.md` — 14 storage bucket
- `geo.md` — PostgREST 1000-satır paging kuralı
- `decisions.md` — açık ürün kararları

---

## 7. Kalan İşler / Sıradaki Adımlar

**Derinleştirme (mevcut fazların tamamı):**
- Cadde: sonsuz scroll (cursor zinciri — repo'da hazır, UI bağlanacak), optimistic rollback,
  cafe detay tam UI (community room), çarşı grid + ilan formu, yorum bottom sheet.
- Profil: alan düzenleme formları + CV/sunum upload (`profile.cv_upload`), Başvurular & Erişimler sekmesi.
- Directory: geo range() picker (şu an ülke/şehir serbest metin).
- Anket: multi-choice soru tipi (şu an single + text).

**Phase 6b kalanı:** admin-lite moderation özeti, dashboard sayaçları, audit log özeti.

**Release (henüz yapılmadı — signing gerekir):**
- iOS: `ios/Runner/Info.plist`'e OAuth URL scheme (`com.corteqs.corteqs_app`).
- CI'a Android AAB + iOS IPA release job'ları (signing secrets: keystore base64, cert/profile).
- Store hesapları, push provider, crash reporting kararları (`docs/contract/decisions.md`).

**Genel sertleştirme:** a11y (Semantics/focus/dynamic-text), perf profiling, gerçek cihazda OAuth deep-link testi.

---

## 8. Sık Komutlar

```powershell
flutter pub get
dart run build_runner build                  # codegen (model değişince)
dart run build_runner watch                  # codegen sürekli izleme
flutter analyze
flutter test
flutter test --coverage
flutter run -t lib/main_dev.dart --dart-define-from-file=env/dev.json
flutter build apk --debug -t lib/main_dev.dart --dart-define-from-file=env/dev.json
```

**Önemli kurallar:**
- Generated dosyalar (`*.freezed.dart`, `*.g.dart`) repoda commit'li — model değişince `build_runner` çalıştır.
- Sırlar (`env/`, `*.env`, `.env.local`, `app.md`, `HANDOVER.md`, `.omc`) `.gitignore`'da — ASLA commit etme.
- Riverpod **3.x** kullanılıyor (`AsyncNotifier`/`Notifier`, `AutoDispose*Notifier` YOK).
- Commit öncesi: `flutter analyze` temiz + `flutter test` geçer olmalı (CI bunu zorlar).
