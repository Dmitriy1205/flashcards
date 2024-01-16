part of 'lists_bloc.dart';

@freezed
class ListsEvent with _$ListsEvent {
  const factory ListsEvent.started(
      {required bool isEditMode}) = _Started;

  const factory ListsEvent.selectCollection(
      {required CollectionEntity collection}) = _SelectCollection;

  const factory ListsEvent.createNewList({required String name}) =
      _CreateNewList;

  const factory ListsEvent.deleteSelectedCollection({required List<CollectionEntity> collectionsList}) =
      _DeleteSelecteCollection;
}
