import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';

abstract class CardRepo {
  Future<void> createCard({required CreateCardParam cardParam});

  Future<void> editCard({required EditCardParam cardParam});

  Future<List<CardEntity>> fetchCards({required String collectionId});

  Future<void> shareCollection(
      {required String collectionId, required String collectionName});

  Future<void> importExcel(
      {required String path,
      required String collectionId,
      required String collectionName});

  Future<void> createSharedCards(
      {required String collectionId, required String sender});

  Future<void> deleteCards(
      {required List<String> cardsToDelete, required String collectionId});

  Future<void> swipeCard({required CardEntity cardEntity});
}
