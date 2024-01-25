import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/core/const/strings.dart';
import 'package:flashcards/data/remote/card_service/card_service_contract.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:share_plus/share_plus.dart';

class CardServiceImpl extends CardService {
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
    late final String collectionName;
    try {
      final collections = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(cardParam.collectionId);

      final cards = collections.collection(FirestoreCollections.cards).doc();
      await collections.get().then((snapshot) {
        collectionName = snapshot.data()!['collectionName'].toString();
      });

      await cards.set({
        "front": cardParam.front,
        "back": cardParam.back,
        "id": cards.id,
        "collectionName": collectionName,
        "createdAt": FieldValue.serverTimestamp(),
        "collectionId": cardParam.collectionId
      });
    } on FirebaseException  catch (e) {
      throw Exception("Exception createCard $e");
    }
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
    }  on FirebaseException catch (e) {
      throw Exception("Exception deleteCards $e");
    }
  }

  @override
  Future<void> editCard({required EditCardParam cardParam}) async {
    try {
      final cards = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(cardParam.collectionId)
          .collection(FirestoreCollections.cards);

      await cards.doc(cardParam.id).update({
        'back': cardParam.back,
        'front': cardParam.front,
      });
    }  on FirebaseException  catch (e) {
      throw Exception("Exception deleteCards $e");
    }
  }

  @override
  Future<void> shareCollection(
      {required String collectionId, required String collectionName}) async {
    collectionName = collectionName.replaceAll(' ', '%20');

    print(
      'https://flashcards-5984c.web.app/collection_share?sender=${_firebaseAuth.currentUser!.uid}&collectionId=${collectionId}&collectionName=${collectionName}',
    );
    final result = await Share.shareWithResult(
        'https://flashcards-5984c.web.app/collection_share?sender=${_firebaseAuth.currentUser!.uid}&collectionId=$collectionId&collectionName=$collectionName',
        subject: 'Look what I made!');

    if (result.status == ShareResultStatus.success) {
      print('status success');
      try {
        final shareCollection = _fireStore
            .collection(FirestoreCollections.collectionShare)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(collectionId);

        final collection = await _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(collectionId)
            .get();

        final cards = await fetchCards(collectionId: collectionId);

        if (collection.exists) {
          shareCollection.set(collection.data()!);
          for (int i = 0; i < cards.length; i++) {
            shareCollection.collection(FirestoreCollections.cards).add(cards[i]
                .copyWith(sharedFrom: _firebaseAuth.currentUser!.uid)
                .toJson());
          }
        }
      } on FirebaseException catch (e) {
        throw Exception("Exception createCard $e");
      }
    }
  }


  @override
  Future<void> createSharedCards(
      {required String collectionId, required String sender}) async {
    try {
      final sharedCollection = _fireStore
          .collection(FirestoreCollections.collectionShare)
          .doc(sender)
          .collection(FirestoreCollections.collections)
          .doc(collectionId);

      final collection = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(collectionId);

      await sharedCollection.get().then((value) => collection.set(value.data()!));
      await sharedCollection
          .collection(FirestoreCollections.cards)
          .get()
          .then((value) => value.docs.forEach((element) {
        collection
            .collection(AppStrings.cards.toLowerCase())
            .add(element.data());
      }));
    } on FirebaseException catch (e) {
      throw Exception("Exception createSharedCards $e");
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

      List<CardEntity> cardsList =
          cards.docs.map((card) => CardEntity.fromJson(card.data())).toList();
      cardsList.sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
      return cardsList;

    } catch (e) {
      throw Exception("Exception fetchCards $e");
    }
  }
}
