import 'package:flashcards/data/remote/user_service/user_service_impl.dart';
import 'package:flashcards/domain/entities/user_entity/user_entity.dart';
import 'package:flashcards/domain/params/user_param/edit_user_param.dart';
import 'package:flashcards/domain/repositories/user_repo/user_repo_contract.dart';

class UserRepoImpl extends UserRepoContract {
  UserRepoImpl({required this.userServiceImpl});

  final UserServiceImpl userServiceImpl;

  @override
  Future<void> createUser({required String email}) async {
    userServiceImpl.createUser(email: email);
  }

  @override
  Future<void> editUser({required EditUserParam userParam}) {
    // TODO: implement editUser
    throw UnimplementedError();
  }

  @override
  Future<void> fetchUser({required UserEntity userEntity}) {
    // TODO: implement fetchUser
    throw UnimplementedError();
  }
}
