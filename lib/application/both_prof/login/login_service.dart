import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:rentworthy/data/both_prof/login/login_repo.dart';
import 'package:rentworthy/data/both_prof/register/register_repo.dart';

abstract class LoginService {
  Future<void> sendOTP({
    required String phoneNumber,
    PhoneMultiFactorInfo? multiFactorInfo,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    @visibleForTesting String? autoRetrievedSmsCodeForTesting,
    Duration timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    MultiFactorSession? multiFactorSession,
  });

  Future<User?> loginWithGoogle({required int index});

  Future<User?> logoutWithGoogle();

  Future<UserCredential?> signoutWithFacebook();

  Future<UserCredential?> signInWithFacebook();
}

class LoginServiceV1 implements LoginService {
  LoginServiceV1(
    this.loginRepository,
  );

  final LoginRepository loginRepository;

  @override
  Future<void> sendOTP({
    required String phoneNumber,
    PhoneMultiFactorInfo? multiFactorInfo,
    required PhoneVerificationCompleted verificationCompleted,
    required PhoneVerificationFailed verificationFailed,
    required PhoneCodeSent codeSent,
    required PhoneCodeAutoRetrievalTimeout codeAutoRetrievalTimeout,
    @visibleForTesting String? autoRetrievedSmsCodeForTesting,
    Duration timeout = const Duration(seconds: 30),
    int? forceResendingToken,
    MultiFactorSession? multiFactorSession,
  }) async {
    return await loginRepository.sendOTP(
        phoneNumber: phoneNumber,
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: codeAutoRetrievalTimeout);
  }

  @override
  Future<User?> loginWithGoogle({required int index}) async {
    return await loginRepository.loginWithGoogle(index: index);
  }

  @override
  Future<UserCredential?> signInWithFacebook() async {
    return await loginRepository.signInWithFacebook();
  }

  @override
  Future<User?> logoutWithGoogle() async {
    return await loginRepository.logoutWithGoogle();
  }

  @override
  Future<UserCredential?> signoutWithFacebook() async {
    return await loginRepository.signoutWithFacebook();
  }
}

final loginServiceProvider = Provider.autoDispose<LoginService>((ref) {
  final service = LoginServiceV1(
    ref.watch(loginRepositoryProvider),
  );
  return service;
});
