import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/data/remote/collection_service/collection_service_contract.dart';
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
    final doc = _fireStore
        .collection(FirestoreCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(FirestoreCollections.collections)
        .doc();
    await doc.set({
      "collectionName": collectionName,
      "id": doc.id,
      "createdAt": FieldValue.serverTimestamp()
    });
  }

  @override
  Future<void> deleteCollections(
      {required List<String> collectionsListToDelete}) async {
    try {
      final collections = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections);
      for (int i = 0; i < collectionsListToDelete.length; i++) {
        await collections.doc(collectionsListToDelete[i]).delete();
      }
    } catch (e) {
      throw Exception("Exception deleteCollections $e");
    }
  }

  @override
  Future<List<CollectionEntity>> fetchCollections() async {
    try {
      final collections = await _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .get();
      List<CollectionEntity> collectionList = collections.docs
          .map((collection) => CollectionEntity.fromJson(collection.data()))
          .toList();
      collectionList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      for (int i = 0; i < collectionList.length; i++) {
        final int count = await getCardsCount(collectionList[i].id);
        collectionList[i] = collectionList[i].copyWith(cards: count);
      }
      return collectionList;
    } catch (e) {
      throw Exception("Exception fetchCollections $e");
    }
  }

  Future<int> getCardsCount(String collectionId) async {
    final cards = await _fireStore
        .collection(FirestoreCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(FirestoreCollections.collections)
        .doc(collectionId)
        .collection(FirestoreCollections.cards)
        .get();
    final int count = cards.size;
    return count;
  }
}
