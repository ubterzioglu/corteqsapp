// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cadde_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ReactionCounts {

 int get like; int get support; int get idea;
/// Create a copy of ReactionCounts
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ReactionCountsCopyWith<ReactionCounts> get copyWith => _$ReactionCountsCopyWithImpl<ReactionCounts>(this as ReactionCounts, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ReactionCounts&&(identical(other.like, like) || other.like == like)&&(identical(other.support, support) || other.support == support)&&(identical(other.idea, idea) || other.idea == idea));
}


@override
int get hashCode => Object.hash(runtimeType,like,support,idea);

@override
String toString() {
  return 'ReactionCounts(like: $like, support: $support, idea: $idea)';
}


}

/// @nodoc
abstract mixin class $ReactionCountsCopyWith<$Res>  {
  factory $ReactionCountsCopyWith(ReactionCounts value, $Res Function(ReactionCounts) _then) = _$ReactionCountsCopyWithImpl;
@useResult
$Res call({
 int like, int support, int idea
});




}
/// @nodoc
class _$ReactionCountsCopyWithImpl<$Res>
    implements $ReactionCountsCopyWith<$Res> {
  _$ReactionCountsCopyWithImpl(this._self, this._then);

  final ReactionCounts _self;
  final $Res Function(ReactionCounts) _then;

/// Create a copy of ReactionCounts
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? like = null,Object? support = null,Object? idea = null,}) {
  return _then(_self.copyWith(
like: null == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int,support: null == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as int,idea: null == idea ? _self.idea : idea // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ReactionCounts].
extension ReactionCountsPatterns on ReactionCounts {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ReactionCounts value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ReactionCounts() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ReactionCounts value)  $default,){
final _that = this;
switch (_that) {
case _ReactionCounts():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ReactionCounts value)?  $default,){
final _that = this;
switch (_that) {
case _ReactionCounts() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int like,  int support,  int idea)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ReactionCounts() when $default != null:
return $default(_that.like,_that.support,_that.idea);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int like,  int support,  int idea)  $default,) {final _that = this;
switch (_that) {
case _ReactionCounts():
return $default(_that.like,_that.support,_that.idea);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int like,  int support,  int idea)?  $default,) {final _that = this;
switch (_that) {
case _ReactionCounts() when $default != null:
return $default(_that.like,_that.support,_that.idea);case _:
  return null;

}
}

}

/// @nodoc


class _ReactionCounts extends ReactionCounts {
  const _ReactionCounts({this.like = 0, this.support = 0, this.idea = 0}): super._();
  

@override@JsonKey() final  int like;
@override@JsonKey() final  int support;
@override@JsonKey() final  int idea;

/// Create a copy of ReactionCounts
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ReactionCountsCopyWith<_ReactionCounts> get copyWith => __$ReactionCountsCopyWithImpl<_ReactionCounts>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ReactionCounts&&(identical(other.like, like) || other.like == like)&&(identical(other.support, support) || other.support == support)&&(identical(other.idea, idea) || other.idea == idea));
}


@override
int get hashCode => Object.hash(runtimeType,like,support,idea);

@override
String toString() {
  return 'ReactionCounts(like: $like, support: $support, idea: $idea)';
}


}

/// @nodoc
abstract mixin class _$ReactionCountsCopyWith<$Res> implements $ReactionCountsCopyWith<$Res> {
  factory _$ReactionCountsCopyWith(_ReactionCounts value, $Res Function(_ReactionCounts) _then) = __$ReactionCountsCopyWithImpl;
@override @useResult
$Res call({
 int like, int support, int idea
});




}
/// @nodoc
class __$ReactionCountsCopyWithImpl<$Res>
    implements _$ReactionCountsCopyWith<$Res> {
  __$ReactionCountsCopyWithImpl(this._self, this._then);

  final _ReactionCounts _self;
  final $Res Function(_ReactionCounts) _then;

/// Create a copy of ReactionCounts
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? like = null,Object? support = null,Object? idea = null,}) {
  return _then(_ReactionCounts(
like: null == like ? _self.like : like // ignore: cast_nullable_to_non_nullable
as int,support: null == support ? _self.support : support // ignore: cast_nullable_to_non_nullable
as int,idea: null == idea ? _self.idea : idea // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$CaddePost {

 String get id; String? get authorUserId; String? get authorName; String get type; String? get title; String get body; String? get country; String? get city; String? get createdAt; ReactionCounts get reactions; int get commentCount; Set<CaddeReactionType> get viewerReactions;
/// Create a copy of CaddePost
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaddePostCopyWith<CaddePost> get copyWith => _$CaddePostCopyWithImpl<CaddePost>(this as CaddePost, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaddePost&&(identical(other.id, id) || other.id == id)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reactions, reactions) || other.reactions == reactions)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other.viewerReactions, viewerReactions));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorUserId,authorName,type,title,body,country,city,createdAt,reactions,commentCount,const DeepCollectionEquality().hash(viewerReactions));

