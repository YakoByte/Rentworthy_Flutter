import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';

abstract class UserProfRepository {
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

class UserProfRepositoryV1 extends UserProfRepository {
  UserProfRepositoryV1(this.api);

  final ApiClient api;

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
    try {
      final body = {
        'userName': userName,
        'userDesc': userDesc,
        'countryCode': countryCode,
        'phoneNo': phoneNo,
        'email': email,
      };
      return api.multipartData(
        uri: Uri.parse(ApiConfig.userCreateProfile),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['existingAddress'] != null) {
            DialogServiceV1().showSnackBar(
                content: "Profile Created Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
        imageparam: 'image',
        imagepath: imagepath,
      );
    } catch (e) {
      // throw _determineError(e);
      //   print("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> userGetProfile({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.userGetProfile),
      headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['existingWishlist']['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
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
  }) {
    final body = {
      'phoneNo': phoneNo,
      'zipcode': zipcode,
      'state': state,
      'city': city,
      'fullAddress': fullAddress,
      'fullName': fullName,
      'unitNumber': unitNumber,
      'typeOfAddress': typeOfAddress,
      'isdefault': isdefault
    };
    return api.putData(
      uri: Uri.parse("${ApiConfig.userUpdateProfile}$addId"),
      body: body,
      headers: api.createHeaders(authtoken: "", sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['existingAddress'] != null) {
          DialogServiceV1().showSnackBar(
              content: "Address Updated Successfully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> userDeleteProfile({
    required String productId,
    required String authtoken,
  }) {
    final body = {
      'productIds': productId,
    };
    return api.deleteData(
      uri: Uri.parse(ApiConfig.userDeleteProfile),
      headers: api.createHeaders(authtoken: "", sessionId: ""),
      body: body,
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap != {}) {
          DialogServiceV1().showSnackBar(
              content: "Product Removed Successfully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          Navigator.pop(Globals.navigatorKey.currentContext!);
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final userProfRepositoryProvider =
    Provider<UserProfRepository>((ref) => UserProfRepositoryV1(
          ApiClient(),
        ));
