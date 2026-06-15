// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileAttribute {

@JsonKey(name: 'attribute_key') String get attributeKey; String get label; String get visibility;@JsonKey(name: 'value_json') dynamic get valueJson;@JsonKey(name: 'value_text') String? get valueText;
/// Create a copy of ProfileAttribute
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileAttributeCopyWith<ProfileAttribute> get copyWith => _$ProfileAttributeCopyWithImpl<ProfileAttribute>(this as ProfileAttribute, _$identity);

  /// Serializes this ProfileAttribute to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileAttribute&&(identical(other.attributeKey, attributeKey) || other.attributeKey == attributeKey)&&(identical(other.label, label) || other.label == label)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&const DeepCollectionEquality().equals(other.valueJson, valueJson)&&(identical(other.valueText, valueText) || other.valueText == valueText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeKey,label,visibility,const DeepCollectionEquality().hash(valueJson),valueText);

@override
String toString() {
  return 'ProfileAttribute(attributeKey: $attributeKey, label: $label, visibility: $visibility, valueJson: $valueJson, valueText: $valueText)';
}


}

/// @nodoc
abstract mixin class $ProfileAttributeCopyWith<$Res>  {
  factory $ProfileAttributeCopyWith(ProfileAttribute value, $Res Function(ProfileAttribute) _then) = _$ProfileAttributeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'attribute_key') String attributeKey, String label, String visibility,@JsonKey(name: 'value_json') dynamic valueJson,@JsonKey(name: 'value_text') String? valueText
});




}
/// @nodoc
class _$ProfileAttributeCopyWithImpl<$Res>
    implements $ProfileAttributeCopyWith<$Res> {
  _$ProfileAttributeCopyWithImpl(this._self, this._then);

  final ProfileAttribute _self;
  final $Res Function(ProfileAttribute) _then;

/// Create a copy of ProfileAttribute
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? attributeKey = null,Object? label = null,Object? visibility = null,Object? valueJson = freezed,Object? valueText = freezed,}) {
  return _then(_self.copyWith(
attributeKey: null == attributeKey ? _self.attributeKey : attributeKey // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,valueJson: freezed == valueJson ? _self.valueJson : valueJson // ignore: cast_nullable_to_non_nullable
as dynamic,valueText: freezed == valueText ? _self.valueText : valueText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileAttribute].
extension ProfileAttributePatterns on ProfileAttribute {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileAttribute value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileAttribute() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileAttribute value)  $default,){
final _that = this;
switch (_that) {
case _ProfileAttribute():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileAttribute value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileAttribute() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'attribute_key')  String attributeKey,  String label,  String visibility, @JsonKey(name: 'value_json')  dynamic valueJson, @JsonKey(name: 'value_text')  String? valueText)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileAttribute() when $default != null:
return $default(_that.attributeKey,_that.label,_that.visibility,_that.valueJson,_that.valueText);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'attribute_key')  String attributeKey,  String label,  String visibility, @JsonKey(name: 'value_json')  dynamic valueJson, @JsonKey(name: 'value_text')  String? valueText)  $default,) {final _that = this;
switch (_that) {
case _ProfileAttribute():
return $default(_that.attributeKey,_that.label,_that.visibility,_that.valueJson,_that.valueText);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'attribute_key')  String attributeKey,  String label,  String visibility, @JsonKey(name: 'value_json')  dynamic valueJson, @JsonKey(name: 'value_text')  String? valueText)?  $default,) {final _that = this;
switch (_that) {
case _ProfileAttribute() when $default != null:
return $default(_that.attributeKey,_that.label,_that.visibility,_that.valueJson,_that.valueText);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileAttribute implements ProfileAttribute {
  const _ProfileAttribute({@JsonKey(name: 'attribute_key') required this.attributeKey, this.label = '', this.visibility = 'private', @JsonKey(name: 'value_json') this.valueJson, @JsonKey(name: 'value_text') this.valueText});
  factory _ProfileAttribute.fromJson(Map<String, dynamic> json) => _$ProfileAttributeFromJson(json);

@override@JsonKey(name: 'attribute_key') final  String attributeKey;
@override@JsonKey() final  String label;
@override@JsonKey() final  String visibility;
@override@JsonKey(name: 'value_json') final  dynamic valueJson;
@override@JsonKey(name: 'value_text') final  String? valueText;

/// Create a copy of ProfileAttribute
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileAttributeCopyWith<_ProfileAttribute> get copyWith => __$ProfileAttributeCopyWithImpl<_ProfileAttribute>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileAttributeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileAttribute&&(identical(other.attributeKey, attributeKey) || other.attributeKey == attributeKey)&&(identical(other.label, label) || other.label == label)&&(identical(other.visibility, visibility) || other.visibility == visibility)&&const DeepCollectionEquality().equals(other.valueJson, valueJson)&&(identical(other.valueText, valueText) || other.valueText == valueText));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,attributeKey,label,visibility,const DeepCollectionEquality().hash(valueJson),valueText);

@override
String toString() {
  return 'ProfileAttribute(attributeKey: $attributeKey, label: $label, visibility: $visibility, valueJson: $valueJson, valueText: $valueText)';
}


}

