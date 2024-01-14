import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_entity.freezed.dart';

part 'collection_entity.g.dart';

@freezed
class CollectionEntity with _$CollectionEntity {
  factory CollectionEntity({
    required String id,
    required DateTime createdAt,
    required String collectionName,
    required List<CardEntity> cards,
  }) = _CollectionEntity;

  factory CollectionEntity.fromJson(Map<String, String> json) =>
      _$CollectionEntityFromJson(json);
}
