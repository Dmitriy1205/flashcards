import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../domain/repositories/auth/auth_repository_contract.dart';

part 'auth_event.dart';

part 'auth_state.dart';

part 'auth_bloc.freezed.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository _authRepository;

  AuthBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(const AuthState.initial()) {
    on<AuthEvent>(_mapAuthBlocToState);
    _authRepository.authStateChange.listen((User? user) {
      add(AuthEvent.initUser(user: user));
    });
  }

  Future<void> _mapAuthBlocToState(AuthEvent event, Emitter<AuthState> emit) =>
      event.map(
        initUser: (e) => _initUser(e, emit),
        logout: (e) => _logout(e, emit),
      );

  Future<void> _logout(_LogoutEvent event, Emitter<AuthState> emit) async {
    await _authRepository.logout();
    emit(AuthState.initial());
  }

  Future<void> _initUser(_InitUserEvent event, Emitter<AuthState> emit) async {
    if (event.user == null) {
      emit(const AuthState.unauthenticated());
    } else {
      emit(AuthState.authenticated(user: event.user!));
    }
  }
}
