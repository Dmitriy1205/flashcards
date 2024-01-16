// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserEntityImpl _$$UserEntityImplFromJson(Map<String, dynamic> json) =>
    _$UserEntityImpl(
      id: json['id'] as String,
      createdAt: FirebaseTimestampConverters.fromTimestamp(json['createdAt']),
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      email: json['email'] as String,
      userPhoto: json['userPhoto'] as String,
      collections: (json['collections'] as List<dynamic>)
          .map((e) => CollectionEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserEntityImplToJson(_$UserEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt':
          FirebaseTimestampConverters.toTimestampString(instance.createdAt),
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'userPhoto': instance.userPhoto,
      'collections': instance.collections,
    };
