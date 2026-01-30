// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsImpl _$$NewsImplFromJson(Map<String, dynamic> json) => _$NewsImpl(
      id: json['id'] as String?,
      userId: json['userId'] as String,
      title: json['title'] as String,
      details: json['details'] as String,
      category: $enumDecode(_$CategoryEnumMap, json['category']),
      date: DateTime.parse(json['date'] as String),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      profilePictureUrl: json['profilePictureUrl'] as String?,
      numberOfLikes: (json['numberOfLikes'] as num?)?.toInt() ?? 0,
      numberOfComments: (json['numberOfComments'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$NewsImplToJson(_$NewsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'details': instance.details,
      'category': _$CategoryEnumMap[instance.category]!,
      'date': instance.date.toIso8601String(),
      'tags': instance.tags,
      'profilePictureUrl': instance.profilePictureUrl,
      'numberOfLikes': instance.numberOfLikes,
      'numberOfComments': instance.numberOfComments,
    };

const _$CategoryEnumMap = {
  Category.politics: 'politics',
  Category.tech: 'tech',
  Category.healthy: 'healthy',
  Category.science: 'science',
};
