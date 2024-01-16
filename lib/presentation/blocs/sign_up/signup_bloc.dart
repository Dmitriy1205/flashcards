import 'package:bloc/bloc.dart';
import 'package:flashcards/domain/repositories/user_repo/user_repo_impl.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/auth/auth_repository_contract.dart';

part 'signup_event.dart';

part 'signup_state.dart';

part 'signup_bloc.freezed.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  final AuthRepository _authRepository;
  final UserRepoImpl _userRepoImpl;

  SignupBloc({required AuthRepository auth, required UserRepoImpl userRepoImpl})
      : _authRepository = auth,
        _userRepoImpl = userRepoImpl,
        super(const SignupState.initial()) {
    on<SignupEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(SignupEvent event, Emitter<SignupState> emit) =>
      event.map(
        signUpWithEmailAndPassword: (e) => _signUpWithEmailAndPassword(e, emit),
      );

  Future<void> _signUpWithEmailAndPassword(
      SignupEvent event, Emitter<SignupState> emit) async {
    emit(const SignupState.loading());

    try {
      await _authRepository.signUp(
        email: event.email.toString(),
        password: event.password.toString(),
      );
      _userRepoImpl.createUser(
        email: event.email.toString(),
      );
      emit(const SignupState.success());
    } on BadRequestException catch (e) {
      emit(SignupState.error(error: e.message));
    }
  }
}
