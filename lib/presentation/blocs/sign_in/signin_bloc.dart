import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/auth/auth_repository_contract.dart';


part 'signin_event.dart';

part 'signin_state.dart';

part 'signin_bloc.freezed.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {
  final AuthRepository _authRepository;

  SigninBloc({required AuthRepository auth}) : _authRepository = auth, super(const SigninState.initial()) {
    on<SigninEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(SigninEvent event, Emitter<SigninState> emit) =>
      event.map(
        signInWithEmailAndPassword: (e) => _signInWithEmailAndPassword(e, emit),
      );

  Future<void> _signInWithEmailAndPassword(
      SigninEvent event, Emitter<SigninState> emit) async {
    emit(const SigninState.loading());

    try {
      await _authRepository.signIn(
        email: event.email.toString(),
        password: event.password.toString(),
      );
      emit(const SigninState.success());
    } on BadRequestException catch (e) {
      emit(SigninState.error(error: e.message));
    }
  }
}
