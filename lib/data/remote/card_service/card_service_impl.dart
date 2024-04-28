import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/core/exceptions/exceptions.dart';
import 'package:flashcards/data/remote/card_service/card_service_contract.dart';
import 'package:flashcards/domain/entities/card_entity/card_entity.dart';
import 'package:flashcards/domain/entities/full_card_entity/full_card_entity.dart';
import 'package:flashcards/domain/params/card_param/create_card_param.dart';
import 'package:flashcards/domain/params/card_param/edit_card_param.dart';
import 'package:share_plus/share_plus.dart';

class CardServiceImpl extends CardService {
  CardServiceImpl(
      {required FirebaseFirestore fireStore,
      required FirebaseStorage firebaseStorage,
      required FirebaseAuth firebaseAuth})
      : _fireStore = fireStore,
        _firebaseAuth = firebaseAuth;

  final FirebaseFirestore _fireStore;
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

      final batch = _fireStore.batch();

      batch.set(cards, {
        "front": cardParam.front,
        "back": cardParam.back,
        "id": cards.id,
        "collectionName": collectionName,
        "createdAt": FieldValue.serverTimestamp(),
        "collectionId": cardParam.collectionId,
      });

      if (cardParam.frontImages != null) {
        final frontImage =
            cards.collection(FirestoreCollections.images).doc("front");
        batch.set(frontImage, {"image": cardParam.frontImages});
      }