/// @nodoc
abstract mixin class _$ProfileAttributeCopyWith<$Res> implements $ProfileAttributeCopyWith<$Res> {
  factory _$ProfileAttributeCopyWith(_ProfileAttribute value, $Res Function(_ProfileAttribute) _then) = __$ProfileAttributeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'attribute_key') String attributeKey, String label, String visibility,@JsonKey(name: 'value_json') dynamic valueJson,@JsonKey(name: 'value_text') String? valueText
});




}
/// @nodoc
class __$ProfileAttributeCopyWithImpl<$Res>
    implements _$ProfileAttributeCopyWith<$Res> {
  __$ProfileAttributeCopyWithImpl(this._self, this._then);

  final _ProfileAttribute _self;
  final $Res Function(_ProfileAttribute) _then;

/// Create a copy of ProfileAttribute
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? attributeKey = null,Object? label = null,Object? visibility = null,Object? valueJson = freezed,Object? valueText = freezed,}) {
  return _then(_ProfileAttribute(
attributeKey: null == attributeKey ? _self.attributeKey : attributeKey // ignore: cast_nullable_to_non_nullable
as String,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,visibility: null == visibility ? _self.visibility : visibility // ignore: cast_nullable_to_non_nullable
as String,valueJson: freezed == valueJson ? _self.valueJson : valueJson // ignore: cast_nullable_to_non_nullable
as dynamic,valueText: freezed == valueText ? _self.valueText : valueText // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PendingRequest {

 String? get id;@JsonKey(name: 'request_type') String? get requestType; String? get status; String? get label;
/// Create a copy of PendingRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PendingRequestCopyWith<PendingRequest> get copyWith => _$PendingRequestCopyWithImpl<PendingRequest>(this as PendingRequest, _$identity);

  /// Serializes this PendingRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PendingRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestType,status,label);

@override
String toString() {
  return 'PendingRequest(id: $id, requestType: $requestType, status: $status, label: $label)';
}


}

/// @nodoc
abstract mixin class $PendingRequestCopyWith<$Res>  {
  factory $PendingRequestCopyWith(PendingRequest value, $Res Function(PendingRequest) _then) = _$PendingRequestCopyWithImpl;
@useResult
$Res call({
 String? id,@JsonKey(name: 'request_type') String? requestType, String? status, String? label
});




}
/// @nodoc
class _$PendingRequestCopyWithImpl<$Res>
    implements $PendingRequestCopyWith<$Res> {
  _$PendingRequestCopyWithImpl(this._self, this._then);

  final PendingRequest _self;
  final $Res Function(PendingRequest) _then;

/// Create a copy of PendingRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? requestType = freezed,Object? status = freezed,Object? label = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PendingRequest].
extension PendingRequestPatterns on PendingRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PendingRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PendingRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PendingRequest value)  $default,){
final _that = this;
switch (_that) {
case _PendingRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PendingRequest value)?  $default,){
final _that = this;
switch (_that) {
case _PendingRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'request_type')  String? requestType,  String? status,  String? label)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PendingRequest() when $default != null:
return $default(_that.id,_that.requestType,_that.status,_that.label);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id, @JsonKey(name: 'request_type')  String? requestType,  String? status,  String? label)  $default,) {final _that = this;
switch (_that) {
case _PendingRequest():
return $default(_that.id,_that.requestType,_that.status,_that.label);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id, @JsonKey(name: 'request_type')  String? requestType,  String? status,  String? label)?  $default,) {final _that = this;
switch (_that) {
case _PendingRequest() when $default != null:
return $default(_that.id,_that.requestType,_that.status,_that.label);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PendingRequest implements PendingRequest {
  const _PendingRequest({this.id, @JsonKey(name: 'request_type') this.requestType, this.status, this.label});
  factory _PendingRequest.fromJson(Map<String, dynamic> json) => _$PendingRequestFromJson(json);

@override final  String? id;
@override@JsonKey(name: 'request_type') final  String? requestType;
@override final  String? status;
@override final  String? label;

/// Create a copy of PendingRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PendingRequestCopyWith<_PendingRequest> get copyWith => __$PendingRequestCopyWithImpl<_PendingRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PendingRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PendingRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.status, status) || other.status == status)&&(identical(other.label, label) || other.label == label));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestType,status,label);

@override
String toString() {
  return 'PendingRequest(id: $id, requestType: $requestType, status: $status, label: $label)';
}


}

/// @nodoc
abstract mixin class _$PendingRequestCopyWith<$Res> implements $PendingRequestCopyWith<$Res> {
  factory _$PendingRequestCopyWith(_PendingRequest value, $Res Function(_PendingRequest) _then) = __$PendingRequestCopyWithImpl;
@override @useResult
$Res call({
 String? id,@JsonKey(name: 'request_type') String? requestType, String? status, String? label
});




}
/// @nodoc
class __$PendingRequestCopyWithImpl<$Res>
    implements _$PendingRequestCopyWith<$Res> {
  __$PendingRequestCopyWithImpl(this._self, this._then);

  final _PendingRequest _self;
  final $Res Function(_PendingRequest) _then;

/// Create a copy of PendingRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? requestType = freezed,Object? status = freezed,Object? label = freezed,}) {
  return _then(_PendingRequest(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,requestType: freezed == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String?,status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,label: freezed == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$CurrentUserProfile {

@JsonKey(name: 'user_id') String get userId; String? get email;@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'profile_type') String get profileType;@JsonKey(name: 'role_label') String get roleLabel; List<ProfileAttribute> get attributes;@JsonKey(name: 'pending_requests') List<PendingRequest> get pendingRequests;@JsonKey(name: 'profile_completion') ProfileCompletion? get profileCompletion;
/// Create a copy of CurrentUserProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CurrentUserProfileCopyWith<CurrentUserProfile> get copyWith => _$CurrentUserProfileCopyWithImpl<CurrentUserProfile>(this as CurrentUserProfile, _$identity);

  /// Serializes this CurrentUserProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CurrentUserProfile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.roleLabel, roleLabel) || other.roleLabel == roleLabel)&&const DeepCollectionEquality().equals(other.attributes, attributes)&&const DeepCollectionEquality().equals(other.pendingRequests, pendingRequests)&&(identical(other.profileCompletion, profileCompletion) || other.profileCompletion == profileCompletion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,fullName,profileType,roleLabel,const DeepCollectionEquality().hash(attributes),const DeepCollectionEquality().hash(pendingRequests),profileCompletion);

@override
String toString() {
  return 'CurrentUserProfile(userId: $userId, email: $email, fullName: $fullName, profileType: $profileType, roleLabel: $roleLabel, attributes: $attributes, pendingRequests: $pendingRequests, profileCompletion: $profileCompletion)';
}


}

/// @nodoc
abstract mixin class $CurrentUserProfileCopyWith<$Res>  {
  factory $CurrentUserProfileCopyWith(CurrentUserProfile value, $Res Function(CurrentUserProfile) _then) = _$CurrentUserProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String? email,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'profile_type') String profileType,@JsonKey(name: 'role_label') String roleLabel, List<ProfileAttribute> attributes,@JsonKey(name: 'pending_requests') List<PendingRequest> pendingRequests,@JsonKey(name: 'profile_completion') ProfileCompletion? profileCompletion
});


$ProfileCompletionCopyWith<$Res>? get profileCompletion;

}
/// @nodoc
class _$CurrentUserProfileCopyWithImpl<$Res>
    implements $CurrentUserProfileCopyWith<$Res> {
  _$CurrentUserProfileCopyWithImpl(this._self, this._then);

  final CurrentUserProfile _self;
  final $Res Function(CurrentUserProfile) _then;

/// Create a copy of CurrentUserProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? userId = null,Object? email = freezed,Object? fullName = freezed,Object? profileType = null,Object? roleLabel = null,Object? attributes = null,Object? pendingRequests = null,Object? profileCompletion = freezed,}) {
  return _then(_self.copyWith(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,profileType: null == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String,roleLabel: null == roleLabel ? _self.roleLabel : roleLabel // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self.attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<ProfileAttribute>,pendingRequests: null == pendingRequests ? _self.pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequest>,profileCompletion: freezed == profileCompletion ? _self.profileCompletion : profileCompletion // ignore: cast_nullable_to_non_nullable
as ProfileCompletion?,
  ));
}
/// Create a copy of CurrentUserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCompletionCopyWith<$Res>? get profileCompletion {
    if (_self.profileCompletion == null) {
    return null;
  }

  return $ProfileCompletionCopyWith<$Res>(_self.profileCompletion!, (value) {
    return _then(_self.copyWith(profileCompletion: value));
  });
}
}


