import 'package:flashcards/domain/entities/card_entity/card_entity.dart';

class FullCardEntity{
  final CardEntity card;
  late final String? base64FrontImage;
  late final String? base64BackImage;

  FullCardEntity({
    required this.card,
    String? base64FrontImage,
    String? base64BackImage,
  }){
    this.base64FrontImage = base64FrontImage == null || base64FrontImage.isEmpty ? null : base64FrontImage;
    this.base64BackImage = base64BackImage == null || base64BackImage.isEmpty ? null : base64BackImage;
  }
}