@override
String toString() {
  return 'CaddePost(id: $id, authorUserId: $authorUserId, authorName: $authorName, type: $type, title: $title, body: $body, country: $country, city: $city, createdAt: $createdAt, reactions: $reactions, commentCount: $commentCount, viewerReactions: $viewerReactions)';
}


}

/// @nodoc
abstract mixin class $CaddePostCopyWith<$Res>  {
  factory $CaddePostCopyWith(CaddePost value, $Res Function(CaddePost) _then) = _$CaddePostCopyWithImpl;
@useResult
$Res call({
 String id, String? authorUserId, String? authorName, String type, String? title, String body, String? country, String? city, String? createdAt, ReactionCounts reactions, int commentCount, Set<CaddeReactionType> viewerReactions
});


$ReactionCountsCopyWith<$Res> get reactions;

}
/// @nodoc
class _$CaddePostCopyWithImpl<$Res>
    implements $CaddePostCopyWith<$Res> {
  _$CaddePostCopyWithImpl(this._self, this._then);

  final CaddePost _self;
  final $Res Function(CaddePost) _then;

/// Create a copy of CaddePost
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? authorUserId = freezed,Object? authorName = freezed,Object? type = null,Object? title = freezed,Object? body = null,Object? country = freezed,Object? city = freezed,Object? createdAt = freezed,Object? reactions = null,Object? commentCount = null,Object? viewerReactions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorUserId: freezed == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as ReactionCounts,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,viewerReactions: null == viewerReactions ? _self.viewerReactions : viewerReactions // ignore: cast_nullable_to_non_nullable
as Set<CaddeReactionType>,
  ));
}
/// Create a copy of CaddePost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReactionCountsCopyWith<$Res> get reactions {
  
  return $ReactionCountsCopyWith<$Res>(_self.reactions, (value) {
    return _then(_self.copyWith(reactions: value));
  });
}
}


/// Adds pattern-matching-related methods to [CaddePost].
extension CaddePostPatterns on CaddePost {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaddePost value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaddePost() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaddePost value)  $default,){
final _that = this;
switch (_that) {
case _CaddePost():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaddePost value)?  $default,){
final _that = this;
switch (_that) {
case _CaddePost() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? authorUserId,  String? authorName,  String type,  String? title,  String body,  String? country,  String? city,  String? createdAt,  ReactionCounts reactions,  int commentCount,  Set<CaddeReactionType> viewerReactions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaddePost() when $default != null:
return $default(_that.id,_that.authorUserId,_that.authorName,_that.type,_that.title,_that.body,_that.country,_that.city,_that.createdAt,_that.reactions,_that.commentCount,_that.viewerReactions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? authorUserId,  String? authorName,  String type,  String? title,  String body,  String? country,  String? city,  String? createdAt,  ReactionCounts reactions,  int commentCount,  Set<CaddeReactionType> viewerReactions)  $default,) {final _that = this;
switch (_that) {
case _CaddePost():
return $default(_that.id,_that.authorUserId,_that.authorName,_that.type,_that.title,_that.body,_that.country,_that.city,_that.createdAt,_that.reactions,_that.commentCount,_that.viewerReactions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? authorUserId,  String? authorName,  String type,  String? title,  String body,  String? country,  String? city,  String? createdAt,  ReactionCounts reactions,  int commentCount,  Set<CaddeReactionType> viewerReactions)?  $default,) {final _that = this;
switch (_that) {
case _CaddePost() when $default != null:
return $default(_that.id,_that.authorUserId,_that.authorName,_that.type,_that.title,_that.body,_that.country,_that.city,_that.createdAt,_that.reactions,_that.commentCount,_that.viewerReactions);case _:
  return null;

}
}

}

/// @nodoc


class _CaddePost implements CaddePost {
  const _CaddePost({required this.id, this.authorUserId, this.authorName, this.type = 'text', this.title, this.body = '', this.country, this.city, this.createdAt, this.reactions = const ReactionCounts(), this.commentCount = 0, final  Set<CaddeReactionType> viewerReactions = const <CaddeReactionType>{}}): _viewerReactions = viewerReactions;
  

@override final  String id;
@override final  String? authorUserId;
@override final  String? authorName;
@override@JsonKey() final  String type;
@override final  String? title;
@override@JsonKey() final  String body;
@override final  String? country;
@override final  String? city;
@override final  String? createdAt;
@override@JsonKey() final  ReactionCounts reactions;
@override@JsonKey() final  int commentCount;
 final  Set<CaddeReactionType> _viewerReactions;
@override@JsonKey() Set<CaddeReactionType> get viewerReactions {
  if (_viewerReactions is EqualUnmodifiableSetView) return _viewerReactions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_viewerReactions);
}


/// Create a copy of CaddePost
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaddePostCopyWith<_CaddePost> get copyWith => __$CaddePostCopyWithImpl<_CaddePost>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaddePost&&(identical(other.id, id) || other.id == id)&&(identical(other.authorUserId, authorUserId) || other.authorUserId == authorUserId)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.type, type) || other.type == type)&&(identical(other.title, title) || other.title == title)&&(identical(other.body, body) || other.body == body)&&(identical(other.country, country) || other.country == country)&&(identical(other.city, city) || other.city == city)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.reactions, reactions) || other.reactions == reactions)&&(identical(other.commentCount, commentCount) || other.commentCount == commentCount)&&const DeepCollectionEquality().equals(other._viewerReactions, _viewerReactions));
}


