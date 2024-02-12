import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepository{
  Stream<User?> get authStateChange;
  Future<void> signUp({required String email, required String password});
  Future<void> signIn({required String email, required String password});
  Future<void> resetPassword(String email);
  Future<void> signInWithApple();
  Future<void> signInWithGoogle();
  Future<void> logout();
  Future<void> sendEmailVerification();
}