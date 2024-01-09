part of 'lists_bloc.dart';

@freezed
class ListsState with _$ListsState {
  const factory ListsState.initial() = _Initial;

  const factory ListsState.viewCards({required String collectionsListName}) =
      _ViewCards;

  const factory ListsState.newList() = _NewList;

  const factory ListsState.viewCollections() = _ViewCollections;
}