/// Adds pattern-matching-related methods to [CurrentUserProfile].
extension CurrentUserProfilePatterns on CurrentUserProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CurrentUserProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CurrentUserProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CurrentUserProfile value)  $default,){
final _that = this;
switch (_that) {
case _CurrentUserProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CurrentUserProfile value)?  $default,){
final _that = this;
switch (_that) {
case _CurrentUserProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String? email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'profile_type')  String profileType, @JsonKey(name: 'role_label')  String roleLabel,  List<ProfileAttribute> attributes, @JsonKey(name: 'pending_requests')  List<PendingRequest> pendingRequests, @JsonKey(name: 'profile_completion')  ProfileCompletion? profileCompletion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CurrentUserProfile() when $default != null:
return $default(_that.userId,_that.email,_that.fullName,_that.profileType,_that.roleLabel,_that.attributes,_that.pendingRequests,_that.profileCompletion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String userId,  String? email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'profile_type')  String profileType, @JsonKey(name: 'role_label')  String roleLabel,  List<ProfileAttribute> attributes, @JsonKey(name: 'pending_requests')  List<PendingRequest> pendingRequests, @JsonKey(name: 'profile_completion')  ProfileCompletion? profileCompletion)  $default,) {final _that = this;
switch (_that) {
case _CurrentUserProfile():
return $default(_that.userId,_that.email,_that.fullName,_that.profileType,_that.roleLabel,_that.attributes,_that.pendingRequests,_that.profileCompletion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String userId,  String? email, @JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'profile_type')  String profileType, @JsonKey(name: 'role_label')  String roleLabel,  List<ProfileAttribute> attributes, @JsonKey(name: 'pending_requests')  List<PendingRequest> pendingRequests, @JsonKey(name: 'profile_completion')  ProfileCompletion? profileCompletion)?  $default,) {final _that = this;
switch (_that) {
case _CurrentUserProfile() when $default != null:
return $default(_that.userId,_that.email,_that.fullName,_that.profileType,_that.roleLabel,_that.attributes,_that.pendingRequests,_that.profileCompletion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CurrentUserProfile extends CurrentUserProfile {
  const _CurrentUserProfile({@JsonKey(name: 'user_id') this.userId = '', this.email, @JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'profile_type') this.profileType = '', @JsonKey(name: 'role_label') this.roleLabel = '', final  List<ProfileAttribute> attributes = const <ProfileAttribute>[], @JsonKey(name: 'pending_requests') final  List<PendingRequest> pendingRequests = const <PendingRequest>[], @JsonKey(name: 'profile_completion') this.profileCompletion}): _attributes = attributes,_pendingRequests = pendingRequests,super._();
  factory _CurrentUserProfile.fromJson(Map<String, dynamic> json) => _$CurrentUserProfileFromJson(json);

@override@JsonKey(name: 'user_id') final  String userId;
@override final  String? email;
@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'profile_type') final  String profileType;
@override@JsonKey(name: 'role_label') final  String roleLabel;
 final  List<ProfileAttribute> _attributes;
@override@JsonKey() List<ProfileAttribute> get attributes {
  if (_attributes is EqualUnmodifiableListView) return _attributes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attributes);
}

 final  List<PendingRequest> _pendingRequests;
@override@JsonKey(name: 'pending_requests') List<PendingRequest> get pendingRequests {
  if (_pendingRequests is EqualUnmodifiableListView) return _pendingRequests;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_pendingRequests);
}

