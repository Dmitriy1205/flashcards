// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardEntityImpl _$$CardEntityImplFromJson(Map<String, dynamic> json) =>
    _$CardEntityImpl(
      id: json['id'] as String,
      collectionId: json['collectionId'] as String,
      collectionName: json['collectionName'] as String,
      front: (json['front'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      back: (json['back'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      isLearned: json['isLearned'] as bool? ?? false,
      createdAt: FirebaseTimestampConverters.fromTimestamp(json['createdAt']),
      sharedFrom: json['sharedFrom'] as String?,
      shareWithId: (json['shareWithId'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      frontImage: json['frontImage'] as String?,
      backImage: json['backImage'] as String?,
    );

Map<String, dynamic> _$$CardEntityImplToJson(_$CardEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionId': instance.collectionId,
      'collectionName': instance.collectionName,
      'front': instance.front,
      'back': instance.back,
      'isLearned': instance.isLearned,
      'createdAt': instance.createdAt?.toIso8601String(),
      'sharedFrom': instance.sharedFrom,
      'shareWithId': instance.shareWithId,
      'frontImage': instance.frontImage,
      'backImage': instance.backImage,
    };
