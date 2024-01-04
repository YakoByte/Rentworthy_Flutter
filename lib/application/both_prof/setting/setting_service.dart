import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/data/both_prof/register/register_repo.dart';

import '../../../data/both_prof/setting/setting_repo.dart';

abstract class SettingService {
  Future<Map<String, dynamic>?> userContactUs({
    required String name,
    required String phoneNo,
    required String description,
    required String authtoken,
  }) ;
  Future<Map<String, dynamic>?> userPrivacyPolicy({
    required String authtoken,
  });
  Future<Map<String, dynamic>?> userTermsCondition({
    required String authtoken,
  });
}

class SettingServiceV1 implements SettingService {
  SettingServiceV1(
      this.settingRepository,
      );

  final SettingRepository settingRepository;

  @override
  Future<Map<String, dynamic>?> userContactUs({
    required String name,
    required String phoneNo,
    required String description,
    required String authtoken,
  }) async {
    return await settingRepository.userContactUs(name: name, phoneNo: phoneNo, description: description, authtoken: authtoken);
  }
  @override
  Future<Map<String, dynamic>?> userPrivacyPolicy({
    required String authtoken,
  }) async {
    return await settingRepository.userPrivacyPolicy(authtoken: authtoken);
  } @override
  Future<Map<String, dynamic>?> userTermsCondition({
    required String authtoken,
  }) async {
    return await settingRepository.userTermsCondition(authtoken: authtoken);
  }
}

final settingServiceProvider = Provider.autoDispose<SettingService>((ref) {
  final service = SettingServiceV1(
    ref.watch(settingRepositoryProvider),
  );
  return service;
});
