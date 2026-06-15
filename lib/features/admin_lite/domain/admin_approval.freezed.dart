// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'admin_approval.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AdminApprovalRequest {

 String get id;@JsonKey(name: 'request_type') String get requestType;@JsonKey(name: 'user_id') String get userId;@JsonKey(name: 'target_role_key') String? get targetRoleKey;@JsonKey(name: 'target_feature_key') String? get targetFeatureKey;@JsonKey(name: 'target_entity_type') String? get targetEntityType; String get status;@JsonKey(name: 'admin_note') String? get adminNote;@JsonKey(name: 'created_at') String? get createdAt;
/// Create a copy of AdminApprovalRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdminApprovalRequestCopyWith<AdminApprovalRequest> get copyWith => _$AdminApprovalRequestCopyWithImpl<AdminApprovalRequest>(this as AdminApprovalRequest, _$identity);

  /// Serializes this AdminApprovalRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdminApprovalRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.targetRoleKey, targetRoleKey) || other.targetRoleKey == targetRoleKey)&&(identical(other.targetFeatureKey, targetFeatureKey) || other.targetFeatureKey == targetFeatureKey)&&(identical(other.targetEntityType, targetEntityType) || other.targetEntityType == targetEntityType)&&(identical(other.status, status) || other.status == status)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestType,userId,targetRoleKey,targetFeatureKey,targetEntityType,status,adminNote,createdAt);

