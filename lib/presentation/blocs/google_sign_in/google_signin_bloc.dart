import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/auth/auth_repository_contract.dart';

part 'google_signin_event.dart';

part 'google_signin_state.dart';

part 'google_signin_bloc.freezed.dart';

class GoogleSigninBloc extends Bloc<GoogleSigninEvent, GoogleSigninState> {
  final AuthRepository _authRepository;

  GoogleSigninBloc({required AuthRepository auth})
      : _authRepository = auth, super(const GoogleSigninState.initial()) {
    on<GoogleSigninEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          GoogleSigninEvent event, Emitter<GoogleSigninState> emit) =>
      event.map(signInWithGoogle: (e) => _signinWithGoogle(e, emit));

  Future<void> _signinWithGoogle(
      GoogleSigninEvent event, Emitter<GoogleSigninState> emit) async {
    emit(const GoogleSigninState.loading());

    try {
      await _authRepository.signInWithGoogle();

      emit(const GoogleSigninState.success());
    } on BadRequestException catch (e) {
      emit(GoogleSigninState.error(error: e.message));
    }
  }
}
