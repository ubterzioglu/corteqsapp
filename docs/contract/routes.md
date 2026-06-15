# Rotalar (Routes)

Kaynak: `src/App.tsx` (üst-düzey) + `src/pages/admin/routes.tsx` (admin alt-ağacı). Canlı repodan çıkarıldı.

## Kanonik kurallar (KRİTİK — Flutter'da korunmalı)

- Eski `/directory/profile/:userId` → kanonik **`/directory/catalog/:slug`** (UUID-vs-slug ayrımı). Resolver: `DirectoryProfilePage.tsx` + `ProfileResolverPage.tsx`.
- `/profile/catalog/:itemId` ayrı bir katalog-item profil görünümü.
- Login sonrası varsayılan `/profile`; `next`/`redirect` query parametreleri onurlandırılır.
- Login iki yol: **`/login`** ve **`/auth`** (her ikisi LoginPage'e gider). `/reset-password` ayrı.

## Public + member rotaları (`src/App.tsx`)

```
/                         Ana sayfa (Index)
/login  /auth             LoginPage (login + signup tab)
/reset-password           Şifre sıfırlama
/profile                  SelfProfilePage
/profile/:type            Tip-bazlı profil
/profile/catalog/:itemId  Katalog-item profil
/directory                DirectoryPage (auth-gated)
/directory/catalog/:slug  Kanonik public profil
/directory/profile/:userId  → /directory/catalog/:slug redirect
/diaspora/:slug           Diaspora detay
/commercial  /commercial/:slug   Ticari dizin + doküman
/kurulus/:slug            Kuruluş profili
/cadde                    CaddePage (feed)  [cadde.access]
/cadde/cafe/:cafeId       CaddeCafePage
/cadde/carsi              CaddeCarsiPage
/cadde/carsi/:itemId      CaddeCarsiItemPage (ilan detay)
/iletisim                 ContactPage
/lansman                  Lansman akışı
/anket  /anket/:slug  /anket/tesekkurler   Survey akışı
/aiform  /form  /addcom  /addcom/edit/:slug  /addwa   Form/kayıt akışları
/blog  /blog/:slug        Blog
/associations  /association/:id   Dernekler
/ambassador  /diaspora vb. rol landing'leri (/contributor, /influencer-partner,
   /strategic-partner, /community-leader)
/dunya-kupasi  /dunya-kupasi/kayit        Dünya Kupası
/190519  /190519idea  /190519memory  /19051919  /19051919/harita   May19 kampanya
/whatsapp-groups  /whatsapp-groups/:id    WhatsApp grupları
/hospital-appointment/:id Randevu
/founders  /founding-1000  Kurucu akışı
/kariyer  /pricing  /hakkimizda           Statik sayfalar
/legal/{terms,privacy,kvkk,cookies}  /privacy-policy   Yasal
/radar                    Radar haber
/welcome/activate         Onboarding aktivasyon
*                         404
```

## Admin alt-ağacı (`/admin/...`, `src/pages/admin/routes.tsx`)

`/admin` + alt rotalar (lazy-loaded). Alt-ağaçlar: `about, advisors, approvals, audit-logs, blog, consulates, data[/:category], dunya-kupasi, guide, marquee, referral[/groups|/sources|/types], roller-taslak, social-media, surveys[/new|/:id/edit|/:id/responses], veritabani-tablolari, whatsapp-landings[/editors|/guide], may19/{ani,kelime}`.

**`new-member/` alt-ağacı:** attributes, durum-raporu, entity-preview, guide, overrides, profile-role-assignment, profile-sections, role-management, role-matrix, roles-features, roles-list, roles-overview, roles-preview, taxonomy, users-roles.

**`workspace/` alt-ağacı:** command-center, docs/:slug, meeting-notes, mvp, resources[/arge|/insankaynaklari], todos.

Ayrıca admin sayfa-dosyaları: muhasebe, radar (queue/runs/sources), service-finder, cadde (moderation/promotions/carsi/guide), dashboard.

## Flutter karşılığı (ilk dalga rota kümesi)

İlk mobil dalga (Phase 2-5): `/`, `/login`(+`/auth`), `/reset-password`, `/profile`, `/directory`, `/directory/catalog/:slug` (+ redirect), `/cadde`, `/cadde/cafe/:cafeId`, `/cadde/carsi`, `/cadde/carsi/:itemId`, `/iletisim`.
Admin: **admin-lite** kapsamı (approvals, audit özet, cadde moderation, workspace, survey özet) — geri kalan web'de.

`app/router/route_paths.dart` her dondurulmuş rota için typed sabit içerir.
Deep link (app_links): `/directory/catalog/:slug`, `/cadde/cafe/:cafeId`, `/cadde/carsi`, `/login?next=...`, `/workspace/docs/:slug`.
