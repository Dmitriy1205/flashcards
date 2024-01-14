import 'package:flashcards/domain/entities/user_entity/user_entity.dart';
import 'package:flashcards/domain/params/user_param/edit_user_param.dart';

abstract class UserRepoContract{
  Future<void> createUser(  {required String email});

  Future<void> fetchUser({required UserEntity userEntity});

  Future<void> editUser({required EditUserParam userParam});
}