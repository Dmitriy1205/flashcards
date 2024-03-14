part of 'cards_bloc.dart';

@freezed
class CardsState with _$CardsState {
  const CardsState._();

  List<CardEntity>? get cardsList => maybeMap(
      loaded: (state) => state.cardsList,
      successfullyImported: (_) => [],
      orElse: () {
        return null;
      });

  const factory CardsState.loaded({required List<CardEntity>? cardsList}) =
      _Loaded;

  const factory CardsState.viewIndividualCard() = _ViewIndividualCard;

  const factory CardsState.loading() = _Loading;

  const factory CardsState.successfullyImported() = _SuccessfullyImported;

  const factory CardsState.error({required String error}) = _Error;

  const factory CardsState.finishLearning() = _FinishLearning;

}
