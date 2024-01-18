part of 'cards_bloc.dart';

@freezed
class CardsState with _$CardsState {
  const CardsState._();

  List<CardEntity>? get cardsList => maybeMap(
      initial: (state) => state.cardsList,
      orElse: () {
        return null;
      });
  const factory CardsState.initial({required List<CardEntity>? cardsList}) = _Initial;
  const factory CardsState.viewIndividualCard() = _ViewIndividualCard;
  const factory CardsState.loading() = _Loading;
}