@override
int get hashCode => Object.hash(runtimeType,id,authorUserId,authorName,type,title,body,country,city,createdAt,reactions,commentCount,const DeepCollectionEquality().hash(_viewerReactions));

@override
String toString() {
  return 'CaddePost(id: $id, authorUserId: $authorUserId, authorName: $authorName, type: $type, title: $title, body: $body, country: $country, city: $city, createdAt: $createdAt, reactions: $reactions, commentCount: $commentCount, viewerReactions: $viewerReactions)';
}


}

/// @nodoc
abstract mixin class _$CaddePostCopyWith<$Res> implements $CaddePostCopyWith<$Res> {
  factory _$CaddePostCopyWith(_CaddePost value, $Res Function(_CaddePost) _then) = __$CaddePostCopyWithImpl;
@override @useResult
$Res call({
 String id, String? authorUserId, String? authorName, String type, String? title, String body, String? country, String? city, String? createdAt, ReactionCounts reactions, int commentCount, Set<CaddeReactionType> viewerReactions
});


@override $ReactionCountsCopyWith<$Res> get reactions;

}
/// @nodoc
class __$CaddePostCopyWithImpl<$Res>
    implements _$CaddePostCopyWith<$Res> {
  __$CaddePostCopyWithImpl(this._self, this._then);

  final _CaddePost _self;
  final $Res Function(_CaddePost) _then;

/// Create a copy of CaddePost
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? authorUserId = freezed,Object? authorName = freezed,Object? type = null,Object? title = freezed,Object? body = null,Object? country = freezed,Object? city = freezed,Object? createdAt = freezed,Object? reactions = null,Object? commentCount = null,Object? viewerReactions = null,}) {
  return _then(_CaddePost(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,authorUserId: freezed == authorUserId ? _self.authorUserId : authorUserId // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,body: null == body ? _self.body : body // ignore: cast_nullable_to_non_nullable
as String,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as String?,reactions: null == reactions ? _self.reactions : reactions // ignore: cast_nullable_to_non_nullable
as ReactionCounts,commentCount: null == commentCount ? _self.commentCount : commentCount // ignore: cast_nullable_to_non_nullable
as int,viewerReactions: null == viewerReactions ? _self._viewerReactions : viewerReactions // ignore: cast_nullable_to_non_nullable
as Set<CaddeReactionType>,
  ));
}

/// Create a copy of CaddePost
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ReactionCountsCopyWith<$Res> get reactions {
  
  return $ReactionCountsCopyWith<$Res>(_self.reactions, (value) {
    return _then(_self.copyWith(reactions: value));
  });
}
}

