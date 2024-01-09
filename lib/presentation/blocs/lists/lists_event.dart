part of 'lists_bloc.dart';

@freezed
class ListsEvent with _$ListsEvent {
  const factory ListsEvent.started() = _Started;

  const factory ListsEvent.selectCollection(
      {required String collectionsListName}) = _SelectCollection;


  const factory ListsEvent.createNewList({required String name}) =
      _CreateNewList;

  const factory ListsEvent.deleteSelectedCollection() =
      _DeleteSelecteCollection;
}
