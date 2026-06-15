// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'directory_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DirectoryRow {

@JsonKey(name: 'item_id') String get itemId;@JsonKey(name: 'item_type') String get itemType; String get slug; String get title;@JsonKey(name: 'role_key') String get roleKey;@JsonKey(name: 'role_label') String get roleLabel; String? get description; String? get city; String? get country;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'special_label') String? get specialLabel;@JsonKey(name: 'special_value') String? get specialValue;@JsonKey(name: 'is_featured') bool get isFeatured;@JsonKey(name: 'is_verified') bool get isVerified;@JsonKey(name: 'is_claimable') bool get isClaimable;
/// Create a copy of DirectoryRow
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DirectoryRowCopyWith<DirectoryRow> get copyWith => _$DirectoryRowCopyWithImpl<DirectoryRow>(this as DirectoryRow, _$identity);

  /// Serializes this DirectoryRow to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectoryRow&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemType, itemType) || other.itemType == itemType)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.roleKey, roleKey) || other.roleKey == roleKey)&&(identical(other.roleLabel, roleLabel) || other.roleLabel == roleLabel)&&(identical(other.description, description) || other.description == description)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.specialLabel, specialLabel) || other.specialLabel == specialLabel)&&(identical(other.specialValue, specialValue) || other.specialValue == specialValue)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isClaimable, isClaimable) || other.isClaimable == isClaimable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemType,slug,title,roleKey,roleLabel,description,city,country,imageUrl,specialLabel,specialValue,isFeatured,isVerified,isClaimable);

@override
String toString() {
  return 'DirectoryRow(itemId: $itemId, itemType: $itemType, slug: $slug, title: $title, roleKey: $roleKey, roleLabel: $roleLabel, description: $description, city: $city, country: $country, imageUrl: $imageUrl, specialLabel: $specialLabel, specialValue: $specialValue, isFeatured: $isFeatured, isVerified: $isVerified, isClaimable: $isClaimable)';
}


}

