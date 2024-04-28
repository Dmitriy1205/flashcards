part of 'lists_bloc.dart';

@freezed
class ListsState with _$ListsState {
  const ListsState._();

  List<CollectionEntity>? get collectionsList => maybeMap(
      viewCollections: (state) => state.collectionsList,
      orElse: () {
        return null;
      });

  bool? get isEditMode => maybeMap(
      viewCollections: (state) => state.isEditMode,
      orElse: () {
        return false;
      });

  List<String>? get listToDelete => maybeMap(
      viewCollections: (state) => state.listToDelete,
      orElse: () {
        return [];
      });

  const factory ListsState.initial() = _Initial;

  const factory ListsState.viewCards({required CollectionEntity collection}) =
      _ViewCards;

  const factory ListsState.loading() = _Loading;

  const factory ListsState.operationSucceeded() = _OperationSucceeded;

  const factory ListsState.viewCollections(
      {required List<CollectionEntity> collectionsList,
      required bool isEditMode,
      required List<String> listToDelete}) = _ViewCollections;

  const factory ListsState.error({required String error}) = _Error;

}
