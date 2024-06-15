// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionEntityImpl _$$CollectionEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionEntityImpl(
      id: json['id'] as String,
      collectionName: json['collectionName'] as String,
      cardsCount: json['cardsCount'] as int? ?? 0,
      createdAt: FirebaseTimestampConverters.fromTimestamp(json['createdAt']),
    );

Map<String, dynamic> _$$CollectionEntityImplToJson(
        _$CollectionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionName': instance.collectionName,
      'cardsCount': instance.cardsCount,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
