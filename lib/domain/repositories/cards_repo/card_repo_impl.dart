import 'package:flashcards/data/remote/card_service/card_service_contract.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:flashcards/domain/repositories/cards_repo/card_repo_contract.dart';

class CardRepoImpl extends CardRepoContract {
  CardRepoImpl({required this.cardService});

  CardServiceContract cardService;

  @override
  Future<void> createCard({required CreateCardParam cardParam}) async {
    await cardService.createCard(cardParam: cardParam);
  }

  @override
  Future<void> editCard({required EditCardParam cardParam}) {
    // TODO: implement editCard
    throw UnimplementedError();
  }

  @override
  Future<void> deleteCards({required List<String> cardsToDelete}) {
    // TODO: implement deleteCards
    throw UnimplementedError();
  }

  @override
  Future<List<CardEntity>> fetchCards({required String collectionId}) async {
    return await cardService.fetchCards(collectionId: collectionId);
  }
}