      if (cardParam.backImages != null) {
        final backImage =
            cards.collection(FirestoreCollections.images).doc("back");
        batch.set(backImage, {"image": cardParam.backImages});
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw Exception("Exception createCard $e");
    }
  }

  @override
  Future<void> deleteCards(
      {required String collectionId,
      required List<String> cardsToDelete}) async {
    try {
      final batch = _fireStore.batch();
      final cards = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(collectionId)
          .collection(FirestoreCollections.cards);

      for (int i = 0; i < cardsToDelete.length; i++) {
        final images = await cards
            .doc(cardsToDelete[i])
            .collection(FirestoreCollections.images)
            .get();
        for (int j = 0; j < images.size; j++) {
          batch.delete(images.docs[j].reference);
        }
        batch.delete(cards.doc(cardsToDelete[i]));
      }
      await batch.commit();
    } on FirebaseException catch (e) {
      throw Exception("Exception deleteCards $e");
    }
  }

  @override
  Future<void> editCard({required EditCardParam cardParam}) async {
    try {
      final card = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(cardParam.collectionId)
          .collection(FirestoreCollections.cards)
          .doc(cardParam.id);

      final batch = _fireStore.batch();

      batch.update(card, {
        'back': cardParam.back,
        'front': cardParam.front,
      });

      final frontImage =
          card.collection(FirestoreCollections.images).doc("front");
      final backImage =
          card.collection(FirestoreCollections.images).doc("back");

      if (cardParam.frontImages != null) {
        batch.update(frontImage, {"image": cardParam.frontImages});
      } else {
        batch.delete(frontImage);
      }

      if (cardParam.backImages != null) {
        batch.update(backImage, {"image": cardParam.backImages});
      } else {
        batch.delete(backImage);
      }

      await batch.commit();
    } on FirebaseException catch (e) {
      throw Exception("Exception deleteCards $e");
    }
  }

  @override
  Future<void> shareCollection(
      {required String collectionId, required String collectionName}) async {
    collectionName = collectionName.replaceAll(' ', '%20');
    final result = await Share.shareWithResult(
        'https://flashcards-5984c.web.app/collection_share?sender=${_firebaseAuth.currentUser!.uid}&collectionId=$collectionId&collectionName=$collectionName',
        subject: 'Look what I made!');

    if (result.status == ShareResultStatus.success) {
      try {
        final batch = _fireStore.batch();
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

        final pdfs = await _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(collectionId)
            .collection(FirestoreCollections.pdfs)
            .get();
        if (collection.exists) {
          shareCollection.set(collection.data()!);
          for (int i = 0; i < cards.length; i++) {
            batch.set(
                shareCollection.collection(FirestoreCollections.cards).doc(),
                cards[i]
                    .copyWith(sharedFrom: _firebaseAuth.currentUser!.uid)
                    .toJson());
          }
          for (int i = 0; i < pdfs.size; i++) {
            batch.set(
                shareCollection.collection(FirestoreCollections.pdfs).doc(),
                pdfs.docs[i].data());
          }
        }

        await batch.commit();
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

      await sharedCollection
          .get()
          .then((value) => collection.set(value.data()!));
      await sharedCollection
          .collection(FirestoreCollections.cards)
          .get()
          .then((value) => value.docs.forEach((element) {
                collection.collection('cards').add(element.data());
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

  @override
  Future<void> swipeCard({required CardEntity cardEntity}) async {
    try {
      final collections = _fireStore
          .collection(FirestoreCollections.users)
          .doc(_firebaseAuth.currentUser!.uid)
          .collection(FirestoreCollections.collections)
          .doc(cardEntity.collectionId);

      final cards =
          collections.collection(FirestoreCollections.cards).doc(cardEntity.id);
      await collections.get().then((snapshot) {
        snapshot.data()!['collectionName'].toString();
      });

      await cards.update({
        "isLearned": cardEntity.isLearned,
      });
    } on FirebaseException catch (e) {
      throw Exception("Exception createCard $e");
    }
  }

  @override
  Future<void> importExcel(
      {required String path,
      required String collectionId,
      required String collectionName}) async {
    try {
      final file = File(path);
      final cards = splitContent(file);
      for (int i = 0; i < cards.length; i++) {
        final doc = _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(collectionId)
            .collection(FirestoreCollections.cards)
            .doc();
        await doc.set({
          "id": doc.id,
          "backImage": "",
          "frontImage": "",
          "collectionId": collectionId,
          "collectionName": collectionName,
          "front": [
            {"insert": "${cards[i].$1}\n"}
          ],
          "back": [
            {"insert": "${cards[i].$2}\n"}
          ],
          "createdAt": FieldValue.serverTimestamp()
        });
      }
    } catch (e) {
      rethrow;
      throw const FormatException("Wrong data format");
    }
  }

  List<(String, String)> splitContent(File file) {
    final format = file.path.split(".").last;
    List<String> values = <String>[];
    switch (format) {
      case "xlsx":
        final excel = Excel.decodeBytes(file.readAsBytesSync());
        for (var table in excel.tables.keys) {
          for (var row in excel.tables[table]!.rows) {
            int rowCount = 0;
            for (var cell in row) {
              if (cell == null) break;
              if(rowCount == 2) break;
              rowCount++;
              final value = cell.value;
              switch (value) {
                case TextCellValue():
                  values.add(value.value);
                  break;
                case IntCellValue():
                  values.add(value.value.toString());
                  break;
                case DoubleCellValue():
                  values.add(value.value.toString());
                  break;
                default:
                  break;
              }
            }
          }
        }
        if (values.length < 4) return [];
        final dataStartIndex =
            values.indexWhere((e) => e.toLowerCase() == 'back') + 1;
        values = values.sublist(dataStartIndex);
        print(values.last.toString());
        final cards = <(String, String)>[];
        for (int i = 0; i < values.length; i += 2) {
          cards.add((values[i], values[i + 1]));
        }
        return cards;
      case "csv":
        final lines = file.readAsLinesSync();
        int backRowIndex = -1;
        int frontRowIndex = -1;
        for (int i = 0; i < lines.length; i++) {
          final parts = lines[i].split(",").toList();
          if(frontRowIndex == -1 || backRowIndex == -1){
            frontRowIndex = parts.indexWhere((element) => element.toLowerCase().contains("front"));
            backRowIndex = parts.indexWhere((element) => element.toLowerCase().contains("back"));
            if(frontRowIndex != -1 && backRowIndex != -1){
              continue;
            }
          }else{
            values.add(parts[frontRowIndex]);
            values.add(parts[backRowIndex]);
          }
        }
        if (values.length < 4) return [];
        final dataStartIndex =
            values.indexWhere((e) => e.toLowerCase() == 'back') + 1;
        values = values.sublist(dataStartIndex);
        final cards = <(String, String)>[];
        for (int i = 0; i < values.length; i += 2) {
          cards.add((values[i], values[i + 1]));
        }
        return cards;
      default:
        return [];
    }
  }

  @override
  Future<void> moveToCollection(
      {required List<CardEntity> cards,
      required String fromCollectionId,
      required String toCollectionId}) async {
    try {
      var batch = _fireStore.batch();
      final collectionName = (await _fireStore
              .collection(FirestoreCollections.users)
              .doc(_firebaseAuth.currentUser!.uid)
              .collection(FirestoreCollections.collections)
              .doc(toCollectionId)
              .get())
          .get("collectionName");
      final newCards = cards.map((e) {
        return e.copyWith(
            collectionId: toCollectionId, collectionName: collectionName);
      });
      for (var card in newCards) {
        final cardRef = _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(toCollectionId)
            .collection(FirestoreCollections.cards)
            .doc(card.id);
        final cardToDeleteRef = _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(fromCollectionId)
            .collection(FirestoreCollections.cards)
            .doc(card.id);
        final imagesFromCollection = await _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(fromCollectionId)
            .collection(FirestoreCollections.cards)
            .doc(card.id)
            .collection(FirestoreCollections.images)
            .get();
        final imagesToCollection =
            cardRef.collection(FirestoreCollections.images);
        for (var image in imagesFromCollection.docs) {
          batch.set(imagesToCollection.doc(image.id), image.data());
        }
        batch.set(cardRef, card.toJson());
        batch.delete(cardToDeleteRef);
        final imagesToDelete =
            await cardToDeleteRef.collection(FirestoreCollections.images).get();
        for (var imageToDelete in imagesToDelete.docs) {
          batch.delete(imageToDelete.reference);
        }
      }
      await batch.commit();
    } catch (e) {
      throw LocalizedException(message: 'Failed to move collection');
    }
  }

  @override
  Future<FullCardEntity> getFullCard({required CardEntity card}) async {
    String? base64FrontImage;
    String? base64BackImage;
    final cardImagesRef = _fireStore
        .collection(FirestoreCollections.users)
        .doc(_firebaseAuth.currentUser!.uid)
        .collection(FirestoreCollections.collections)
        .doc(card.collectionId)
        .collection(FirestoreCollections.cards)
        .doc(card.id)
        .collection(FirestoreCollections.images);
    final frontImageDoc = await cardImagesRef.doc("front").get();
    final backImageDoc = await cardImagesRef.doc("back").get();
    if (frontImageDoc.exists) {
      base64FrontImage = frontImageDoc.get("image");
    }
    if (backImageDoc.exists) {
      base64BackImage = backImageDoc.get("image");
    }
    return FullCardEntity(
        card: card,
        base64FrontImage: base64FrontImage,
        base64BackImage: base64BackImage);
  }

  @override
  Future<void> copyToCollection(
      {required List<CardEntity> cards, required String toCollectionId}) async {
    try {
      var batch = _fireStore.batch();
      final fromCollectionId = cards.first.collectionId;
      final collectionName = (await _fireStore
              .collection(FirestoreCollections.users)
              .doc(_firebaseAuth.currentUser!.uid)
              .collection(FirestoreCollections.collections)
              .doc(toCollectionId)
              .get())
          .get("collectionName");
      final newCards = cards.map((e) {
        return e.copyWith(
            collectionId: toCollectionId, collectionName: collectionName);
      });
      for (var card in newCards) {
        final cardRef = _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(toCollectionId)
            .collection(FirestoreCollections.cards)
            .doc(card.id);
        final imagesFromCollection = await _fireStore
            .collection(FirestoreCollections.users)
            .doc(_firebaseAuth.currentUser!.uid)
            .collection(FirestoreCollections.collections)
            .doc(fromCollectionId)
            .collection(FirestoreCollections.cards)
            .doc(card.id)
            .collection(FirestoreCollections.images)
            .get();
        final imagesToCollection =
            cardRef.collection(FirestoreCollections.images);
        for (var image in imagesFromCollection.docs) {
          batch.set(imagesToCollection.doc(image.id), image.data());
        }
        batch.set(cardRef, card.toJson());
      }
      await batch.commit();
    } catch (e) {
      throw LocalizedException(message: 'Failed to copy collection');
    }
  }
}