/// @nodoc
mixin _$CaddeFeedPage {

 List<CaddePost> get items; Map<String, dynamic>? get nextCursor;
/// Create a copy of CaddeFeedPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CaddeFeedPageCopyWith<CaddeFeedPage> get copyWith => _$CaddeFeedPageCopyWithImpl<CaddeFeedPage>(this as CaddeFeedPage, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CaddeFeedPage&&const DeepCollectionEquality().equals(other.items, items)&&const DeepCollectionEquality().equals(other.nextCursor, nextCursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(items),const DeepCollectionEquality().hash(nextCursor));

@override
String toString() {
  return 'CaddeFeedPage(items: $items, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class $CaddeFeedPageCopyWith<$Res>  {
  factory $CaddeFeedPageCopyWith(CaddeFeedPage value, $Res Function(CaddeFeedPage) _then) = _$CaddeFeedPageCopyWithImpl;
@useResult
$Res call({
 List<CaddePost> items, Map<String, dynamic>? nextCursor
});




}
/// @nodoc
class _$CaddeFeedPageCopyWithImpl<$Res>
    implements $CaddeFeedPageCopyWith<$Res> {
  _$CaddeFeedPageCopyWithImpl(this._self, this._then);

  final CaddeFeedPage _self;
  final $Res Function(CaddeFeedPage) _then;

/// Create a copy of CaddeFeedPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? items = null,Object? nextCursor = freezed,}) {
  return _then(_self.copyWith(
items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<CaddePost>,nextCursor: freezed == nextCursor ? _self.nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [CaddeFeedPage].
extension CaddeFeedPagePatterns on CaddeFeedPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CaddeFeedPage value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaddeFeedPage() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CaddeFeedPage value)  $default,){
final _that = this;
switch (_that) {
case _CaddeFeedPage():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CaddeFeedPage value)?  $default,){
final _that = this;
switch (_that) {
case _CaddeFeedPage() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CaddePost> items,  Map<String, dynamic>? nextCursor)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaddeFeedPage() when $default != null:
return $default(_that.items,_that.nextCursor);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CaddePost> items,  Map<String, dynamic>? nextCursor)  $default,) {final _that = this;
switch (_that) {
case _CaddeFeedPage():
return $default(_that.items,_that.nextCursor);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CaddePost> items,  Map<String, dynamic>? nextCursor)?  $default,) {final _that = this;
switch (_that) {
case _CaddeFeedPage() when $default != null:
return $default(_that.items,_that.nextCursor);case _:
  return null;

}
}

}

/// @nodoc


class _CaddeFeedPage implements CaddeFeedPage {
  const _CaddeFeedPage({final  List<CaddePost> items = const <CaddePost>[], final  Map<String, dynamic>? nextCursor}): _items = items,_nextCursor = nextCursor;
  

 final  List<CaddePost> _items;
@override@JsonKey() List<CaddePost> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  Map<String, dynamic>? _nextCursor;
@override Map<String, dynamic>? get nextCursor {
  final value = _nextCursor;
  if (value == null) return null;
  if (_nextCursor is EqualUnmodifiableMapView) return _nextCursor;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of CaddeFeedPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CaddeFeedPageCopyWith<_CaddeFeedPage> get copyWith => __$CaddeFeedPageCopyWithImpl<_CaddeFeedPage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaddeFeedPage&&const DeepCollectionEquality().equals(other._items, _items)&&const DeepCollectionEquality().equals(other._nextCursor, _nextCursor));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),const DeepCollectionEquality().hash(_nextCursor));

@override
String toString() {
  return 'CaddeFeedPage(items: $items, nextCursor: $nextCursor)';
}


}

/// @nodoc
abstract mixin class _$CaddeFeedPageCopyWith<$Res> implements $CaddeFeedPageCopyWith<$Res> {
  factory _$CaddeFeedPageCopyWith(_CaddeFeedPage value, $Res Function(_CaddeFeedPage) _then) = __$CaddeFeedPageCopyWithImpl;
@override @useResult
$Res call({
 List<CaddePost> items, Map<String, dynamic>? nextCursor
});




}
/// @nodoc
class __$CaddeFeedPageCopyWithImpl<$Res>
    implements _$CaddeFeedPageCopyWith<$Res> {
  __$CaddeFeedPageCopyWithImpl(this._self, this._then);

  final _CaddeFeedPage _self;
  final $Res Function(_CaddeFeedPage) _then;

/// Create a copy of CaddeFeedPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? items = null,Object? nextCursor = freezed,}) {
  return _then(_CaddeFeedPage(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CaddePost>,nextCursor: freezed == nextCursor ? _self._nextCursor : nextCursor // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

// dart format on
