// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'news_comment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NewsComment _$NewsCommentFromJson(Map<String, dynamic> json) {
  return _NewsComment.fromJson(json);
}

/// @nodoc
mixin _$NewsComment {
  String? get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get newsId => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get comment => throw _privateConstructorUsedError;

  /// Serializes this NewsComment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NewsComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NewsCommentCopyWith<NewsComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NewsCommentCopyWith<$Res> {
  factory $NewsCommentCopyWith(
          NewsComment value, $Res Function(NewsComment) then) =
      _$NewsCommentCopyWithImpl<$Res, NewsComment>;
  @useResult
  $Res call(
      {String? id,
      String userId,
      String newsId,
      DateTime date,
      String comment});
}

/// @nodoc
class _$NewsCommentCopyWithImpl<$Res, $Val extends NewsComment>
    implements $NewsCommentCopyWith<$Res> {
  _$NewsCommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NewsComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? newsId = null,
    Object? date = null,
    Object? comment = null,
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
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NewsCommentImplCopyWith<$Res>
    implements $NewsCommentCopyWith<$Res> {
  factory _$$NewsCommentImplCopyWith(
          _$NewsCommentImpl value, $Res Function(_$NewsCommentImpl) then) =
      __$$NewsCommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String userId,
      String newsId,
      DateTime date,
      String comment});
}

/// @nodoc
class __$$NewsCommentImplCopyWithImpl<$Res>
    extends _$NewsCommentCopyWithImpl<$Res, _$NewsCommentImpl>
    implements _$$NewsCommentImplCopyWith<$Res> {
  __$$NewsCommentImplCopyWithImpl(
      _$NewsCommentImpl _value, $Res Function(_$NewsCommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of NewsComment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userId = null,
    Object? newsId = null,
    Object? date = null,
    Object? comment = null,
  }) {
    return _then(_$NewsCommentImpl(
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
      comment: null == comment
          ? _value.comment
          : comment // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NewsCommentImpl implements _NewsComment {
  _$NewsCommentImpl(
      {this.id,
      required this.userId,
      required this.newsId,
      required this.date,
      required this.comment});

  factory _$NewsCommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$NewsCommentImplFromJson(json);

  @override
  final String? id;
  @override
  final String userId;
  @override
  final String newsId;
  @override
  final DateTime date;
  @override
  final String comment;

  @override
  String toString() {
    return 'NewsComment(id: $id, userId: $userId, newsId: $newsId, date: $date, comment: $comment)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NewsCommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.newsId, newsId) || other.newsId == newsId) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.comment, comment) || other.comment == comment));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, userId, newsId, date, comment);

  /// Create a copy of NewsComment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NewsCommentImplCopyWith<_$NewsCommentImpl> get copyWith =>
      __$$NewsCommentImplCopyWithImpl<_$NewsCommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NewsCommentImplToJson(
      this,
    );
  }
}

abstract class _NewsComment implements NewsComment {
  factory _NewsComment(
      {final String? id,
      required final String userId,
      required final String newsId,
      required final DateTime date,
      required final String comment}) = _$NewsCommentImpl;

  factory _NewsComment.fromJson(Map<String, dynamic> json) =
      _$NewsCommentImpl.fromJson;

  @override
  String? get id;
  @override
  String get userId;
  @override
  String get newsId;
  @override
  DateTime get date;
  @override
  String get comment;

  /// Create a copy of NewsComment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NewsCommentImplCopyWith<_$NewsCommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
