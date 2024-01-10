part of 'cards_bloc.dart';

@freezed
class CardsEvent with _$CardsEvent {

  const factory CardsEvent.editCard({required CardEntity card}) = _EditCard;

  const factory CardsEvent.deleteSelectedCards() = _DeleteSelectedCards;

  const factory CardsEvent.createNewCard(
      {required String front, required String back}) = _CreateNewCard;
}
