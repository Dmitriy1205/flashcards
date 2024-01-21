part of 'web_list_bloc.dart';

@freezed
class WebListEvent with _$WebListEvent {
  const factory WebListEvent.fetchAllCollection() = _FetchAllCollection;
  const factory WebListEvent.createCollection({required String name}) =
  _CreateCollection;
  const factory WebListEvent.editCollection({required bool isEdit}) =
  _EditCollection;
  const factory WebListEvent.deleteCollection({required List<String> collectionsList}) =
  _DeleteCollection;
  const factory WebListEvent.updateCollection({required String collectionId, required String name}) =
  _UpdateCollection;
}
