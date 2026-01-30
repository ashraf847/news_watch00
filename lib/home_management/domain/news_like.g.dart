// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_like.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsLikeImpl _$$NewsLikeImplFromJson(Map<String, dynamic> json) =>
    _$NewsLikeImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      newsId: json['newsId'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$$NewsLikeImplToJson(_$NewsLikeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'newsId': instance.newsId,
      'date': instance.date.toIso8601String(),
    };
