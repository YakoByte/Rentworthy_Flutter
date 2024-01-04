import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/user_prof/user_prof_repo.dart';

abstract class UserProfService {
  Future<Map<String, dynamic>?> userGetProfile({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> userCreateProfile({
    required String userName,
    required String userDesc,
    required String countryCode,
    required String phoneNo,
    required String email,
    required String imagepath,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> userUpdateProfile({
    required String addId,
    required String phoneNo,
    required String zipcode,
    required String state,
    required String city,
    required String fullAddress,
    required String fullName,
    required String unitNumber,
    required String typeOfAddress,
    required String isdefault,
    required String authtoken,
  });
}

class UserProfServiceV1 implements UserProfService {
  UserProfServiceV1(
    this.userProfRepository,
  );

  final UserProfRepository userProfRepository;

  @override
  Future<Map<String, dynamic>?> userGetProfile({
    required String authtoken,
  }) async {
    return await userProfRepository.userGetProfile(authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> userCreateProfile({
    required String userName,
    required String userDesc,
    required String countryCode,
    required String phoneNo,
    required String email,
    required String imagepath,
    required String authtoken,
  }) async {
    return await userProfRepository.userCreateProfile(
        userName: userName,
        userDesc: userDesc,
        countryCode: countryCode,
        phoneNo: phoneNo,
        email: email,
        imagepath: imagepath,
        authtoken: authtoken);
  }

  @override
  Future<Map<String, dynamic>?> userUpdateProfile({
    required String addId,
    required String phoneNo,
    required String zipcode,
    required String state,
    required String city,
    required String fullAddress,
    required String fullName,
    required String unitNumber,
    required String typeOfAddress,
    required String isdefault,
    required String authtoken,
  }) async {
    return await userProfRepository.userUpdateProfile(
        addId: addId,
        phoneNo: phoneNo,
        zipcode: zipcode,
        state: state,
        city: city,
        fullAddress: fullAddress,
        fullName: fullName,
        unitNumber: unitNumber,
        typeOfAddress: typeOfAddress,
        isdefault: isdefault,
        authtoken: authtoken);
  }
}

final userProfServiceProvider = Provider.autoDispose<UserProfService>((ref) {
  final service = UserProfServiceV1(
    ref.watch(userProfRepositoryProvider),
  );
  return service;
});
