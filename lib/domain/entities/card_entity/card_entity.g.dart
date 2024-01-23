// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardEntityImpl _$$CardEntityImplFromJson(Map<String, dynamic> json) =>
    _$CardEntityImpl(
      id: json['id'] as String?,
      collectionId: json['collectionId'] as String?,
      collectionName: json['collectionName'] as String?,
      front: json['front'] as String?,
      back: json['back'] as String?,
      createdAt: FirebaseTimestampConverters.fromTimestamp(json['createdAt']),
      sharedFrom: json['sharedFrom'] as String?,
      shareWithId: (json['shareWithId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      frontImages: (json['frontImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      backImages: (json['backImages'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$CardEntityImplToJson(_$CardEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'front': instance.front,
      'back': instance.back,
      'createdAt': instance.createdAt?.toIso8601String(),
      'sharedFrom': instance.sharedFrom,
      'shareWithId': instance.shareWithId,
      'frontImages': instance.frontImages,
      'backImages': instance.backImages,
    };
