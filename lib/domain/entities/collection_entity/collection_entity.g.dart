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
      cards: json['cards'] as int?,
      createdAt: FirebaseTimestampConverters.fromTimestamp(json['createdAt']),
    );

Map<String, dynamic> _$$CollectionEntityImplToJson(
        _$CollectionEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'collectionName': instance.collectionName,
      'cards': instance.cards,
      'createdAt': instance.createdAt.toIso8601String(),
    };
