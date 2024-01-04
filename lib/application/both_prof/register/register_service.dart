import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/data/both_prof/register/register_repo.dart';

abstract class RegisterService {
  // Future<User?> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // });
  Future<Map<String, dynamic>?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNo,
    required String businessType,
    required String loginType,
  });
  Future<Map<String, dynamic>?> createOTP({
    required String email,
  });
  Future<Map<String, dynamic>?> verifyOTP({
    required String email,
    required String otp,
  });
  Future<Map<String, dynamic>?> registerWithSocial({
    required String email,
    required String phoneNo,
    required String businessType,
    required String loginType,
  });
}

class RegisterServiceV1 implements RegisterService {
  RegisterServiceV1(
    this.registerRepository,
  );

  final RegisterRepository registerRepository;

  // @override
  // Future<User?> signInWithEmailAndPassword({
  //   required String email,
  //   required String password,
  // }) async {
  //   return await registerRepository.signInWithEmailAndPassword(
  //       email: email, password: password);
  // }

  @override
  Future<Map<String, dynamic>?> registerWithEmailAndPassword({
    required String email,
    required String password,
    required String phoneNo,
    required String businessType,
    required String loginType,
  }) async {
    return await registerRepository.registerWithEmailAndPassword(
        email: email,
        password: password,
        phoneNo: phoneNo,
        businessType: businessType,
        loginType: loginType);
  }
  @override
  Future<Map<String, dynamic>?> createOTP({
    required String email,
  })async {
    return await registerRepository.createOTP(email: email);
  }
  @override
  Future<Map<String, dynamic>?> verifyOTP({
    required String email,
    required String otp,
  })async {
    return await registerRepository.verifyOTP(email: email, otp: otp);
  }
  @override
  Future<Map<String, dynamic>?> registerWithSocial({
    required String email,
    required String phoneNo,
    required String businessType,
    required String loginType,
  })async {
    return await registerRepository.registerWithSocial(email: email, phoneNo: phoneNo, businessType: businessType, loginType: loginType);
  }
}

final registerServiceProvider = Provider.autoDispose<RegisterService>((ref) {
  final service = RegisterServiceV1(
    ref.watch(registerRepositoryProvider),
  );
  return service;
});
