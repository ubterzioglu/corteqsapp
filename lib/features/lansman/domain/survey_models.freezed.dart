// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'survey_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SurveyQuestion {

 String get id; String get question; String? get description; String get type;@JsonKey(name: 'is_required') bool get isRequired;@JsonKey(name: 'sort_order') int get sortOrder; String? get placeholder; dynamic get options;
/// Create a copy of SurveyQuestion
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveyQuestionCopyWith<SurveyQuestion> get copyWith => _$SurveyQuestionCopyWithImpl<SurveyQuestion>(this as SurveyQuestion, _$identity);

  /// Serializes this SurveyQuestion to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,description,type,isRequired,sortOrder,placeholder,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'SurveyQuestion(id: $id, question: $question, description: $description, type: $type, isRequired: $isRequired, sortOrder: $sortOrder, placeholder: $placeholder, options: $options)';
}


}

/// @nodoc
abstract mixin class $SurveyQuestionCopyWith<$Res>  {
  factory $SurveyQuestionCopyWith(SurveyQuestion value, $Res Function(SurveyQuestion) _then) = _$SurveyQuestionCopyWithImpl;
@useResult
$Res call({
 String id, String question, String? description, String type,@JsonKey(name: 'is_required') bool isRequired,@JsonKey(name: 'sort_order') int sortOrder, String? placeholder, dynamic options
});




}
/// @nodoc
class _$SurveyQuestionCopyWithImpl<$Res>
    implements $SurveyQuestionCopyWith<$Res> {
  _$SurveyQuestionCopyWithImpl(this._self, this._then);

  final SurveyQuestion _self;
  final $Res Function(SurveyQuestion) _then;

/// Create a copy of SurveyQuestion
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? question = null,Object? description = freezed,Object? type = null,Object? isRequired = null,Object? sortOrder = null,Object? placeholder = freezed,Object? options = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}

}


/// Adds pattern-matching-related methods to [SurveyQuestion].
extension SurveyQuestionPatterns on SurveyQuestion {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SurveyQuestion value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SurveyQuestion() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SurveyQuestion value)  $default,){
final _that = this;
switch (_that) {
case _SurveyQuestion():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SurveyQuestion value)?  $default,){
final _that = this;
switch (_that) {
case _SurveyQuestion() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String question,  String? description,  String type, @JsonKey(name: 'is_required')  bool isRequired, @JsonKey(name: 'sort_order')  int sortOrder,  String? placeholder,  dynamic options)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SurveyQuestion() when $default != null:
return $default(_that.id,_that.question,_that.description,_that.type,_that.isRequired,_that.sortOrder,_that.placeholder,_that.options);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String question,  String? description,  String type, @JsonKey(name: 'is_required')  bool isRequired, @JsonKey(name: 'sort_order')  int sortOrder,  String? placeholder,  dynamic options)  $default,) {final _that = this;
switch (_that) {
case _SurveyQuestion():
return $default(_that.id,_that.question,_that.description,_that.type,_that.isRequired,_that.sortOrder,_that.placeholder,_that.options);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String question,  String? description,  String type, @JsonKey(name: 'is_required')  bool isRequired, @JsonKey(name: 'sort_order')  int sortOrder,  String? placeholder,  dynamic options)?  $default,) {final _that = this;
switch (_that) {
case _SurveyQuestion() when $default != null:
return $default(_that.id,_that.question,_that.description,_that.type,_that.isRequired,_that.sortOrder,_that.placeholder,_that.options);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SurveyQuestion implements SurveyQuestion {
  const _SurveyQuestion({required this.id, this.question = '', this.description, this.type = 'text', @JsonKey(name: 'is_required') this.isRequired = false, @JsonKey(name: 'sort_order') this.sortOrder = 0, this.placeholder, this.options});
  factory _SurveyQuestion.fromJson(Map<String, dynamic> json) => _$SurveyQuestionFromJson(json);

@override final  String id;
@override@JsonKey() final  String question;
@override final  String? description;
@override@JsonKey() final  String type;
@override@JsonKey(name: 'is_required') final  bool isRequired;
@override@JsonKey(name: 'sort_order') final  int sortOrder;
@override final  String? placeholder;
@override final  dynamic options;

/// Create a copy of SurveyQuestion
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurveyQuestionCopyWith<_SurveyQuestion> get copyWith => __$SurveyQuestionCopyWithImpl<_SurveyQuestion>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SurveyQuestionToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SurveyQuestion&&(identical(other.id, id) || other.id == id)&&(identical(other.question, question) || other.question == question)&&(identical(other.description, description) || other.description == description)&&(identical(other.type, type) || other.type == type)&&(identical(other.isRequired, isRequired) || other.isRequired == isRequired)&&(identical(other.sortOrder, sortOrder) || other.sortOrder == sortOrder)&&(identical(other.placeholder, placeholder) || other.placeholder == placeholder)&&const DeepCollectionEquality().equals(other.options, options));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,question,description,type,isRequired,sortOrder,placeholder,const DeepCollectionEquality().hash(options));

@override
String toString() {
  return 'SurveyQuestion(id: $id, question: $question, description: $description, type: $type, isRequired: $isRequired, sortOrder: $sortOrder, placeholder: $placeholder, options: $options)';
}


}

