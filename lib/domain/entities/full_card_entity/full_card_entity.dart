import 'package:flashcards/domain/entities/card_entity/card_entity.dart';

class FullCardEntity{
  final CardEntity card;
  final String? base64FrontImage;
  final String? base64BackImage;

  const FullCardEntity({
    required this.card,
    this.base64FrontImage,
    this.base64BackImage,
  });
}