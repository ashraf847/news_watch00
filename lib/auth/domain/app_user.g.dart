// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AppUserImpl _$$AppUserImplFromJson(Map<String, dynamic> json) =>
    _$AppUserImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
      email: json['email'] as String,
      userType: $enumDecode(_$UserTypeEnumMap, json['userType']),
      birthDate: json['birthDate'] == null
          ? null
          : DateTime.parse(json['birthDate'] as String),
      profilePictureUrl: json['profilePictureUrl'] as String?,
      nickNames: (json['nickNames'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      phone: json['phone'] as String?,
      stars: (json['stars'] as num?)?.toInt() ?? 0,
      fcmToken: json['fcmToken'] as String? ?? "",
    );

Map<String, dynamic> _$$AppUserImplToJson(_$AppUserImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'userType': _$UserTypeEnumMap[instance.userType]!,
      'birthDate': instance.birthDate?.toIso8601String(),
      'profilePictureUrl': instance.profilePictureUrl,
      'nickNames': instance.nickNames,
      'phone': instance.phone,
      'stars': instance.stars,
      'fcmToken': instance.fcmToken,
    };

const _$UserTypeEnumMap = {
  UserType.reporter: 'reporter',
  UserType.visitor: 'visitor',
};
