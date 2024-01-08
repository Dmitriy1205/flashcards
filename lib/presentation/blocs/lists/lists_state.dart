part of 'lists_bloc.dart';

@freezed
class ListsState with _$ListsState {
  const factory ListsState.initial() = _Initial;
  const factory ListsState.viewCards() = _ViewCards;
  const factory ListsState.viewIndividualCard() = _ViewIndividualCard;
  const factory ListsState.viewProfile() = _ViewProfile;
  const factory ListsState.newList() = _NewList;
  const factory ListsState.viewCollections() = _ViewCollections;
}
