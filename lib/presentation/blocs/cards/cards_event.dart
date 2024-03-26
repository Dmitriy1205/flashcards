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

  const factory CardsEvent.createSharedCards(
      {required String collectionId,
        required String sender}) = _CreateSharedCards;

  const factory CardsEvent.importExcel(
      {required String path, required String collectionId, required String collectionName}) = _ImportExcel;

  const factory CardsEvent.moveCards(
      {required List<CardEntity> cards, required String fromCollectionId, required String toCollectionId}) = _MoveCards;

  const factory CardsEvent.copyCards(
      {required List<CardEntity> cards, required String toCollectionId}) = _CopyCards;

  const factory CardsEvent.shareCollection(
      {required String collectionId,
      required String collectionName}) = _ShareCard;

  const factory CardsEvent.emptyCardsList() = _EmptyCardsList;

  const factory CardsEvent.swipeCard({required CardEntity cardEntity}) = _SwipeCard;

  const factory CardsEvent.finishLearn() = _FinishLearn;

}
