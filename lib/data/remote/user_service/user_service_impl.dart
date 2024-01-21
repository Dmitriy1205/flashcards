import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flashcards/core/const/firebase_collections.dart';
import 'package:flashcards/core/exceptions/exceptions.dart';
import 'package:flashcards/data/remote/user_service/user_service_contract.dart';
import 'package:flashcards/domain/entities/user_entity/user_entity.dart';
import 'package:flashcards/domain/params/user_param/edit_user_param.dart';

class UserServiceImpl extends UserServiceContract {
  UserServiceImpl(
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
  Future<void> createUser({required String email}) async {
    print('createUser in service');
    final String id = _firebaseAuth.currentUser!.uid;
    print('createUser in service $id');

    final doc = _fireStore.collection(FirestoreCollections.users).doc(id);
    final userExists = (await _fireStore
                .collection(FirestoreCollections.users)
                .where("email", isEqualTo: email)
                .get())
            .size !=
        0;
    if (userExists) {
      throw BadRequestException(message: "User with such email already exists");
    } else {
      await doc.set({
        "email": email,
        "id": id,
        "createdAt": FieldValue.serverTimestamp(),
      });
    }
  }

  @override
  Future<void> editUser({required EditUserParam userParam}) {
    print('editUser in service');
    throw UnimplementedError();
  }

  @override
  Future<void> fetchUser({required UserEntity userEntity}) {
    print('fetchUser in service');

    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}