/// @nodoc
abstract mixin class $DirectoryRowCopyWith<$Res>  {
  factory $DirectoryRowCopyWith(DirectoryRow value, $Res Function(DirectoryRow) _then) = _$DirectoryRowCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'item_type') String itemType, String slug, String title,@JsonKey(name: 'role_key') String roleKey,@JsonKey(name: 'role_label') String roleLabel, String? description, String? city, String? country,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'special_label') String? specialLabel,@JsonKey(name: 'special_value') String? specialValue,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'is_claimable') bool isClaimable
});




}
/// @nodoc
class _$DirectoryRowCopyWithImpl<$Res>
    implements $DirectoryRowCopyWith<$Res> {
  _$DirectoryRowCopyWithImpl(this._self, this._then);

  final DirectoryRow _self;
  final $Res Function(DirectoryRow) _then;

/// Create a copy of DirectoryRow
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? itemType = null,Object? slug = null,Object? title = null,Object? roleKey = null,Object? roleLabel = null,Object? description = freezed,Object? city = freezed,Object? country = freezed,Object? imageUrl = freezed,Object? specialLabel = freezed,Object? specialValue = freezed,Object? isFeatured = null,Object? isVerified = null,Object? isClaimable = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,roleKey: null == roleKey ? _self.roleKey : roleKey // ignore: cast_nullable_to_non_nullable
as String,roleLabel: null == roleLabel ? _self.roleLabel : roleLabel // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,specialLabel: freezed == specialLabel ? _self.specialLabel : specialLabel // ignore: cast_nullable_to_non_nullable
as String?,specialValue: freezed == specialValue ? _self.specialValue : specialValue // ignore: cast_nullable_to_non_nullable
as String?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isClaimable: null == isClaimable ? _self.isClaimable : isClaimable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [DirectoryRow].
extension DirectoryRowPatterns on DirectoryRow {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DirectoryRow value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DirectoryRow() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DirectoryRow value)  $default,){
final _that = this;
switch (_that) {
case _DirectoryRow():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DirectoryRow value)?  $default,){
final _that = this;
switch (_that) {
case _DirectoryRow() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_type')  String itemType,  String slug,  String title, @JsonKey(name: 'role_key')  String roleKey, @JsonKey(name: 'role_label')  String roleLabel,  String? description,  String? city,  String? country, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'special_label')  String? specialLabel, @JsonKey(name: 'special_value')  String? specialValue, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_claimable')  bool isClaimable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DirectoryRow() when $default != null:
return $default(_that.itemId,_that.itemType,_that.slug,_that.title,_that.roleKey,_that.roleLabel,_that.description,_that.city,_that.country,_that.imageUrl,_that.specialLabel,_that.specialValue,_that.isFeatured,_that.isVerified,_that.isClaimable);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_type')  String itemType,  String slug,  String title, @JsonKey(name: 'role_key')  String roleKey, @JsonKey(name: 'role_label')  String roleLabel,  String? description,  String? city,  String? country, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'special_label')  String? specialLabel, @JsonKey(name: 'special_value')  String? specialValue, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_claimable')  bool isClaimable)  $default,) {final _that = this;
switch (_that) {
case _DirectoryRow():
return $default(_that.itemId,_that.itemType,_that.slug,_that.title,_that.roleKey,_that.roleLabel,_that.description,_that.city,_that.country,_that.imageUrl,_that.specialLabel,_that.specialValue,_that.isFeatured,_that.isVerified,_that.isClaimable);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'item_id')  String itemId, @JsonKey(name: 'item_type')  String itemType,  String slug,  String title, @JsonKey(name: 'role_key')  String roleKey, @JsonKey(name: 'role_label')  String roleLabel,  String? description,  String? city,  String? country, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'special_label')  String? specialLabel, @JsonKey(name: 'special_value')  String? specialValue, @JsonKey(name: 'is_featured')  bool isFeatured, @JsonKey(name: 'is_verified')  bool isVerified, @JsonKey(name: 'is_claimable')  bool isClaimable)?  $default,) {final _that = this;
switch (_that) {
case _DirectoryRow() when $default != null:
return $default(_that.itemId,_that.itemType,_that.slug,_that.title,_that.roleKey,_that.roleLabel,_that.description,_that.city,_that.country,_that.imageUrl,_that.specialLabel,_that.specialValue,_that.isFeatured,_that.isVerified,_that.isClaimable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DirectoryRow implements DirectoryRow {
  const _DirectoryRow({@JsonKey(name: 'item_id') required this.itemId, @JsonKey(name: 'item_type') required this.itemType, required this.slug, required this.title, @JsonKey(name: 'role_key') required this.roleKey, @JsonKey(name: 'role_label') required this.roleLabel, this.description, this.city, this.country, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'special_label') this.specialLabel, @JsonKey(name: 'special_value') this.specialValue, @JsonKey(name: 'is_featured') this.isFeatured = false, @JsonKey(name: 'is_verified') this.isVerified = false, @JsonKey(name: 'is_claimable') this.isClaimable = false});
  factory _DirectoryRow.fromJson(Map<String, dynamic> json) => _$DirectoryRowFromJson(json);

@override@JsonKey(name: 'item_id') final  String itemId;
@override@JsonKey(name: 'item_type') final  String itemType;
@override final  String slug;
@override final  String title;
@override@JsonKey(name: 'role_key') final  String roleKey;
@override@JsonKey(name: 'role_label') final  String roleLabel;
@override final  String? description;
@override final  String? city;
@override final  String? country;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'special_label') final  String? specialLabel;
@override@JsonKey(name: 'special_value') final  String? specialValue;
@override@JsonKey(name: 'is_featured') final  bool isFeatured;
@override@JsonKey(name: 'is_verified') final  bool isVerified;
@override@JsonKey(name: 'is_claimable') final  bool isClaimable;

/// Create a copy of DirectoryRow
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DirectoryRowCopyWith<_DirectoryRow> get copyWith => __$DirectoryRowCopyWithImpl<_DirectoryRow>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DirectoryRowToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DirectoryRow&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.itemType, itemType) || other.itemType == itemType)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.roleKey, roleKey) || other.roleKey == roleKey)&&(identical(other.roleLabel, roleLabel) || other.roleLabel == roleLabel)&&(identical(other.description, description) || other.description == description)&&(identical(other.city, city) || other.city == city)&&(identical(other.country, country) || other.country == country)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.specialLabel, specialLabel) || other.specialLabel == specialLabel)&&(identical(other.specialValue, specialValue) || other.specialValue == specialValue)&&(identical(other.isFeatured, isFeatured) || other.isFeatured == isFeatured)&&(identical(other.isVerified, isVerified) || other.isVerified == isVerified)&&(identical(other.isClaimable, isClaimable) || other.isClaimable == isClaimable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,itemType,slug,title,roleKey,roleLabel,description,city,country,imageUrl,specialLabel,specialValue,isFeatured,isVerified,isClaimable);

@override
String toString() {
  return 'DirectoryRow(itemId: $itemId, itemType: $itemType, slug: $slug, title: $title, roleKey: $roleKey, roleLabel: $roleLabel, description: $description, city: $city, country: $country, imageUrl: $imageUrl, specialLabel: $specialLabel, specialValue: $specialValue, isFeatured: $isFeatured, isVerified: $isVerified, isClaimable: $isClaimable)';
}


}

