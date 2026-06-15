// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_profile.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthProfile {

@JsonKey(name: 'full_name') String? get fullName;@JsonKey(name: 'avatar_url') String? get avatarUrl; String? get phone;@JsonKey(name: 'account_type') String? get accountType;@JsonKey(name: 'onboarding_completed') bool get onboardingCompleted;
/// Create a copy of AuthProfile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthProfileCopyWith<AuthProfile> get copyWith => _$AuthProfileCopyWithImpl<AuthProfile>(this as AuthProfile, _$identity);

  /// Serializes this AuthProfile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,avatarUrl,phone,accountType,onboardingCompleted);

@override
String toString() {
  return 'AuthProfile(fullName: $fullName, avatarUrl: $avatarUrl, phone: $phone, accountType: $accountType, onboardingCompleted: $onboardingCompleted)';
}


}

/// @nodoc
abstract mixin class $AuthProfileCopyWith<$Res>  {
  factory $AuthProfileCopyWith(AuthProfile value, $Res Function(AuthProfile) _then) = _$AuthProfileCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'avatar_url') String? avatarUrl, String? phone,@JsonKey(name: 'account_type') String? accountType,@JsonKey(name: 'onboarding_completed') bool onboardingCompleted
});




}
/// @nodoc
class _$AuthProfileCopyWithImpl<$Res>
    implements $AuthProfileCopyWith<$Res> {
  _$AuthProfileCopyWithImpl(this._self, this._then);

  final AuthProfile _self;
  final $Res Function(AuthProfile) _then;

/// Create a copy of AuthProfile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? fullName = freezed,Object? avatarUrl = freezed,Object? phone = freezed,Object? accountType = freezed,Object? onboardingCompleted = null,}) {
  return _then(_self.copyWith(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String?,onboardingCompleted: null == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AuthProfile].
extension AuthProfilePatterns on AuthProfile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthProfile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthProfile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthProfile value)  $default,){
final _that = this;
switch (_that) {
case _AuthProfile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthProfile value)?  $default,){
final _that = this;
switch (_that) {
case _AuthProfile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? phone, @JsonKey(name: 'account_type')  String? accountType, @JsonKey(name: 'onboarding_completed')  bool onboardingCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthProfile() when $default != null:
return $default(_that.fullName,_that.avatarUrl,_that.phone,_that.accountType,_that.onboardingCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? phone, @JsonKey(name: 'account_type')  String? accountType, @JsonKey(name: 'onboarding_completed')  bool onboardingCompleted)  $default,) {final _that = this;
switch (_that) {
case _AuthProfile():
return $default(_that.fullName,_that.avatarUrl,_that.phone,_that.accountType,_that.onboardingCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'full_name')  String? fullName, @JsonKey(name: 'avatar_url')  String? avatarUrl,  String? phone, @JsonKey(name: 'account_type')  String? accountType, @JsonKey(name: 'onboarding_completed')  bool onboardingCompleted)?  $default,) {final _that = this;
switch (_that) {
case _AuthProfile() when $default != null:
return $default(_that.fullName,_that.avatarUrl,_that.phone,_that.accountType,_that.onboardingCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthProfile implements AuthProfile {
  const _AuthProfile({@JsonKey(name: 'full_name') this.fullName, @JsonKey(name: 'avatar_url') this.avatarUrl, this.phone, @JsonKey(name: 'account_type') this.accountType, @JsonKey(name: 'onboarding_completed') this.onboardingCompleted = false});
  factory _AuthProfile.fromJson(Map<String, dynamic> json) => _$AuthProfileFromJson(json);

@override@JsonKey(name: 'full_name') final  String? fullName;
@override@JsonKey(name: 'avatar_url') final  String? avatarUrl;
@override final  String? phone;
@override@JsonKey(name: 'account_type') final  String? accountType;
@override@JsonKey(name: 'onboarding_completed') final  bool onboardingCompleted;

/// Create a copy of AuthProfile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthProfileCopyWith<_AuthProfile> get copyWith => __$AuthProfileCopyWithImpl<_AuthProfile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthProfileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthProfile&&(identical(other.fullName, fullName) || other.fullName == fullName)&&(identical(other.avatarUrl, avatarUrl) || other.avatarUrl == avatarUrl)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.onboardingCompleted, onboardingCompleted) || other.onboardingCompleted == onboardingCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,fullName,avatarUrl,phone,accountType,onboardingCompleted);

@override
String toString() {
  return 'AuthProfile(fullName: $fullName, avatarUrl: $avatarUrl, phone: $phone, accountType: $accountType, onboardingCompleted: $onboardingCompleted)';
}


}

/// @nodoc
abstract mixin class _$AuthProfileCopyWith<$Res> implements $AuthProfileCopyWith<$Res> {
  factory _$AuthProfileCopyWith(_AuthProfile value, $Res Function(_AuthProfile) _then) = __$AuthProfileCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'full_name') String? fullName,@JsonKey(name: 'avatar_url') String? avatarUrl, String? phone,@JsonKey(name: 'account_type') String? accountType,@JsonKey(name: 'onboarding_completed') bool onboardingCompleted
});




}
/// @nodoc
class __$AuthProfileCopyWithImpl<$Res>
    implements _$AuthProfileCopyWith<$Res> {
  __$AuthProfileCopyWithImpl(this._self, this._then);

  final _AuthProfile _self;
  final $Res Function(_AuthProfile) _then;

/// Create a copy of AuthProfile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? fullName = freezed,Object? avatarUrl = freezed,Object? phone = freezed,Object? accountType = freezed,Object? onboardingCompleted = null,}) {
  return _then(_AuthProfile(
fullName: freezed == fullName ? _self.fullName : fullName // ignore: cast_nullable_to_non_nullable
as String?,avatarUrl: freezed == avatarUrl ? _self.avatarUrl : avatarUrl // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,accountType: freezed == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String?,onboardingCompleted: null == onboardingCompleted ? _self.onboardingCompleted : onboardingCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
