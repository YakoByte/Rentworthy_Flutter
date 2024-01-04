import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';

abstract class AddressRepository {
  Future<Map<String, dynamic>?> createAddress({
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

  Future<Map<String, dynamic>?> getAllAddress({
    required String userid,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> updateUserAddress({
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

  Future<Map<String, dynamic>?> deleteUserAddress({
    required String addId,
    required String authtoken,
  });
}

class AddressRepositoryV1 extends AddressRepository {
  AddressRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createAddress({
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
    try {
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
      return api.postData(
        uri: Uri.parse(ApiConfig.userCreateAddress),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['existingAddress'] != null) {
            DialogServiceV1().showSnackBar(
                content: "Address Added Successfully!!",
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      // throw _determineError(e);
      //    print("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getAllAddress({
    required String userid,
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.userGetAddress}$userid"),
      headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> deleteUserAddress({
    required String addId,
    required String authtoken,
  }) {
    return api.deleteData(
      uri: Uri.parse("${ApiConfig.userDeleteAddress}$addId"),
      headers: api.createHeaders(authtoken: "", sessionId: ""),
      body: {},
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap != {}) {
          DialogServiceV1().showSnackBar(
              content: "Address Deleted Successfully",
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

  @override
  Future<Map<String, dynamic>?> updateUserAddress({
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
      uri: Uri.parse("${ApiConfig.userUpdateAddress}$addId"),
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
}

final addressRepositoryProvider =
    Provider<AddressRepository>((ref) => AddressRepositoryV1(
          ApiClient(),
        ));
