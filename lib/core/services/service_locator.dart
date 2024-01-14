import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards/data/remote/collection_service/collection_service_impl.dart';
import 'package:flashcards/data/remote/empty.dart';
import 'package:flashcards/data/remote/user_service/user_service_impl.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_impl.dart';
import 'package:flashcards/domain/repositories/user_repo/user_repo_impl.dart';
import 'package:flashcards/presentation/blocs/auth/auth_bloc.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:get_it/get_it.dart';
import '../../domain/repositories/auth/auth_repository_contract.dart';
import '../../domain/repositories/auth/auth_repository_impl.dart';
import '../../presentation/blocs/apple_sign_in/apple_signin_bloc.dart';
import '../../presentation/blocs/forgot_password/forgot_password_bloc.dart';
import '../../presentation/blocs/google_sign_in/google_signin_bloc.dart';
import '../../presentation/blocs/sign_in/signin_bloc.dart';
import '../../presentation/blocs/sign_up/signup_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';

final sl = GetIt.instance;

Future<void> init() async {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  final authRepository = AuthRepositoryImpl(auth: firebaseAuth);
  final userService = UserServiceImpl(
      fireStore: fireStore,
      firebaseStorage: firebaseStorage,
      firebaseAuth: firebaseAuth);
  final collectionService = CollectionServiceImpl(
      fireStore: fireStore,
      firebaseStorage: firebaseStorage,
      firebaseAuth: firebaseAuth);

  final userRepoImpl = UserRepoImpl(userServiceImpl: userService);
  final collectionRepoImpl =
      CollectionRepoImpl(collectionServiceImpl: collectionService);

  ///Repositories

  sl.registerSingleton<AuthRepository>(authRepository);
  sl.registerSingleton<UserRepoImpl>(userRepoImpl);
  sl.registerSingleton<CollectionRepoImpl>(collectionRepoImpl);

// to delete
  MockData mockData = MockData();

  ///Blocs
  sl.registerLazySingleton(() => AuthBloc(authRepository: sl()));
  sl.registerFactory(() => SignupBloc(auth: sl(), userRepoImpl: sl()));
  sl.registerFactory(() => SigninBloc(auth: sl()));
  sl.registerFactory(() => ForgotPasswordBloc(auth: sl()));
  sl.registerFactory(() => GoogleSigninBloc(auth: sl()));

  sl.registerLazySingleton(() => ListsBloc(collectionRepo: sl()));
  sl.registerLazySingleton(() => CardsBloc());

  sl.registerFactory(() => AppleSigninBloc(auth: sl()));
}