@override@JsonKey(name: 'profile_completion') final  ProfileCompletion? profileCompletion;

/// Create a copy of CurrentUserProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CurrentUserProfileCopyWith<_CurrentUserProfile> get copyWith => __$CurrentUserProfileCopyWithImpl<_CurrentUserProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CurrentUserProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CurrentUserProfile&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.email, email) || other.email == email)&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.profileType, profileType) || other.profileType == profileType)&&(identical(other.roleLabel, roleLabel) || other.roleLabel == roleLabel)&&const DeepCollectionEquality().equals(other._attributes, _attributes)&&const DeepCollectionEquality().equals(other._pendingRequests, _pendingRequests)&&(identical(other.profileCompletion, profileCompletion) || other.profileCompletion == profileCompletion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,userId,email,fullName,profileType,roleLabel,const DeepCollectionEquality().hash(_attributes),const DeepCollectionEquality().hash(_pendingRequests),profileCompletion);

@override
String toString() {
  return 'CurrentUserProfile(userId: $userId, email: $email, fullName: $fullName, profileType: $profileType, roleLabel: $roleLabel, attributes: $attributes, pendingRequests: $pendingRequests, profileCompletion: $profileCompletion)';
}


}

/// @nodoc
abstract mixin class _$CurrentUserProfileCopyWith<$Res> implements $CurrentUserProfileCopyWith<$Res> {
  factory _$CurrentUserProfileCopyWith(_CurrentUserProfile value, $Res Function(_CurrentUserProfile) _then) = __$CurrentUserProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String userId, String? email,@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'profile_type') String profileType,@JsonKey(name: 'role_label') String roleLabel, List<ProfileAttribute> attributes,@JsonKey(name: 'pending_requests') List<PendingRequest> pendingRequests,@JsonKey(name: 'profile_completion') ProfileCompletion? profileCompletion
});


