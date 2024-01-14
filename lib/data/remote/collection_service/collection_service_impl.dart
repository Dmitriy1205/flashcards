import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/data/remote/collection_service/collection_service_contract.dart';
import 'package:flashcards/data/remote/empty.dart';
import 'package:flashcards/domain/entities/collection_entity/collection_entity.dart';

class CollectionServiceImpl extends CollectionServiceContract {
  CollectionServiceImpl(
      {required FirebaseFirestore fireStore,
      required FirebaseStorage firebaseStorage,
      required FirebaseAuth firebaseAuth})
      : _firebaseStorage = firebaseStorage,
        _fireStore = fireStore,
        _firebaseAuth = firebaseAuth;

  final FirebaseFirestore _fireStore;
  final FirebaseStorage _firebaseStorage;
  final FirebaseAuth _firebaseAuth;

  @override
  Future<void> createCollection({required String collectionName}) async {
    print("createCollection $collectionName");

    final doc = _fireStore
        .collection(FirestoreCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(FirestoreCollections.collections)
        .doc();
    doc.set({
      "collectionName": collectionName,
      "id": doc.id,
      "createdAt": FieldValue.serverTimestamp()
    });
  }

  @override
  Future<void> deleteCollections(
      {required List<CollectionEntity> collectionsList}) {
    // TODO: implement deleteCollections
    throw UnimplementedError();
  }

  @override
  Future<List<CollectionEntity>> fetchCollections() async {
    try {
      final collections = await _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .get();
      print("data adsads ${collections.docs}");
      List<CollectionEntity> collectionList = collections.docs
          .map((collection) => CollectionEntity.fromJson(collection.data()))
          .toList();
      print('collectionList $collectionList');


      return collectionList;
      // final CollectionEntity collections = CollectionEntity.fromJson(data);
    } catch (e) {
      throw Exception("Exception fetchCollections $e");
    }
  }
}
