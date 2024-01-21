import 'package:flashcards/data/remote/card_service/card_service_contract.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:flashcards/domain/repositories/cards_repo/card_repo_contract.dart';

class CardRepoImpl extends CardRepo {
  CardRepoImpl({required this.cardService});

  CardService cardService;

  @override
  Future<void> createCard({required CreateCardParam cardParam}) async {
    await cardService.createCard(cardParam: cardParam);
  }

  @override
  Future<void> editCard({required EditCardParam cardParam}) async {
    await cardService.editCard(cardParam: cardParam);
  }

  @override
  Future<void> shareCollection({required  String collectionId,
    required String collectionName}) async {
    await cardService.shareCollection(collectionId: collectionId, collectionName: collectionName);
  }

  @override
  Future<void> deleteCards(
      {required String collectionId,
        required List<String> cardsToDelete}) async {
    await cardService.deleteCards(
        collectionId: collectionId, cardsToDelete: cardsToDelete);
  }

  @override
  Future<List<CardEntity>> fetchCards({required String collectionId}) async {
    return await cardService.fetchCards(collectionId: collectionId);
  }
}
