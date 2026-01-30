// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_comment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsCommentImpl _$$NewsCommentImplFromJson(Map<String, dynamic> json) =>
    _$NewsCommentImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      newsId: json['newsId'] as String,
      date: DateTime.parse(json['date'] as String),
      comment: json['comment'] as String,
    );

Map<String, dynamic> _$$NewsCommentImplToJson(_$NewsCommentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'newsId': instance.newsId,
      'date': instance.date.toIso8601String(),
      'comment': instance.comment,
    };
