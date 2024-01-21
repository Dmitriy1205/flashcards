import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';

abstract class CardServiceContract {
  Future<void> createCard({required CreateCardParam cardParam});

  Future<void> editCard({required EditCardParam cardParam});

  Future<void> deleteCards(
      {required List<String> cardsToDelete, required String collectionId});

  Future<List<CardEntity>> fetchCards({required String collectionId});
}
