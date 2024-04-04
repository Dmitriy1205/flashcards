part of 'full_card_bloc.dart';

@freezed
class FullCardState with _$FullCardState {
  const FullCardState._();

  bool get isLoaded => maybeMap(
      loaded: (_) => true,
      orElse: () => false);

  FullCardEntity? get card => maybeMap(
      loaded: (state) => state.card,
      orElse: () => null);

  const factory FullCardState.initial() = _InitialState;
  const factory FullCardState.loaded({required FullCardEntity card}) = _LoadedState;
}
