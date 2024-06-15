import 'dart:convert';

import 'package:crypto/crypto.dart';
import 'package:flashcards/domain/repositories/auth/auth_repository_contract.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../core/exceptions/exceptions.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _auth;

  AuthRepositoryImpl({required FirebaseAuth auth}) : _auth = auth;

  @override
  Future<void> logout() async {
    await _auth.signOut();
  }

  @override
  Future<void> signIn({required String email, required String password}) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-credential' ||
          e.code == 'invalid-email' ||
          e.code == 'wrong-password' ||
          e.message!.contains('INVALID_LOGIN_CREDENTIALS')) {
        throw LocalizedException(
            message: 'email or password is wrong',
            attribute: 'password',
            localizationKey: 'email-or-password-wrong');
      }
      throw LocalizedException(
          message: e.message!, attribute: 'password', localizationKey: e.code);
    }
  }

  @override
  Future<void> signInWithApple() async {
    final rawNonce = generateNonce();
    final nonce = _sha256ofString(rawNonce);
    var redirectURL =
        "https://flashcards-5984c.firebaseapp.com/__/auth/handler";
    var clientID = "com.pandascode.flashcards";

    try {
      final appleCredential = await SignInWithApple.getAppleIDCredential(
          scopes: [
            AppleIDAuthorizationScopes.email,
            AppleIDAuthorizationScopes.fullName,
          ],
          nonce: nonce,
          webAuthenticationOptions: WebAuthenticationOptions(
              clientId: clientID, redirectUri: Uri.parse(redirectURL)));
      final oauthCredential = OAuthProvider("apple.com").credential(
        idToken: appleCredential.identityToken,
        rawNonce: rawNonce,
      );

      await _auth.signInWithCredential(oauthCredential);
    } on FirebaseAuthException catch (e) {
      throw LocalizedException(message: e.message!, localizationKey: e.code);
    } catch (e) {
      throw LocalizedException(message: e.toString());
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw LocalizedException(message: e.message!, localizationKey: e.code);
    } on Exception catch (e) {
      throw LocalizedException(message: e.toString());
    }
  }

  @override
  Future<void> signUp({required String email, required String password}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw LocalizedException(
            message:
                'The password provided is too weak.\nmust be more than 6 digits',
            attribute: 'password', localizationKey: e.code);
      } else if (e.code == 'email-already-in-use') {
        throw LocalizedException(
            message: 'The account already exists for that email',
            attribute: 'email', localizationKey: e.code);
      }
    } catch (e) {
      throw LocalizedException(message: e.toString());
    }
  }

  @override
  Stream<User?> get authStateChange => _auth.authStateChanges();

  String _sha256ofString(String input) {
    final bytes = utf8.encode(input);
    final digest = sha256.convert(bytes);
    return digest.toString();
  }

  @override
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw LocalizedException(message: e.message!);
    } on Exception catch (e) {
      throw LocalizedException(message: e.toString());
    }
  }

  @override
  Future<void> sendEmailVerification() {
    return _auth.currentUser!.sendEmailVerification();
  }
}
