import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_entity.freezed.dart';

part 'card_entity.g.dart';

@freezed
class CardEntity with _$CardEntity {

  factory CardEntity({
    required String id,
    required String front,
    required String back,
    List<String>? frontImages,
    List<String>? backImages,
  }) = _CardEntity;


  factory CardEntity.fromJson(Map<String, String> json) =>
      _$CardEntityFromJson(json);
}