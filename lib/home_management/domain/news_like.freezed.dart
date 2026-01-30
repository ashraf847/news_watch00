// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_like.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsLike _$NewsLikeFromJson(Map<String, dynamic> json) {
  return _NewsLike.fromJson(json);
}

/// @nodoc
mixin _$NewsLike {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get newsId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;

  /// Serializes this NewsLike to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsLikeCopyWith<NewsLike> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsLikeCopyWith<$Res> {
  factory $NewsLikeCopyWith(NewsLike value, $Res Function(NewsLike) then) =
      _$NewsLikeCopyWithImpl<$Res, NewsLike>;
  @useResult
  $Res call({String? id, String userId, String newsId, DateTime date});
}

/// @nodoc
class _$NewsLikeCopyWithImpl<$Res, $Val extends NewsLike>
    implements $NewsLikeCopyWith<$Res> {
  _$NewsLikeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? newsId = null,
    Object? date = null,
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
      newsId: null == newsId
          ? _value.newsId
          : newsId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsLikeImplCopyWith<$Res>
    implements $NewsLikeCopyWith<$Res> {
  factory _$$NewsLikeImplCopyWith(
          _$NewsLikeImpl value, $Res Function(_$NewsLikeImpl) then) =
      __$$NewsLikeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String userId, String newsId, DateTime date});
}

/// @nodoc
class __$$NewsLikeImplCopyWithImpl<$Res>
    extends _$NewsLikeCopyWithImpl<$Res, _$NewsLikeImpl>
    implements _$$NewsLikeImplCopyWith<$Res> {
  __$$NewsLikeImplCopyWithImpl(
      _$NewsLikeImpl _value, $Res Function(_$NewsLikeImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsLike
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? newsId = null,
    Object? date = null,
  }) {
    return _then(_$NewsLikeImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      newsId: null == newsId
          ? _value.newsId
          : newsId // ignore: cast_nullable_to_non_nullable
              as String,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsLikeImpl implements _NewsLike {
  _$NewsLikeImpl(
      {this.id,
      required this.userId,
      required this.newsId,
      required this.date});

  factory _$NewsLikeImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsLikeImplFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String newsId;
  @override
  final DateTime date;

  @override
  String toString() {
    return 'NewsLike(id: $id, userId: $userId, newsId: $newsId, date: $date)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsLikeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.newsId, newsId) || other.newsId == newsId) &&
            (identical(other.date, date) || other.date == date));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, newsId, date);

  /// Create a copy of NewsLike
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsLikeImplCopyWith<_$NewsLikeImpl> get copyWith =>
      __$$NewsLikeImplCopyWithImpl<_$NewsLikeImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsLikeImplToJson(
      this,
    );
  }
}

abstract class _NewsLike implements NewsLike {
  factory _NewsLike(
      {final String? id,
      required final String userId,
      required final String newsId,
      required final DateTime date}) = _$NewsLikeImpl;

  factory _NewsLike.fromJson(Map<String, dynamic> json) =
      _$NewsLikeImpl.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String get newsId;
  @override
  DateTime get date;

  /// Create a copy of NewsLike
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsLikeImplCopyWith<_$NewsLikeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
