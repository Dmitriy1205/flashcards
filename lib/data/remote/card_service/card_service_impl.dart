import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/data/remote/card_service/card_service_contract.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';

class CardServiceImpl extends CardServiceContract {
  CardServiceImpl(
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
  Future<void> createCard({required CreateCardParam cardParam}) async {
    final doc = _fireStore
        .collection(FirestoreCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(FirestoreCollections.collections)
        .doc(cardParam.collectionId)
        .collection(FirestoreCollections.cards)
        .doc();
    await doc.set({
      "front": cardParam.front,
      "back": cardParam.back,
      "id": doc.id,
      "createdAt": FieldValue.serverTimestamp(),
      "collectionId": cardParam.collectionId
    });
  }

  @override
  Future<void> deleteCards({required List<String> cardsToDelete}) {
    // TODO: implement deleteCards
    throw UnimplementedError();
  }

  @override
  Future<void> editCard({required EditCardParam cardParam}) {
    // TODO: implement editCard
    throw UnimplementedError();
  }

  @override
  Future<List<CardEntity>> fetchCards({required String collectionId}) async {
    try {
      print('collectionId $collectionId');
      final collections = await _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(collectionId)
          .collection(FirestoreCollections.cards)
          .get();
      print('collections ${collections.docs[0].data()}');

      List<CardEntity> collectionList = collections.docs
          .map((card) => CardEntity.fromJson(card.data()))
          .toList();
      collectionList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      print('collectionList ${collectionList}');
      return collectionList;
    } catch (e) {
      throw Exception("Exception fetchCards $e");
    }
  }
}
