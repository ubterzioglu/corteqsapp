# Cadde Query Keys → Riverpod Provider Eşlemesi

Kaynak: `src/lib/cadde-query-keys.ts` (canlı repodan birebir). Kök anahtarlar (`*Root`) prefix-invalidation içindir.
Flutter'da her biri bir Riverpod **provider family**'sine, her `*Root` bir **invalidation hedefine** karşılık gelir.

| TanStack key | İmza | Flutter provider | Invalidation kökü |
|---|---|---|---|
| `all` | `["cadde"]` | — | tüm Cadde |
| `actorContext` | `["cadde","actor-context"]` | `caddeActorContextProvider` | — |
| `countries()` | `["cadde","countries"]` | `caddeCountriesProvider` | — |
| `cities(countries)` | `["cadde","cities",countries]` | `caddeCitiesProvider(countries)` | — |
| `feedRoot` | `["cadde","feed"]` | — | **feed invalidation kökü** |
| `feed(filters,userId,diaspora)` | | `caddeFeedProvider(filters,userId,diaspora)` | feedRoot |
| `cafesRoot` | `["cadde","cafes"]` | — | **cafes invalidation kökü** |
| `cafes(filters,userId,diaspora)` | | `caddeCafesProvider(...)` | cafesRoot |
| `cafe(cafeId,userId)` | | `caddeCafeProvider(cafeId,userId)` | cafesRoot |
| `myCafes(userId)` | | `caddeMyCafesProvider(userId)` | cafesRoot |
| `cafeMembers(cafeId)` | | `caddeCafeMembersProvider(cafeId)` | cafesRoot |
| `cafeFeed(cafeId,userId)` | | `caddeCafeFeedProvider(cafeId,userId)` | cafesRoot |
| `billboards(filters)` | | `caddeBillboardsProvider(filters)` | — |
| `sponsor(filters)` | | `caddeSponsorProvider(filters)` | — |
| `interestCatalog` | | `caddeInterestCatalogProvider` | — |
| `myInterests(userId)` | | `caddeMyInterestsProvider(userId)` | — |
| `notificationsRoot` | `["cadde","notifications"]` | — | **notifications kökü** |
| `notifications(userId)` | | `caddeNotificationsProvider(userId)` | notificationsRoot |
| `moderationQueue(status)` | | `caddeModerationQueueProvider(status)` | — |
| `promotionsRoot` | `["cadde","promotions"]` | — | **promotions kökü** |
| `promotions(placementKey,filters)` | | `caddePromotionsProvider(...)` | promotionsRoot |
| `promotionPlacements` | | `caddePromotionPlacementsProvider` | promotionsRoot |
| `myPromotions(userId)` | | `caddeMyPromotionsProvider(userId)` | promotionsRoot |
| `pendingPromotions` | | `caddePendingPromotionsProvider` | promotionsRoot |
| `carsiRoot` | `["cadde","carsi"]` | — | **çarşı kökü** |
| `carsiCategories` | | `carsiCategoriesProvider` | carsiRoot |
| `carsiItems(filters)` | | `carsiItemsProvider(filters)` | carsiRoot |
| `carsiItem(itemId)` | | `carsiItemProvider(itemId)` | carsiRoot |
| `myCarsiItems(userId)` | | `myCarsiItemsProvider(userId)` | carsiRoot |

## Optimistic update kuralı (app.md 766,804-805)
Yalnız güvenli aksiyonlarda: **reaction, yorum gönderimi, çarşı status**. Mutation başarısında ilgili `*Root`'u invalidate et; hatada rollback. Pagination cursor bütünlüğünü koru. Duplicate/ghost UI'dan kaçın.
