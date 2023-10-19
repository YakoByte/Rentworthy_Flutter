import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../utils/color.dart';

enum AuthError {
  invalidEmail,
  userDisabled,
  userNotFound,
  wrongPassword,
  emailAlreadyInUse,
  invalidCredential,
  operationNotAllowed,
  weakPassword,
  error,
}

abstract class RegisterRepository {
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class RegisterRepositoryV1 extends RegisterRepository {
  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final list =
          await FirebaseAuth.instance.fetchSignInMethodsForEmail(email);

      print("list $list");
      if (list.isEmpty) {
        print("Sign up");
        final userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );
        print("Sign up userCredential $userCredential");
        if (userCredential.additionalUserInfo!.isNewUser) {
          final userCredential =
              await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email,
            password: password,
          );

          print("Sign up-> Sign in userCredential $userCredential");
          return userCredential.user;
        }
        return userCredential.user;
      } else {
        print("Sign in");
        final userCredential =
            await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        print("Sign in userCredential $userCredential");
        return userCredential.user;
      }
    } on FirebaseAuthException catch (e) {
      // throw _determineError(e);
      print("eeeee $e ");
      _determineError(e);
      return null;
    }
  }

  AuthError _determineError(FirebaseAuthException exception) {
    switch (exception.code) {
      case 'invalid-email':
        DialogServiceV1().showSnackBar(
            content: "Invalid Email, Please Check Again",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.invalidEmail;
      case 'user-disabled':
        DialogServiceV1().showSnackBar(
            content: "User Disabled, Please Contact Admin",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.userDisabled;
      case 'user-not-found':
        DialogServiceV1().showSnackBar(
            content: "User Not Found, Please Sign Up",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.userNotFound;
      case 'wrong-password':
        DialogServiceV1().showSnackBar(
            content: "Wrong Password, Please Check Again",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.wrongPassword;
      case 'email-already-in-use':
      case 'account-exists-with-different-credential':
        DialogServiceV1().showSnackBar(
            content: "Email Already In Use, Please Sign In",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.emailAlreadyInUse;
      case 'invalid-credential':
        DialogServiceV1().showSnackBar(
            content: "Invalid Credential, Please Check Again",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.invalidCredential;
      case 'operation-not-allowed':
        DialogServiceV1().showSnackBar(
            content: "Operation Not Allowed, Please Contact Admin",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.operationNotAllowed;
      case 'weak-password':
        DialogServiceV1().showSnackBar(
            content: "Weak Password, Please Check Again",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.weakPassword;

      case 'ERROR_MISSING_GOOGLE_AUTH_TOKEN':
      default:
        DialogServiceV1().showSnackBar(
            content: exception.message ?? "Something Went Wrong",
            color: AppColors.red.withOpacity(0.7),
            textclr: AppColors.white);
        return AuthError.error;
    }
  }
}

final registerRepositoryProvider =
    Provider<RegisterRepository>((ref) => RegisterRepositoryV1());
