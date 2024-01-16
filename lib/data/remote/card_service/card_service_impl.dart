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
  Future<void> deleteCards(
      {required String collectionId,
      required List<String> cardsToDelete}) async {
    try {
      final cards = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(collectionId)
          .collection(FirestoreCollections.cards);

      for (int i = 0; i < cardsToDelete.length; i++) {
        await cards.doc(cardsToDelete[i]).delete();
      }
    } catch (e) {
      throw Exception("Exception deleteCards $e");
    }
  }

  @override
  Future<void> editCard({required EditCardParam cardParam}) async {
    try {
      final cards =  _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(cardParam.collectionId)
          .collection(FirestoreCollections.cards);

      await cards.doc(cardParam.id).update({
        'back': cardParam.back,
        'front': cardParam.front,
      });
    } catch (e) {
      throw Exception("Exception deleteCards $e");
    }
  }

  @override
  Future<List<CardEntity>> fetchCards({required String collectionId}) async {
    try {
      final cards = await _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(collectionId)
          .collection(FirestoreCollections.cards)
          .get();
      List<CardEntity> collectionList =
          cards.docs.map((card) => CardEntity.fromJson(card.data())).toList();
      collectionList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return collectionList;
    } catch (e) {
      throw Exception("Exception fetchCards $e");
    }
  }
}
