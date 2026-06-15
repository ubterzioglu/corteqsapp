# Geo Veri Katmanı

Kaynak: `src/lib/geo.ts`, `src/data/geoCountries.generated.ts`, `src/data/countryCities.ts`.

## Tablolar
- `geo_countries` (`id, code, name, sort_order`)
- `geo_cities` (`name, country_id, sort_order`)
- Ek tohum verisi: `geoCountryNames`, `geoCountrySeeds`, `countryCities` (generated/static).

## KRİTİK: PostgREST 1000-satır kuralı
PostgREST tek istekte **en fazla 1000 satır** döndürür. Büyük ülkeler (DE ~7k, US ~13k şehir) için
**tüm sayfalar `range()` ile dolaşılmalı**. Web kodu `GEO_PAGE_SIZE = 1000` ile offset döngüsü yapıyor:

```ts
for (let offset = 0; ; offset += GEO_PAGE_SIZE) {
  const { data } = await db.from("geo_cities")
    .select("name, country_id, sort_order")
    .range(offset, offset + GEO_PAGE_SIZE - 1) ...
}
```

## Flutter karşılığı
`directory` ve `cadde` repository'lerindeki ülke/şehir picker'ları aynı **range() paging** mantığını uygulamalı.
Tek `select()` ile yetinme — büyük ülkelerde şehirler eksik gelir. Bir `fetchAllCityRows(countryIds)` yardımcı fonksiyonu yaz.
Picker UI: ülke seç → o ülkenin tüm şehirlerini sayfalı çek → yerel filtrele.
