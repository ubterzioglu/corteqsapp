// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'directory_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DirectoryRow _$DirectoryRowFromJson(Map<String, dynamic> json) =>
    _DirectoryRow(
      itemId: json['item_id'] as String,
      itemType: json['item_type'] as String,
      slug: json['slug'] as String,
      title: json['title'] as String,
      roleKey: json['role_key'] as String,
      roleLabel: json['role_label'] as String,
      description: json['description'] as String?,
      city: json['city'] as String?,
      country: json['country'] as String?,
      imageUrl: json['image_url'] as String?,
      specialLabel: json['special_label'] as String?,
      specialValue: json['special_value'] as String?,
      isFeatured: json['is_featured'] as bool? ?? false,
      isVerified: json['is_verified'] as bool? ?? false,
      isClaimable: json['is_claimable'] as bool? ?? false,
    );

Map<String, dynamic> _$DirectoryRowToJson(_DirectoryRow instance) =>
    <String, dynamic>{
      'item_id': instance.itemId,
      'item_type': instance.itemType,
      'slug': instance.slug,
      'title': instance.title,
      'role_key': instance.roleKey,
      'role_label': instance.roleLabel,
      'description': instance.description,
      'city': instance.city,
      'country': instance.country,
      'image_url': instance.imageUrl,
      'special_label': instance.specialLabel,
      'special_value': instance.specialValue,
      'is_featured': instance.isFeatured,
      'is_verified': instance.isVerified,
      'is_claimable': instance.isClaimable,
    };

_DirectoryRoleOption _$DirectoryRoleOptionFromJson(Map<String, dynamic> json) =>
    _DirectoryRoleOption(
      key: json['key'] as String,
      label: json['label'] as String,
    );

Map<String, dynamic> _$DirectoryRoleOptionToJson(
  _DirectoryRoleOption instance,
) => <String, dynamic>{'key': instance.key, 'label': instance.label};