/// @nodoc
abstract mixin class _$DirectoryRowCopyWith<$Res> implements $DirectoryRowCopyWith<$Res> {
  factory _$DirectoryRowCopyWith(_DirectoryRow value, $Res Function(_DirectoryRow) _then) = __$DirectoryRowCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'item_id') String itemId,@JsonKey(name: 'item_type') String itemType, String slug, String title,@JsonKey(name: 'role_key') String roleKey,@JsonKey(name: 'role_label') String roleLabel, String? description, String? city, String? country,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'special_label') String? specialLabel,@JsonKey(name: 'special_value') String? specialValue,@JsonKey(name: 'is_featured') bool isFeatured,@JsonKey(name: 'is_verified') bool isVerified,@JsonKey(name: 'is_claimable') bool isClaimable
});




}
/// @nodoc
class __$DirectoryRowCopyWithImpl<$Res>
    implements _$DirectoryRowCopyWith<$Res> {
  __$DirectoryRowCopyWithImpl(this._self, this._then);

  final _DirectoryRow _self;
  final $Res Function(_DirectoryRow) _then;

/// Create a copy of DirectoryRow
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? itemType = null,Object? slug = null,Object? title = null,Object? roleKey = null,Object? roleLabel = null,Object? description = freezed,Object? city = freezed,Object? country = freezed,Object? imageUrl = freezed,Object? specialLabel = freezed,Object? specialValue = freezed,Object? isFeatured = null,Object? isVerified = null,Object? isClaimable = null,}) {
  return _then(_DirectoryRow(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,itemType: null == itemType ? _self.itemType : itemType // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,roleKey: null == roleKey ? _self.roleKey : roleKey // ignore: cast_nullable_to_non_nullable
as String,roleLabel: null == roleLabel ? _self.roleLabel : roleLabel // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,specialLabel: freezed == specialLabel ? _self.specialLabel : specialLabel // ignore: cast_nullable_to_non_nullable
as String?,specialValue: freezed == specialValue ? _self.specialValue : specialValue // ignore: cast_nullable_to_non_nullable
as String?,isFeatured: null == isFeatured ? _self.isFeatured : isFeatured // ignore: cast_nullable_to_non_nullable
as bool,isVerified: null == isVerified ? _self.isVerified : isVerified // ignore: cast_nullable_to_non_nullable
as bool,isClaimable: null == isClaimable ? _self.isClaimable : isClaimable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$DirectoryRoleOption {

 String get key; String get label;
/// Create a copy of DirectoryRoleOption
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DirectoryRoleOptionCopyWith<DirectoryRoleOption> get copyWith => _$DirectoryRoleOptionCopyWithImpl<DirectoryRoleOption>(this as DirectoryRoleOption, _$identity);

  /// Serializes this DirectoryRoleOption to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DirectoryRoleOption&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label);

@override
String toString() {
  return 'DirectoryRoleOption(key: $key, label: $label)';
}


}

/// @nodoc
abstract mixin class $DirectoryRoleOptionCopyWith<$Res>  {
  factory $DirectoryRoleOptionCopyWith(DirectoryRoleOption value, $Res Function(DirectoryRoleOption) _then) = _$DirectoryRoleOptionCopyWithImpl;
@useResult
$Res call({
 String key, String label
});




}
/// @nodoc
class _$DirectoryRoleOptionCopyWithImpl<$Res>
    implements $DirectoryRoleOptionCopyWith<$Res> {
  _$DirectoryRoleOptionCopyWithImpl(this._self, this._then);

  final DirectoryRoleOption _self;
  final $Res Function(DirectoryRoleOption) _then;

/// Create a copy of DirectoryRoleOption
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? label = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DirectoryRoleOption].
extension DirectoryRoleOptionPatterns on DirectoryRoleOption {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DirectoryRoleOption value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DirectoryRoleOption() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DirectoryRoleOption value)  $default,){
final _that = this;
switch (_that) {
case _DirectoryRoleOption():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DirectoryRoleOption value)?  $default,){
final _that = this;
switch (_that) {
case _DirectoryRoleOption() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  String label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DirectoryRoleOption() when $default != null:
return $default(_that.key,_that.label);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  String label)  $default,) {final _that = this;
switch (_that) {
case _DirectoryRoleOption():
return $default(_that.key,_that.label);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  String label)?  $default,) {final _that = this;
switch (_that) {
case _DirectoryRoleOption() when $default != null:
return $default(_that.key,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DirectoryRoleOption implements DirectoryRoleOption {
  const _DirectoryRoleOption({required this.key, required this.label});
  factory _DirectoryRoleOption.fromJson(Map<String, dynamic> json) => _$DirectoryRoleOptionFromJson(json);

@override final  String key;
@override final  String label;

/// Create a copy of DirectoryRoleOption
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DirectoryRoleOptionCopyWith<_DirectoryRoleOption> get copyWith => __$DirectoryRoleOptionCopyWithImpl<_DirectoryRoleOption>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DirectoryRoleOptionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DirectoryRoleOption&&(identical(other.key, key) || other.key == key)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,label);

@override
String toString() {
  return 'DirectoryRoleOption(key: $key, label: $label)';
}


}

/// @nodoc
abstract mixin class _$DirectoryRoleOptionCopyWith<$Res> implements $DirectoryRoleOptionCopyWith<$Res> {
  factory _$DirectoryRoleOptionCopyWith(_DirectoryRoleOption value, $Res Function(_DirectoryRoleOption) _then) = __$DirectoryRoleOptionCopyWithImpl;
@override @useResult
$Res call({
 String key, String label
});




}
/// @nodoc
class __$DirectoryRoleOptionCopyWithImpl<$Res>
    implements _$DirectoryRoleOptionCopyWith<$Res> {
  __$DirectoryRoleOptionCopyWithImpl(this._self, this._then);

  final _DirectoryRoleOption _self;
  final $Res Function(_DirectoryRoleOption) _then;

/// Create a copy of DirectoryRoleOption
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? label = null,}) {
  return _then(_DirectoryRoleOption(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
