part of 'cards_bloc.dart';

@freezed
class CardsEvent with _$CardsEvent {
  const factory CardsEvent.started() = _Started;

  const factory CardsEvent.selectCard() = _SelectCard;

  const factory CardsEvent.editCard() = _EditCard;

  const factory CardsEvent.selectProfile() = _SelectProfile;

  const factory CardsEvent.deleteSelectedCards() = _DeleteSelectedCards;

  const factory CardsEvent.createNewCard(
      {required String front, required String back}) = _CreateNewCard;
}
