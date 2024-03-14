import 'package:bloc/bloc.dart';
import 'package:flashcards/core/exceptions/exceptions.dart';
import 'package:flashcards/core/utils/extract_filename.dart';
import 'package:flashcards/core/utils/files.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/collection_pdf_entity/collection_pdf_entity.dart';
import '../../../domain/entities/edit_collection_pdf/edit_collection_pdf_entity.dart';
import '../../../domain/repositories/collection_pdf_repo/collection_pdf_repo_contract.dart';

part 'collection_pdf_event.dart';

part 'collection_pdf_state.dart';

part 'collection_pdf_bloc.freezed.dart';

class CollectionPdfBloc extends Bloc<CollectionPdfEvent, CollectionPdfState> {
  final CollectionPdfRepo collectionPdfRepo;

  CollectionPdfBloc({required this.collectionPdfRepo})
      : super(const CollectionPdfState.initial()) {
    on<CollectionPdfEvent>(_mapEventToState);
  }

  Future<void> _mapEventToState(CollectionPdfEvent event,
      Emitter<CollectionPdfState> emit) =>
      event.map(
          downloadPdf: (e) => _downloadPdf(e, emit),
          fetchPdfs: (e) => _fetchPdfs(e, emit),
          removePdf: (e) => _removePdf(e, emit),
          addPdf: (e) => _addPdf(e, emit),
          savePdf: (e) => _savePdf(e, emit));

  Future<void> _fetchPdfs(_FetchPdfsEvent event,
      Emitter<CollectionPdfState> emit) async {
    try {
      final pdfs = await collectionPdfRepo.listCollectionPdfs(
          collectionId: event.collectionUid, userUid: event.userUid);
      emit(CollectionPdfState.loaded(
          pdfs: pdfs,
          pathsDownloaded: await _getDownloadedFilePaths(pdfs),
          pathsDownloading: []));
    } on LocalizedException catch (e) {
      emit(CollectionPdfState.error(message: e));
    }
  }

  Future<List<String>> _getDownloadedFilePaths(
      List<CollectionPdfEntity> pdfs) async {
    final areDownloaded = await Stream.fromIterable(
        pdfs.map((e) => isFileDownloaded(extractFilename(e.path))))
        .asyncMap((event) => event)
        .toList();
    List<String> downloadedPaths = [];
    for (int i = 0; i < pdfs.length; i++) {
      if (areDownloaded[i]) {
        downloadedPaths.add(pdfs[i].path);
      }
    }
    return downloadedPaths;
  }

  Future<void> _downloadPdf(_DownloadPdfEvent event,
      Emitter<CollectionPdfState> emit) async {
    final pdfs = state.maybeMap(
        loaded: (state) => state.pdfs, orElse: () => <CollectionPdfEntity>[])
        .toList();
    emit(CollectionPdfState.loaded(
        pdfs: pdfs,
        pathsDownloading: [event.path, ...state.pathsDownloading],
        pathsDownloaded: state.pathsDownloaded));
    await downloadFile(event.path);
    emit(CollectionPdfState.loaded(pdfs: pdfs,
        pathsDownloading: state.pathsDownloading.where((e) => e != event.path)
            .toList(),
        pathsDownloaded: [event.path,...state.pathsDownloaded]));
  }

  Future<void> _removePdf(_RemovePdfEvent event,
      Emitter<CollectionPdfState> emit) async {
    final pdfs = state.maybeMap(
        loaded: (state) =>
            state.pdfs
                .map((e) =>
                EditCollectionPdfEntity(remoteCollectionPath: e.path))
                .toList(),
        editing: (state) => state.pdfs,
        orElse: () => <EditCollectionPdfEntity>[]);
    final newPdfs = pdfs.where((e) => e.path != event.pathToRemove).toList();
    emit(CollectionPdfState.editing(pdfs: newPdfs));
  }

  Future<void> _addPdf(_AddPdfEvent event,
      Emitter<CollectionPdfState> emit) async {
    final pdfs = state.maybeMap(
        loaded: (state) =>
            state.pdfs
                .map((e) =>
                EditCollectionPdfEntity(remoteCollectionPath: e.path))
                .toList(),
        editing: (state) => state.pdfs,
        orElse: () => <EditCollectionPdfEntity>[]);
    final newPdfs = [
      EditCollectionPdfEntity(localPath: event.pathToAdd),
      ...pdfs
    ];
    emit(CollectionPdfState.editing(pdfs: newPdfs));
  }

  Future<void> _savePdf(_SavePdfEvent event,
      Emitter<CollectionPdfState> emit) async {
    try {
      final paths = state.paths;
      emit(CollectionPdfState.initial());
      await collectionPdfRepo.setPdfFiles(
          collectionId: event.collectionUid,
          filePaths: paths,
          userUid: event.userUid);
      final pdfs = await collectionPdfRepo.listCollectionPdfs(
          collectionId: event.collectionUid, userUid: event.userUid);
      emit(CollectionPdfState.saved(pdfs: pdfs));
      add(CollectionPdfEvent.fetchPdfs(userUid: event.userUid, collectionUid: event.collectionUid));
    } on LocalizedException catch (e) {
      emit(CollectionPdfState.error(message: e));
    }
  }
}
