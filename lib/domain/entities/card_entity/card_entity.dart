import 'package:flashcards/core/utils/firebase_time_stamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_entity.freezed.dart';

part 'card_entity.g.dart';

@freezed
class CardEntity with _$CardEntity {
  factory CardEntity({
    required String id,
    required String collectionId,
    required String front,
    required String back,
    @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
    required DateTime createdAt,
    final String? sharedFrom,
    final List<String>? shareWithId,
    final List<String>? frontImages,
    final List<String>? backImages,
  }) = _CardEntity;

  factory CardEntity.fromJson(Map<String, dynamic> json) =>
      _$CardEntityFromJson(json);
}
