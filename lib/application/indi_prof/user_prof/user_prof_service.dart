import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/user_prof/user_prof_repo.dart';
import '../../../model/indi_prof/user_prof/get_user_prof/get_user_prof.dart';

abstract class UserProfService {
  @override
  Future<GetUserProf?> getUserdata();
}

class UserProfServiceV1 implements UserProfService {
  UserProfServiceV1(
    this.userProfRepository,
  );

  final UserProfRepository userProfRepository;

  @override
  Future<GetUserProf?> getUserdata() async {
    return await userProfRepository.getUserdata();
  }
}

final userProfServiceProvider = Provider.autoDispose<UserProfService>((ref) {
  final service = UserProfServiceV1(
    ref.watch(userProfRepositoryProvider),
  );
  return service;
});
