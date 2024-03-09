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
          .collection(FirestoreCollections.pdfs)
          .get();
      return snap.docs
          .map((e) => CollectionPdfEntity.fromJson(e.data()))
          .toList();
    }catch(e){
      throw BadRequestException(message: "Failed to find pdf files");
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
      bool fileSizeExceeded = filePaths.map((e) => File(e)).any((e) => e.lengthSync() > _maxBytes);
      if(fileSizeExceeded){
        throw BadRequestException(message: "File is too big, maximum 5 mb");
      }
      for (var path in filePaths) {
        await _storage.ref("$storagePath/${extractFilename(path)}").putFile(
            File(path), SettableMetadata(contentType: "application/pdf"));
      }
      //Delete old pdf
      final oldPdfs = await _db
          .collection(FirestoreCollections.users)
          .doc(userUid)
          .collection(FirestoreCollections.pdfs)
          .get();
      for (var element in oldPdfs.docs) {
        final pdf = CollectionPdfEntity.fromJson(element.data());
        await _storage.ref(pdf.path).delete();
        await _db
            .collection(FirestoreCollections.users)
            .doc(userUid)
            .collection(FirestoreCollections.pdfs)
            .doc(element.id)
            .delete();
      }
      //Create new pdfs
      for (var path in filePaths) {
        final doc = _db
            .collection(FirestoreCollections.users)
            .doc(userUid)
            .collection(FirestoreCollections.pdfs)
            .doc();
        await doc.set(CollectionPdfEntity.createFirestoreDocument(
            docId: doc.id, path: "$storagePath/${extractFilename(path)}"));
      }
    }catch(e){
      throw BadRequestException(message: "Failed to upload pdf");
    }
  }

  const CollectionPdfServiceImpl({
    required FirebaseFirestore db,
    required FirebaseStorage storage,
  })  : _db = db,
        _storage = storage;
}