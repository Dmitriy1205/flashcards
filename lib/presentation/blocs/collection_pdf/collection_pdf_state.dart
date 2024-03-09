part of 'collection_pdf_bloc.dart';

@freezed
class CollectionPdfState with _$CollectionPdfState {
  const CollectionPdfState._();

  List<String> get paths => maybeMap(
      editing: (state) => state.pdfs.map((e) => e.path).toList(),
      loaded: (state) => state.pdfs.map((e) => e.path).toList(),
      orElse: () => []);

  bool get isLoading => maybeMap(
      initial: (_) => true,
      orElse: () => false);

  bool get isEditing => maybeMap(
      editing: (_) => true,
      orElse: () => false);

  bool get isSaved => maybeMap(
      saved: (_) => true,
      orElse: () => false);

  List<String> get pathsDownloading => maybeMap(
      loaded: (state) => state.pathsDownloading,
      orElse: () => []);

  List<String> get pathsDownloaded => maybeMap(
      loaded: (state) => state.pathsDownloaded,
      orElse: () => []);

  const factory CollectionPdfState.initial() = _InitialState;
  const factory CollectionPdfState.loaded({required List<CollectionPdfEntity> pdfs, required List<String> pathsDownloading, required List<String> pathsDownloaded}) = _LoadedState;
  const factory CollectionPdfState.editing({required List<EditCollectionPdfEntity> pdfs}) = _EditingState;
  const factory CollectionPdfState.saved({required List<CollectionPdfEntity> pdfs}) = _SavedState;
  const factory CollectionPdfState.error({required String message}) = _ErrorState;
}
