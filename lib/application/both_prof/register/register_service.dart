import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/data/both_prof/register/register_repo.dart';

abstract class RegisterService {
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class RegisterServiceV1 implements RegisterService {
  RegisterServiceV1(
    this.registerRepository,
  );

  final RegisterRepository registerRepository;

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await registerRepository.signInWithEmailAndPassword(
        email: email, password: password);
  }
}

final registerServiceProvider = Provider.autoDispose<RegisterService>((ref) {
  final service = RegisterServiceV1(
    ref.watch(registerRepositoryProvider),
  );
  return service;
});