@override $ProfileCompletionCopyWith<$Res>? get profileCompletion;

}
/// @nodoc
class __$CurrentUserProfileCopyWithImpl<$Res>
    implements _$CurrentUserProfileCopyWith<$Res> {
  __$CurrentUserProfileCopyWithImpl(this._self, this._then);

  final _CurrentUserProfile _self;
  final $Res Function(_CurrentUserProfile) _then;

/// Create a copy of CurrentUserProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? userId = null,Object? email = freezed,Object? fullName = freezed,Object? profileType = null,Object? roleLabel = null,Object? attributes = null,Object? pendingRequests = null,Object? profileCompletion = freezed,}) {
  return _then(_CurrentUserProfile(
userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,profileType: null == profileType ? _self.profileType : profileType // ignore: cast_nullable_to_non_nullable
as String,roleLabel: null == roleLabel ? _self.roleLabel : roleLabel // ignore: cast_nullable_to_non_nullable
as String,attributes: null == attributes ? _self._attributes : attributes // ignore: cast_nullable_to_non_nullable
as List<ProfileAttribute>,pendingRequests: null == pendingRequests ? _self._pendingRequests : pendingRequests // ignore: cast_nullable_to_non_nullable
as List<PendingRequest>,profileCompletion: freezed == profileCompletion ? _self.profileCompletion : profileCompletion // ignore: cast_nullable_to_non_nullable
as ProfileCompletion?,
  ));
}

