import 'package:flashcards/core/utils/firebase_time_stamp_converter.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  factory UserEntity({
    required String id,
    @JsonKey(
        fromJson: FirebaseTimestampConverters.fromTimestamp,
        toJson: FirebaseTimestampConverters.toTimestampString)
    required DateTime createdAt,
    required String firstName,
    required String lastName,
    required String email,
    required String userPhoto,
    required List<CollectionEntity> collections,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, String> json) =>
      _$UserEntityFromJson(json);
}
