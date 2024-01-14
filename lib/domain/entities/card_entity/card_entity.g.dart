// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardEntityImpl _$$CardEntityImplFromJson(Map<String, dynamic> json) =>
    _$CardEntityImpl(
      id: json['id'] as String,
      front: json['front'] as String,
      back: json['back'] as String,
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
      'front': instance.front,
      'back': instance.back,
      'frontImages': instance.frontImages,
      'backImages': instance.backImages,
    };
