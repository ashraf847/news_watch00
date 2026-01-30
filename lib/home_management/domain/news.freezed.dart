// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

News _$NewsFromJson(Map<String, dynamic> json) {
  return _News.fromJson(json);
}

/// @nodoc
mixin _$News {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get details => throw _privateConstructorUsedError;
  Category get category => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  String? get profilePictureUrl =>
      throw _privateConstructorUsedError; // -------------------------------------------------------------------------
  int? get numberOfLikes => throw _privateConstructorUsedError;
  int? get numberOfComments => throw _privateConstructorUsedError;

  /// Serializes this News to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsCopyWith<News> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCopyWith<$Res> {
  factory $NewsCopyWith(News value, $Res Function(News) then) =
      _$NewsCopyWithImpl<$Res, News>;
  @useResult
  $Res call(
      {String? id,
      String userId,
      String title,
      String details,
      Category category,
      DateTime date,
      List<String> tags,
      String? profilePictureUrl,
      int? numberOfLikes,
      int? numberOfComments});
}

/// @nodoc
class _$NewsCopyWithImpl<$Res, $Val extends News>
    implements $NewsCopyWith<$Res> {
  _$NewsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? title = null,
    Object? details = null,
    Object? category = null,
    Object? date = null,
    Object? tags = null,
    Object? profilePictureUrl = freezed,
    Object? numberOfLikes = freezed,
    Object? numberOfComments = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfLikes: freezed == numberOfLikes
          ? _value.numberOfLikes
          : numberOfLikes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfComments: freezed == numberOfComments
          ? _value.numberOfComments
          : numberOfComments // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsImplCopyWith<$Res> implements $NewsCopyWith<$Res> {
  factory _$$NewsImplCopyWith(
          _$NewsImpl value, $Res Function(_$NewsImpl) then) =
      __$$NewsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String userId,
      String title,
      String details,
      Category category,
      DateTime date,
      List<String> tags,
      String? profilePictureUrl,
      int? numberOfLikes,
      int? numberOfComments});
}

/// @nodoc
class __$$NewsImplCopyWithImpl<$Res>
    extends _$NewsCopyWithImpl<$Res, _$NewsImpl>
    implements _$$NewsImplCopyWith<$Res> {
  __$$NewsImplCopyWithImpl(_$NewsImpl _value, $Res Function(_$NewsImpl) _then)
      : super(_value, _then);

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? title = null,
    Object? details = null,
    Object? category = null,
    Object? date = null,
    Object? tags = null,
    Object? profilePictureUrl = freezed,
    Object? numberOfLikes = freezed,
    Object? numberOfComments = freezed,
  }) {
    return _then(_$NewsImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      details: null == details
          ? _value.details
          : details // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as Category,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      tags: null == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      profilePictureUrl: freezed == profilePictureUrl
          ? _value.profilePictureUrl
          : profilePictureUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfLikes: freezed == numberOfLikes
          ? _value.numberOfLikes
          : numberOfLikes // ignore: cast_nullable_to_non_nullable
              as int?,
      numberOfComments: freezed == numberOfComments
          ? _value.numberOfComments
          : numberOfComments // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsImpl implements _News {
  _$NewsImpl(
      {this.id,
      required this.userId,
      required this.title,
      required this.details,
      required this.category,
      required this.date,
      required final List<String> tags,
      this.profilePictureUrl,
      this.numberOfLikes = 0,
      this.numberOfComments = 0})
      : _tags = tags;

  factory _$NewsImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsImplFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String title;
  @override
  final String details;
  @override
  final Category category;
  @override
  final DateTime date;
  final List<String> _tags;
  @override
  List<String> get tags {
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tags);
  }

  @override
  final String? profilePictureUrl;
// -------------------------------------------------------------------------
  @override
  @JsonKey()
  final int? numberOfLikes;
  @override
  @JsonKey()
  final int? numberOfComments;

  @override
  String toString() {
    return 'News(id: $id, userId: $userId, title: $title, details: $details, category: $category, date: $date, tags: $tags, profilePictureUrl: $profilePictureUrl, numberOfLikes: $numberOfLikes, numberOfComments: $numberOfComments)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.details, details) || other.details == details) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.date, date) || other.date == date) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.profilePictureUrl, profilePictureUrl) ||
                other.profilePictureUrl == profilePictureUrl) &&
            (identical(other.numberOfLikes, numberOfLikes) ||
                other.numberOfLikes == numberOfLikes) &&
            (identical(other.numberOfComments, numberOfComments) ||
                other.numberOfComments == numberOfComments));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      title,
      details,
      category,
      date,
      const DeepCollectionEquality().hash(_tags),
      profilePictureUrl,
      numberOfLikes,
      numberOfComments);

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      __$$NewsImplCopyWithImpl<_$NewsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsImplToJson(
      this,
    );
  }
}

abstract class _News implements News {
  factory _News(
      {final String? id,
      required final String userId,
      required final String title,
      required final String details,
      required final Category category,
      required final DateTime date,
      required final List<String> tags,
      final String? profilePictureUrl,
      final int? numberOfLikes,
      final int? numberOfComments}) = _$NewsImpl;

  factory _News.fromJson(Map<String, dynamic> json) = _$NewsImpl.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String get title;
  @override
  String get details;
  @override
  Category get category;
  @override
  DateTime get date;
  @override
  List<String> get tags;
  @override
  String?
      get profilePictureUrl; // -------------------------------------------------------------------------
  @override
  int? get numberOfLikes;
  @override
  int? get numberOfComments;

  /// Create a copy of News
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsImplCopyWith<_$NewsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
