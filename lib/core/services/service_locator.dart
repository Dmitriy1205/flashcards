import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flashcards/data/local/locale/locale_db_impl.dart';
import 'package:flashcards/data/remote/card_service/card_service_impl.dart';
import 'package:flashcards/data/remote/collection_service/collection_service_impl.dart';
import 'package:flashcards/data/remote/user_service/user_service_impl.dart';
import 'package:flashcards/domain/repositories/cards_repo/card_repo_contract.dart';
import 'package:flashcards/domain/repositories/cards_repo/card_repo_impl.dart';
import 'package:flashcards/domain/repositories/collection_pdf_repo/collection_pdf_repo_contract.dart';
import 'package:flashcards/domain/repositories/collection_pdf_repo/collection_pdf_repo_impl.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_contract.dart';
import 'package:flashcards/domain/repositories/collection_repo/collection_repo_impl.dart';
import 'package:flashcards/domain/repositories/locale/locale_repository_impl.dart';
import 'package:flashcards/domain/repositories/user_repo/user_repo_contract.dart';
import 'package:flashcards/domain/repositories/user_repo/user_repo_impl.dart';
import 'package:flashcards/presentation/blocs/auth/auth_bloc.dart';
import 'package:flashcards/presentation/blocs/cards/cards_bloc.dart';
import 'package:flashcards/presentation/blocs/lists/lists_bloc.dart';
import 'package:flashcards/presentation/blocs/locale/locale_cubit.dart';
import 'package:flashcards/presentation/blocs/web_list/web_list_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/remote/collection_pdf_service/collection_pdf_service_impl.dart';
import '../../domain/repositories/auth/auth_repository_contract.dart';
import '../../domain/repositories/auth/auth_repository_impl.dart';
import '../../domain/repositories/locale/locale_repository_contract.dart';
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
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  await sharedPreferences.reload();

  final authRepository = AuthRepositoryImpl(auth: firebaseAuth);
  final userService = UserServiceImpl(
      fireStore: fireStore,
      firebaseStorage: firebaseStorage,
      firebaseAuth: firebaseAuth);
  final collectionService = CollectionServiceImpl(
      fireStore: fireStore,
      firebaseStorage: firebaseStorage,
      firebaseAuth: firebaseAuth);
  final cardService = CardServiceImpl(
      fireStore: fireStore,
      firebaseStorage: firebaseStorage,
      firebaseAuth: firebaseAuth);
  final collectionPdfService = CollectionPdfServiceImpl(db: FirebaseFirestore.instance, storage: FirebaseStorage.instance);
  final localeDb = LocaleDbImpl(sharedPreferences: sharedPreferences);

  final userRepoImpl = UserRepoImpl(userServiceImpl: userService);
  final collectionRepoImpl =
      CollectionRepoImpl(collectionServiceImpl: collectionService);
  final cardRepoImpl = CardRepoImpl(cardService: cardService);
  final collectionPdfRepoImpl = CollectionPdfRepoImpl(collectionPdfService: collectionPdfService);
  final localeRepoImpl = LocaleRepositoryImpl(localeDb: localeDb);

  ///Repositories

  sl.registerSingleton<AuthRepository>(authRepository);
  sl.registerSingleton<UserRepo>(userRepoImpl);
  sl.registerSingleton<CollectionRepoContract>(collectionRepoImpl);
  sl.registerSingleton<CardRepo>(cardRepoImpl);
  sl.registerSingleton<CollectionPdfRepo>(collectionPdfRepoImpl);
  sl.registerSingleton<LocaleRepository>(localeRepoImpl);
  sl.registerFactory(() => CollectionPdfRepoImpl(collectionPdfService: sl()));

  ///Blocs
  final localeBloc = LocaleCubit(localeRepository: sl());
  localeBloc.initLocale();
  sl.registerLazySingleton(() => AuthBloc(authRepository: sl()));
  sl.registerLazySingleton(() => SignupBloc(auth: sl()));
  sl.registerLazySingleton(() => SigninBloc(auth: sl()));
  sl.registerFactory(() => ForgotPasswordBloc(auth: sl()));
  sl.registerFactory(() => GoogleSigninBloc(auth: sl()));
  sl.registerFactory(() => localeBloc);

  sl.registerLazySingleton(() => ListsBloc(collectionRepo: sl()));
  sl.registerLazySingleton(() => CardsBloc(cardRepo: sl()));

  sl.registerFactory(() => AppleSigninBloc(auth: sl()));
  sl.registerLazySingleton(() => WebListBloc(collectionRepo: sl()));
}
