// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_pdf_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollectionPdfEntityImpl _$$CollectionPdfEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$CollectionPdfEntityImpl(
      id: json['id'] as String,
      path: json['path'] as String,
      createdAt: FirebaseTimestampConverters.fromTimestamp(json['createdAt']),
    );

Map<String, dynamic> _$$CollectionPdfEntityImplToJson(
        _$CollectionPdfEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'path': instance.path,
    };
