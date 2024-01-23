part of 'web_list_bloc.dart';

@freezed
class WebListState with _$WebListState {
  const WebListState._();

  List<CollectionEntity>? get collectionsList => maybeMap(
      loaded: (state) => state.collectionsList,
      orElse: () {
        return null;
      });

  bool get isEdit => maybeMap(
      loaded: (state) => state.isEdit,
      orElse: () {
        return false;
      });
  const factory WebListState.initial() = _Initial;
  const factory WebListState.loading() = _Loading;
  const factory WebListState.loaded({required List<CollectionEntity>? collectionsList,required bool isEdit,}) = _Loaded;
  const factory WebListState.error({required String error}) = _Error;
}
