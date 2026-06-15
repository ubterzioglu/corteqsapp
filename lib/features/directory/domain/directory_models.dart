import 'package:freezed_annotation/freezed_annotation.dart';

part 'directory_models.freezed.dart';
part 'directory_models.g.dart';

/// Dizin arama sonucu satırı.
/// Kaynak RPC: `search_directory_catalog` → `DirectorySearchRpcRow`
/// (web `src/lib/catalog-directory.ts`). snake_case alanlar JsonKey ile eşlenir.
@freezed
abstract class DirectoryRow with _$DirectoryRow {
  const factory DirectoryRow({
    @JsonKey(name: 'item_id') required String itemId,
    @JsonKey(name: 'item_type') required String itemType,
    required String slug,
    required String title,
    @JsonKey(name: 'role_key') required String roleKey,
    @JsonKey(name: 'role_label') required String roleLabel,
    String? description,
    String? city,
    String? country,
    @JsonKey(name: 'image_url') String? imageUrl,
    @JsonKey(name: 'special_label') String? specialLabel,
    @JsonKey(name: 'special_value') String? specialValue,
    @JsonKey(name: 'is_featured') @Default(false) bool isFeatured,
    @JsonKey(name: 'is_verified') @Default(false) bool isVerified,
    @JsonKey(name: 'is_claimable') @Default(false) bool isClaimable,
  }) = _DirectoryRow;

  factory DirectoryRow.fromJson(Map<String, dynamic> json) =>
      _$DirectoryRowFromJson(json);
}

/// Dizinde görünür rol seçeneği (`roles` tablosu, is_directory_visible).
@freezed
abstract class DirectoryRoleOption with _$DirectoryRoleOption {
  const factory DirectoryRoleOption({
    required String key,
    required String label,
  }) = _DirectoryRoleOption;

  factory DirectoryRoleOption.fromJson(Map<String, dynamic> json) =>
      _$DirectoryRoleOptionFromJson(json);
}
