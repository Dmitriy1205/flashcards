part of 'collection_pdf_bloc.dart';

@freezed
class CollectionPdfEvent with _$CollectionPdfEvent {
  const factory CollectionPdfEvent.downloadPdf({required String path}) = _DownloadPdfEvent;
  const factory CollectionPdfEvent.fetchPdfs({required String userUid, required String collectionUid}) = _FetchPdfsEvent;
  const factory CollectionPdfEvent.removePdf({required String userUid, required String collectionUid, required String pathToRemove}) = _RemovePdfEvent;
  const factory CollectionPdfEvent.addPdf({required String userUid, required String collectionUid, required String pathToAdd}) = _AddPdfEvent;
  const factory CollectionPdfEvent.savePdf({required String userUid, required String collectionUid}) = _SavePdfEvent;
}