/// Create a copy of CurrentUserProfile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ProfileCompletionCopyWith<$Res>? get profileCompletion {
    if (_self.profileCompletion == null) {
    return null;
  }

  return $ProfileCompletionCopyWith<$Res>(_self.profileCompletion!, (value) {
    return _then(_self.copyWith(profileCompletion: value));
  });
}
}


/// @nodoc
mixin _$ProfileCompletion {

 int get percentage;
/// Create a copy of ProfileCompletion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ProfileCompletionCopyWith<ProfileCompletion> get copyWith => _$ProfileCompletionCopyWithImpl<ProfileCompletion>(this as ProfileCompletion, _$identity);

  /// Serializes this ProfileCompletion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ProfileCompletion&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,percentage);

@override
String toString() {
  return 'ProfileCompletion(percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class $ProfileCompletionCopyWith<$Res>  {
  factory $ProfileCompletionCopyWith(ProfileCompletion value, $Res Function(ProfileCompletion) _then) = _$ProfileCompletionCopyWithImpl;
@useResult
$Res call({
 int percentage
});




}
/// @nodoc
class _$ProfileCompletionCopyWithImpl<$Res>
    implements $ProfileCompletionCopyWith<$Res> {
  _$ProfileCompletionCopyWithImpl(this._self, this._then);

  final ProfileCompletion _self;
  final $Res Function(ProfileCompletion) _then;

/// Create a copy of ProfileCompletion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? percentage = null,}) {
  return _then(_self.copyWith(
percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ProfileCompletion].
extension ProfileCompletionPatterns on ProfileCompletion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ProfileCompletion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ProfileCompletion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ProfileCompletion value)  $default,){
final _that = this;
switch (_that) {
case _ProfileCompletion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ProfileCompletion value)?  $default,){
final _that = this;
switch (_that) {
case _ProfileCompletion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int percentage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ProfileCompletion() when $default != null:
return $default(_that.percentage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int percentage)  $default,) {final _that = this;
switch (_that) {
case _ProfileCompletion():
return $default(_that.percentage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int percentage)?  $default,) {final _that = this;
switch (_that) {
case _ProfileCompletion() when $default != null:
return $default(_that.percentage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ProfileCompletion implements ProfileCompletion {
  const _ProfileCompletion({this.percentage = 0});
  factory _ProfileCompletion.fromJson(Map<String, dynamic> json) => _$ProfileCompletionFromJson(json);

@override@JsonKey() final  int percentage;

/// Create a copy of ProfileCompletion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ProfileCompletionCopyWith<_ProfileCompletion> get copyWith => __$ProfileCompletionCopyWithImpl<_ProfileCompletion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ProfileCompletionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ProfileCompletion&&(identical(other.percentage, percentage) || other.percentage == percentage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,percentage);

@override
String toString() {
  return 'ProfileCompletion(percentage: $percentage)';
}


}

/// @nodoc
abstract mixin class _$ProfileCompletionCopyWith<$Res> implements $ProfileCompletionCopyWith<$Res> {
  factory _$ProfileCompletionCopyWith(_ProfileCompletion value, $Res Function(_ProfileCompletion) _then) = __$ProfileCompletionCopyWithImpl;
@override @useResult
$Res call({
 int percentage
});




}
/// @nodoc
class __$ProfileCompletionCopyWithImpl<$Res>
    implements _$ProfileCompletionCopyWith<$Res> {
  __$ProfileCompletionCopyWithImpl(this._self, this._then);

  final _ProfileCompletion _self;
  final $Res Function(_ProfileCompletion) _then;

/// Create a copy of ProfileCompletion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? percentage = null,}) {
  return _then(_ProfileCompletion(
percentage: null == percentage ? _self.percentage : percentage // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
