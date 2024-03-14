import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/auth/auth_repository_contract.dart';

part 'apple_signin_event.dart';

part 'apple_signin_state.dart';

part 'apple_signin_bloc.freezed.dart';

class AppleSigninBloc extends Bloc<AppleSigninEvent, AppleSigninState> {
  final AuthRepository _authRepository;

  AppleSigninBloc({required AuthRepository auth})
      : _authRepository = auth, super(const AppleSigninState.initial()) {
    on<AppleSigninEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          AppleSigninEvent event, Emitter<AppleSigninState> emit) =>
      event.map(signInWithApple: (e) => _signinWithApple(e, emit));

  Future<void> _signinWithApple(
      AppleSigninEvent event, Emitter<AppleSigninState> emit) async {
    emit(const AppleSigninState.loading());

    try {
      await _authRepository.signInWithApple();

      emit(const AppleSigninState.success());
    } on LocalizedException catch (e) {
      emit(AppleSigninState.error(error: e));
    }
  }
}