@override
String toString() {
  return 'AdminApprovalRequest(id: $id, requestType: $requestType, userId: $userId, targetRoleKey: $targetRoleKey, targetFeatureKey: $targetFeatureKey, targetEntityType: $targetEntityType, status: $status, adminNote: $adminNote, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $AdminApprovalRequestCopyWith<$Res>  {
  factory $AdminApprovalRequestCopyWith(AdminApprovalRequest value, $Res Function(AdminApprovalRequest) _then) = _$AdminApprovalRequestCopyWithImpl;
@useResult
$Res call({
 String id,@JsonKey(name: 'request_type') String requestType,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'target_role_key') String? targetRoleKey,@JsonKey(name: 'target_feature_key') String? targetFeatureKey,@JsonKey(name: 'target_entity_type') String? targetEntityType, String status,@JsonKey(name: 'admin_note') String? adminNote,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class _$AdminApprovalRequestCopyWithImpl<$Res>
    implements $AdminApprovalRequestCopyWith<$Res> {
  _$AdminApprovalRequestCopyWithImpl(this._self, this._then);

  final AdminApprovalRequest _self;
  final $Res Function(AdminApprovalRequest) _then;

/// Create a copy of AdminApprovalRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? requestType = null,Object? userId = null,Object? targetRoleKey = freezed,Object? targetFeatureKey = freezed,Object? targetEntityType = freezed,Object? status = null,Object? adminNote = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestType: null == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,targetRoleKey: freezed == targetRoleKey ? _self.targetRoleKey : targetRoleKey // ignore: cast_nullable_to_non_nullable
as String?,targetFeatureKey: freezed == targetFeatureKey ? _self.targetFeatureKey : targetFeatureKey // ignore: cast_nullable_to_non_nullable
as String?,targetEntityType: freezed == targetEntityType ? _self.targetEntityType : targetEntityType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AdminApprovalRequest].
extension AdminApprovalRequestPatterns on AdminApprovalRequest {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdminApprovalRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdminApprovalRequest() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdminApprovalRequest value)  $default,){
final _that = this;
switch (_that) {
case _AdminApprovalRequest():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdminApprovalRequest value)?  $default,){
final _that = this;
switch (_that) {
case _AdminApprovalRequest() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'request_type')  String requestType, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'target_role_key')  String? targetRoleKey, @JsonKey(name: 'target_feature_key')  String? targetFeatureKey, @JsonKey(name: 'target_entity_type')  String? targetEntityType,  String status, @JsonKey(name: 'admin_note')  String? adminNote, @JsonKey(name: 'created_at')  String? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdminApprovalRequest() when $default != null:
return $default(_that.id,_that.requestType,_that.userId,_that.targetRoleKey,_that.targetFeatureKey,_that.targetEntityType,_that.status,_that.adminNote,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id, @JsonKey(name: 'request_type')  String requestType, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'target_role_key')  String? targetRoleKey, @JsonKey(name: 'target_feature_key')  String? targetFeatureKey, @JsonKey(name: 'target_entity_type')  String? targetEntityType,  String status, @JsonKey(name: 'admin_note')  String? adminNote, @JsonKey(name: 'created_at')  String? createdAt)  $default,) {final _that = this;
switch (_that) {
case _AdminApprovalRequest():
return $default(_that.id,_that.requestType,_that.userId,_that.targetRoleKey,_that.targetFeatureKey,_that.targetEntityType,_that.status,_that.adminNote,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id, @JsonKey(name: 'request_type')  String requestType, @JsonKey(name: 'user_id')  String userId, @JsonKey(name: 'target_role_key')  String? targetRoleKey, @JsonKey(name: 'target_feature_key')  String? targetFeatureKey, @JsonKey(name: 'target_entity_type')  String? targetEntityType,  String status, @JsonKey(name: 'admin_note')  String? adminNote, @JsonKey(name: 'created_at')  String? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _AdminApprovalRequest() when $default != null:
return $default(_that.id,_that.requestType,_that.userId,_that.targetRoleKey,_that.targetFeatureKey,_that.targetEntityType,_that.status,_that.adminNote,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AdminApprovalRequest extends AdminApprovalRequest {
  const _AdminApprovalRequest({required this.id, @JsonKey(name: 'request_type') this.requestType = '', @JsonKey(name: 'user_id') this.userId = '', @JsonKey(name: 'target_role_key') this.targetRoleKey, @JsonKey(name: 'target_feature_key') this.targetFeatureKey, @JsonKey(name: 'target_entity_type') this.targetEntityType, this.status = 'pending', @JsonKey(name: 'admin_note') this.adminNote, @JsonKey(name: 'created_at') this.createdAt}): super._();
  factory _AdminApprovalRequest.fromJson(Map<String, dynamic> json) => _$AdminApprovalRequestFromJson(json);

@override final  String id;
@override@JsonKey(name: 'request_type') final  String requestType;
@override@JsonKey(name: 'user_id') final  String userId;
@override@JsonKey(name: 'target_role_key') final  String? targetRoleKey;
@override@JsonKey(name: 'target_feature_key') final  String? targetFeatureKey;
@override@JsonKey(name: 'target_entity_type') final  String? targetEntityType;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'admin_note') final  String? adminNote;
@override@JsonKey(name: 'created_at') final  String? createdAt;

/// Create a copy of AdminApprovalRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdminApprovalRequestCopyWith<_AdminApprovalRequest> get copyWith => __$AdminApprovalRequestCopyWithImpl<_AdminApprovalRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AdminApprovalRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdminApprovalRequest&&(identical(other.id, id) || other.id == id)&&(identical(other.requestType, requestType) || other.requestType == requestType)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.targetRoleKey, targetRoleKey) || other.targetRoleKey == targetRoleKey)&&(identical(other.targetFeatureKey, targetFeatureKey) || other.targetFeatureKey == targetFeatureKey)&&(identical(other.targetEntityType, targetEntityType) || other.targetEntityType == targetEntityType)&&(identical(other.status, status) || other.status == status)&&(identical(other.adminNote, adminNote) || other.adminNote == adminNote)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,requestType,userId,targetRoleKey,targetFeatureKey,targetEntityType,status,adminNote,createdAt);

@override
String toString() {
  return 'AdminApprovalRequest(id: $id, requestType: $requestType, userId: $userId, targetRoleKey: $targetRoleKey, targetFeatureKey: $targetFeatureKey, targetEntityType: $targetEntityType, status: $status, adminNote: $adminNote, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$AdminApprovalRequestCopyWith<$Res> implements $AdminApprovalRequestCopyWith<$Res> {
  factory _$AdminApprovalRequestCopyWith(_AdminApprovalRequest value, $Res Function(_AdminApprovalRequest) _then) = __$AdminApprovalRequestCopyWithImpl;
@override @useResult
$Res call({
 String id,@JsonKey(name: 'request_type') String requestType,@JsonKey(name: 'user_id') String userId,@JsonKey(name: 'target_role_key') String? targetRoleKey,@JsonKey(name: 'target_feature_key') String? targetFeatureKey,@JsonKey(name: 'target_entity_type') String? targetEntityType, String status,@JsonKey(name: 'admin_note') String? adminNote,@JsonKey(name: 'created_at') String? createdAt
});




}
/// @nodoc
class __$AdminApprovalRequestCopyWithImpl<$Res>
    implements _$AdminApprovalRequestCopyWith<$Res> {
  __$AdminApprovalRequestCopyWithImpl(this._self, this._then);

  final _AdminApprovalRequest _self;
  final $Res Function(_AdminApprovalRequest) _then;

/// Create a copy of AdminApprovalRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? requestType = null,Object? userId = null,Object? targetRoleKey = freezed,Object? targetFeatureKey = freezed,Object? targetEntityType = freezed,Object? status = null,Object? adminNote = freezed,Object? createdAt = freezed,}) {
  return _then(_AdminApprovalRequest(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,requestType: null == requestType ? _self.requestType : requestType // ignore: cast_nullable_to_non_nullable
as String,userId: null == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String,targetRoleKey: freezed == targetRoleKey ? _self.targetRoleKey : targetRoleKey // ignore: cast_nullable_to_non_nullable
as String?,targetFeatureKey: freezed == targetFeatureKey ? _self.targetFeatureKey : targetFeatureKey // ignore: cast_nullable_to_non_nullable
as String?,targetEntityType: freezed == targetEntityType ? _self.targetEntityType : targetEntityType // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,adminNote: freezed == adminNote ? _self.adminNote : adminNote // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
