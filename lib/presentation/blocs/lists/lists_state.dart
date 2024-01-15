part of 'lists_bloc.dart';

@freezed
class ListsState with _$ListsState {
  const factory ListsState.initial() = _Initial;

  const factory ListsState.viewCards({required CollectionEntity collection}) =
      _ViewCards;

  const factory ListsState.loading() = _Loading;

  const factory ListsState.viewCollections(
      {required List<CollectionEntity> collectionsList,
      required bool isEditMode,
      required List<String> listToDelete}) = _ViewCollections;
}
