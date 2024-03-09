import 'package:flashcards/core/utils/firebase_time_stamp_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_entity.freezed.dart';

part 'card_entity.g.dart';

@freezed
class CardEntity with _$CardEntity {
  factory CardEntity({
    required String id,
    required String collectionId,
    required String collectionName,
    required List<Map<String, dynamic>> front,
    required List<Map<String, dynamic>> back,
    @Default(false) bool isLearned,
    @JsonKey(fromJson: FirebaseTimestampConverters.fromTimestamp)
    required DateTime? createdAt,
    final String? sharedFrom,
    final List<String>? shareWithId,
    final String? frontImage,
    final String? backImage,
  }) = _CardEntity;

  factory CardEntity.fromJson(Map<String, dynamic> json) =>
      _$CardEntityFromJson(json);
  // {
  //   return CardEntity(
  //     id: json['id'] as String? ?? '',
  //     collectionId: json['collectionId'] as String? ?? '',
  //     collectionName: json['collectionName'] as String? ?? '',
  //     front: json['front'] as String? ?? '',
  //     back: json['back'] as String? ?? '',
  //     createdAt: json['createdAt'] != null
  //         ? FirebaseTimestampConverters.fromTimestamp(json['createdAt'])
  //         : DateTime.now(),
  //     sharedFrom: json['sharedFrom'] as String?,  // Allow null value
  //     shareWithId: (json['shareWithId'] as List<dynamic>?)?.cast<String>(),  // Allow null value
  //     frontImages: (json['frontImages'] as List<dynamic>?)?.cast<String>(),  // Allow null value
  //     backImages: (json['backImages'] as List<dynamic>?)?.cast<String>(),  // Allow null value
  //   );
  // }

}
