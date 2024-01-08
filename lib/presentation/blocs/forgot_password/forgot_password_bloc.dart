import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../core/exceptions/exceptions.dart';
import '../../../domain/repositories/auth/auth_repository_contract.dart';

part 'forgot_password_event.dart';

part 'forgot_password_state.dart';

part 'forgot_password_bloc.freezed.dart';

class ForgotPasswordBloc
    extends Bloc<ForgotPasswordEvent, ForgotPasswordState> {
  final AuthRepository _authRepository;

  ForgotPasswordBloc({required AuthRepository auth})
      : _authRepository = auth, super(const ForgotPasswordState.initial()) {
    on<ForgotPasswordEvent>(_mapBlocToState);
  }

  Future<void> _mapBlocToState(
          ForgotPasswordEvent event, Emitter<ForgotPasswordState> emit) =>
      event.map(resetPassword: (e) {
        return _resetPassword(e, emit);
      });

  Future<void> _resetPassword(
      ForgotPasswordEvent event, Emitter<ForgotPasswordState> emit) async {
    emit(const ForgotPasswordState.loading());

    try {
      await _authRepository.resetPassword(event.email);
      emit(const ForgotPasswordState.success());
    } on BadRequestException catch (e) {
      emit(ForgotPasswordState.error(error: e.message));
    }
  }
}
