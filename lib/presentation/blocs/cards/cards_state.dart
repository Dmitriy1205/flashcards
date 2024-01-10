part of 'cards_bloc.dart';

@freezed
class CardsState with _$CardsState {
  const factory CardsState.initial({required List<Map<String, dynamic>>? cardsList}) = _Initial;
  const factory CardsState.viewIndividualCard() = _ViewIndividualCard;
  const factory CardsState.loading() = _Loading;
}