/// @nodoc
abstract mixin class _$SurveyQuestionCopyWith<$Res> implements $SurveyQuestionCopyWith<$Res> {
  factory _$SurveyQuestionCopyWith(_SurveyQuestion value, $Res Function(_SurveyQuestion) _then) = __$SurveyQuestionCopyWithImpl;
@override @useResult
$Res call({
 String id, String question, String? description, String type,@JsonKey(name: 'is_required') bool isRequired,@JsonKey(name: 'sort_order') int sortOrder, String? placeholder, dynamic options
});




}
/// @nodoc
class __$SurveyQuestionCopyWithImpl<$Res>
    implements _$SurveyQuestionCopyWith<$Res> {
  __$SurveyQuestionCopyWithImpl(this._self, this._then);

  final _SurveyQuestion _self;
  final $Res Function(_SurveyQuestion) _then;

/// Create a copy of SurveyQuestion
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? question = null,Object? description = freezed,Object? type = null,Object? isRequired = null,Object? sortOrder = null,Object? placeholder = freezed,Object? options = freezed,}) {
  return _then(_SurveyQuestion(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,question: null == question ? _self.question : question // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,isRequired: null == isRequired ? _self.isRequired : isRequired // ignore: cast_nullable_to_non_nullable
as bool,sortOrder: null == sortOrder ? _self.sortOrder : sortOrder // ignore: cast_nullable_to_non_nullable
as int,placeholder: freezed == placeholder ? _self.placeholder : placeholder // ignore: cast_nullable_to_non_nullable
as String?,options: freezed == options ? _self.options : options // ignore: cast_nullable_to_non_nullable
as dynamic,
  ));
}


}


/// @nodoc
mixin _$SurveyWithQuestions {

 String get id; String get slug; String get title; String? get description;@JsonKey(name: 'survey_questions') List<SurveyQuestion> get questions;
/// Create a copy of SurveyWithQuestions
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SurveyWithQuestionsCopyWith<SurveyWithQuestions> get copyWith => _$SurveyWithQuestionsCopyWithImpl<SurveyWithQuestions>(this as SurveyWithQuestions, _$identity);

  /// Serializes this SurveyWithQuestions to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SurveyWithQuestions&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.questions, questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,const DeepCollectionEquality().hash(questions));

@override
String toString() {
  return 'SurveyWithQuestions(id: $id, slug: $slug, title: $title, description: $description, questions: $questions)';
}


}

/// @nodoc
abstract mixin class $SurveyWithQuestionsCopyWith<$Res>  {
  factory $SurveyWithQuestionsCopyWith(SurveyWithQuestions value, $Res Function(SurveyWithQuestions) _then) = _$SurveyWithQuestionsCopyWithImpl;
@useResult
$Res call({
 String id, String slug, String title, String? description,@JsonKey(name: 'survey_questions') List<SurveyQuestion> questions
});




}
/// @nodoc
class _$SurveyWithQuestionsCopyWithImpl<$Res>
    implements $SurveyWithQuestionsCopyWith<$Res> {
  _$SurveyWithQuestionsCopyWithImpl(this._self, this._then);

  final SurveyWithQuestions _self;
  final $Res Function(SurveyWithQuestions) _then;

/// Create a copy of SurveyWithQuestions
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? description = freezed,Object? questions = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,questions: null == questions ? _self.questions : questions // ignore: cast_nullable_to_non_nullable
as List<SurveyQuestion>,
  ));
}

}


