part of 'cards_bloc.dart';

@freezed
class CardsState with _$CardsState {
  const factory CardsState.initial() = _Initial;
  const factory CardsState.viewIndividualCard() = _ViewIndividualCard;
  const factory CardsState.viewProfile() = _ViewProfile;
}
