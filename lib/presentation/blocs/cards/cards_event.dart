part of 'cards_bloc.dart';

@freezed
class CardsEvent with _$CardsEvent {
  const factory CardsEvent.editCard(
      {required EditCardParam cardParam,
      required String collectionId}) = _EditCard;

  const factory CardsEvent.initCard({required String collectionId}) = _InitCard;

  const factory CardsEvent.deleteSelectedCards(
      {required List<String> cardsIdToDelete,
      required String collectionId}) = _DeleteSelectedCards;

  const factory CardsEvent.createNewCard(
      {required CreateCardParam cardParam,
      required String collectionId}) = _CreateNewCard;

  const factory CardsEvent.shareCollection({required String collectionId}) = _ShareCard;

  const factory CardsEvent.emptyCardsList() = _EmptyCardsList;
}