/// Adds pattern-matching-related methods to [SurveyWithQuestions].
extension SurveyWithQuestionsPatterns on SurveyWithQuestions {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SurveyWithQuestions value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SurveyWithQuestions() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SurveyWithQuestions value)  $default,){
final _that = this;
switch (_that) {
case _SurveyWithQuestions():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SurveyWithQuestions value)?  $default,){
final _that = this;
switch (_that) {
case _SurveyWithQuestions() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String slug,  String title,  String? description, @JsonKey(name: 'survey_questions')  List<SurveyQuestion> questions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SurveyWithQuestions() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.questions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String slug,  String title,  String? description, @JsonKey(name: 'survey_questions')  List<SurveyQuestion> questions)  $default,) {final _that = this;
switch (_that) {
case _SurveyWithQuestions():
return $default(_that.id,_that.slug,_that.title,_that.description,_that.questions);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String slug,  String title,  String? description, @JsonKey(name: 'survey_questions')  List<SurveyQuestion> questions)?  $default,) {final _that = this;
switch (_that) {
case _SurveyWithQuestions() when $default != null:
return $default(_that.id,_that.slug,_that.title,_that.description,_that.questions);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SurveyWithQuestions implements SurveyWithQuestions {
  const _SurveyWithQuestions({required this.id, this.slug = '', this.title = '', this.description, @JsonKey(name: 'survey_questions') final  List<SurveyQuestion> questions = const <SurveyQuestion>[]}): _questions = questions;
  factory _SurveyWithQuestions.fromJson(Map<String, dynamic> json) => _$SurveyWithQuestionsFromJson(json);

@override final  String id;
@override@JsonKey() final  String slug;
@override@JsonKey() final  String title;
@override final  String? description;
 final  List<SurveyQuestion> _questions;
@override@JsonKey(name: 'survey_questions') List<SurveyQuestion> get questions {
  if (_questions is EqualUnmodifiableListView) return _questions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_questions);
}


/// Create a copy of SurveyWithQuestions
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SurveyWithQuestionsCopyWith<_SurveyWithQuestions> get copyWith => __$SurveyWithQuestionsCopyWithImpl<_SurveyWithQuestions>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SurveyWithQuestionsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SurveyWithQuestions&&(identical(other.id, id) || other.id == id)&&(identical(other.slug, slug) || other.slug == slug)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._questions, _questions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,slug,title,description,const DeepCollectionEquality().hash(_questions));

@override
String toString() {
  return 'SurveyWithQuestions(id: $id, slug: $slug, title: $title, description: $description, questions: $questions)';
}


}

/// @nodoc
abstract mixin class _$SurveyWithQuestionsCopyWith<$Res> implements $SurveyWithQuestionsCopyWith<$Res> {
  factory _$SurveyWithQuestionsCopyWith(_SurveyWithQuestions value, $Res Function(_SurveyWithQuestions) _then) = __$SurveyWithQuestionsCopyWithImpl;
@override @useResult
$Res call({
 String id, String slug, String title, String? description,@JsonKey(name: 'survey_questions') List<SurveyQuestion> questions
});




}
/// @nodoc
class __$SurveyWithQuestionsCopyWithImpl<$Res>
    implements _$SurveyWithQuestionsCopyWith<$Res> {
  __$SurveyWithQuestionsCopyWithImpl(this._self, this._then);

  final _SurveyWithQuestions _self;
  final $Res Function(_SurveyWithQuestions) _then;

/// Create a copy of SurveyWithQuestions
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? slug = null,Object? title = null,Object? description = freezed,Object? questions = null,}) {
  return _then(_SurveyWithQuestions(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,slug: null == slug ? _self.slug : slug // ignore: cast_nullable_to_non_nullable
as String,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,questions: null == questions ? _self._questions : questions // ignore: cast_nullable_to_non_nullable
as List<SurveyQuestion>,
  ));
}


}

// dart format on
