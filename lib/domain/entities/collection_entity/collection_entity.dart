import 'package:flashcards/core/utils/firebase_time_stamp_converter.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'collection_entity.freezed.dart';

part 'collection_entity.g.dart';

@freezed
class CollectionEntity with _$CollectionEntity {
  factory CollectionEntity({
    required String id,
    required String collectionName,
    List<CardEntity>? cards,
    @JsonKey(
        fromJson: FirebaseTimestampConverters.fromTimestamp)
    required DateTime? createdAt,
  }) = _CollectionEntity;

  factory CollectionEntity.fromJson(Map<String, dynamic> json) =>
      _$CollectionEntityFromJson(json);
}
