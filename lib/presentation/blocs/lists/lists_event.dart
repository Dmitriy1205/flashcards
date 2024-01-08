part of 'lists_bloc.dart';

@freezed
class ListsEvent with _$ListsEvent {
  const factory ListsEvent.started() = _Started;

  const factory ListsEvent.selectCollection() = _SelectCollection;

  const factory ListsEvent.selectCard() = _SelectCard;

  const factory ListsEvent.editCard() = _EditCard;

  const factory ListsEvent.selectProfile() = _SelectProfile;

  const factory ListsEvent.deleteSelected() = _DeleteSelected;

  const factory ListsEvent.createNewList({required String name}) =
  _CreateNewList;
  const factory ListsEvent.deleteSelectedCollection() =
  _DeleteSelecteCollection;
}
