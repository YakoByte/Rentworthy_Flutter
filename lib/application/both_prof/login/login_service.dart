import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/data/both_prof/login/login_repo.dart';

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
  Future<void> verifyOTP(
      {required String verificationId, required String smsCode});
  Future<User?> loginWithGoogle({required int index});
  Future<Map<String, dynamic>?> loginWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNo,
  });
  Future<User?> logoutWithGoogle();
  Future<UserCredential?> signInWithApple({required int index});
  Future<UserCredential?> signOutWithFacebook();

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
  Future<void> verifyOTP(
      {required String verificationId, required String smsCode}) async {
    return await loginRepository.verifyOTP(
        verificationId: verificationId, smsCode: smsCode);
  }

  @override
  Future<User?> loginWithGoogle({required int index}) async {
    return await loginRepository.loginWithGoogle(index: index);
  }

  @override
  Future<UserCredential?> signInWithApple({required int index}) async {
    return await loginRepository.signInWithApple(index: index);
  }@override
  Future<Map<String, dynamic>?> loginWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNo,
  })  async {
    return await loginRepository.loginWithEmailAndPassword(email: email, password: password, phoneNo: phoneNo);
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
  Future<UserCredential?> signOutWithFacebook() async {
    return await loginRepository.signOutWithFacebook();
  }
}

final loginServiceProvider = Provider.autoDispose<LoginService>((ref) {
  final service = LoginServiceV1(
    ref.watch(loginRepositoryProvider),
  );
  return service;
});
