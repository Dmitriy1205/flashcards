import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/core/const/storage_refs.dart';
import 'package:flashcards/core/exceptions/exceptions.dart';
import 'package:flashcards/core/utils/extract_filename.dart';
import 'package:flashcards/data/remote/collection_pdf_service/collection_pdf_service_contract.dart';
import 'package:flashcards/domain/entities/collection_pdf_entity/collection_pdf_entity.dart';

const int _maxBytes = 1024 * 1024 * 5;

class CollectionPdfServiceImpl implements CollectionPdfService {
  final FirebaseFirestore _db;
  final FirebaseStorage _storage;

  @override
  Future<List<CollectionPdfEntity>> listCollectionPdfs(
      {required String collectionId, required String userUid}) async {
    try{
      final snap = await _db
          .collection(FirestoreCollections.users)
          .doc(userUid)
          .collection(FirestoreCollections.collections)
          .doc(collectionId)
          .collection(FirestoreCollections.pdfs)
          .get();
      return snap.docs
          .map((e) => CollectionPdfEntity.fromJson(e.data()))
          .toList();
    }catch(e){
      throw LocalizedException(message: "Failed to find pdf files", localizationKey: 'failed-find-pdfs');
    }
  }

  @override
  Future<void> setPdfFiles(
      {required String collectionId,
      required List<String> filePaths,
      required String userUid}) async {
    try{
      String storagePath = StorageRefs.collectionPdfs(
          userUid: userUid, collectionId: collectionId);
      //Upload pdfs
      final localFilesPaths = filePaths.where((e) => !e.startsWith("users/")).toList();
      final remoteFilesPaths = filePaths.where((e) => e.startsWith("users/")).toList();
      final remoteFilesNames = remoteFilesPaths.map((e) => extractFilename(e)).toList();
      bool fileSizeExceeded = localFilesPaths.map((e) => File(e)).any((e) => e.lengthSync() > _maxBytes);
      if(fileSizeExceeded){
        throw LocalizedException(message: "File is too big, maximum 5 mb", localizationKey: 'max-file-size-5mb');
      }
      //Delete old pdf
      final oldPdfs = await _db
          .collection(FirestoreCollections.users)
          .doc(userUid)
          .collection(FirestoreCollections.collections)
          .doc(collectionId)
          .collection(FirestoreCollections.pdfs)
          .get();

      for (var element in oldPdfs.docs) {
        if(remoteFilesNames.contains(extractFilename(element.data()["path"]))){
          continue;
        }
        final pdf = CollectionPdfEntity.fromJson(element.data());
        _storage.ref(pdf.path).delete();
        await _db
            .collection(FirestoreCollections.users)
            .doc(userUid)
            .collection(FirestoreCollections.collections)
            .doc(collectionId)
            .collection(FirestoreCollections.pdfs)
            .doc(element.id)
            .delete();
      }

      for (var path in localFilesPaths) {
        await _storage.ref("$storagePath/${extractFilename(path)}").putFile(
            File(path), SettableMetadata(contentType: "application/pdf"));
        final doc = _db
            .collection(FirestoreCollections.users)
            .doc(userUid)
            .collection(FirestoreCollections.collections)
            .doc(collectionId)
            .collection(FirestoreCollections.pdfs)
            .doc();
        await doc.set(CollectionPdfEntity.createFirestoreDocument(
            docId: doc.id, path: "$storagePath/${extractFilename(path)}"));
      }
    }catch(e){
      throw LocalizedException(message: "Failed to upload pdf", localizationKey: 'failed-upload-pdf');
    }
  }

  const CollectionPdfServiceImpl({
    required FirebaseFirestore db,
    required FirebaseStorage storage,
  })  : _db = db,
        _storage = storage;
}
