# Edge Functions

Kaynak: `supabase/functions/` + `supabase/config.toml` (canlı repodan doğrulandı).

| Function | `verify_jwt` | Açıklama | Flutter erişimi |
|---|---|---|---|
| `find-matches` | **true** | Eşleştirme/matching | Auth'lu invoke |
| `lansman-admin` | **true** | Lansman admin işlemleri | Admin auth'lu invoke |
| `send-submission-email` | **true** | Form gönderim e-postası | Auth'lu invoke |
| `submit-survey-response` | **false (PUBLIC)** | Anket yanıtı gönderimi | Anonim invoke — abuse yüzeyi |
| `radar-news-scan` | (config'te blok yok → varsayılan **true**) | Radar haber tarama | Admin/scheduled |

## Güvenlik notu (app.md 429, 768)
`submit-survey-response` **public** (jwt yok). Mobil istemciye taşınınca abuse potansiyeli artar.
Azaltım **backend tarafında**: rate-limit, anti-automation, log izleme. İstemci yalnız **UX validasyonu** yapar — istemcide güvenlik tiyatrosu yapma.

## Flutter çağrı kalıbı
`supabase.functions.invoke('<name>', body: {...})`. JWT'li fonksiyonlar oturum gerektirir; public fonksiyon anon key ile çağrılır.
`lansman/data/` katmanı bu invoke'ları sarmalar (Phase 6a).
