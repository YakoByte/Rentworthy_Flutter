// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';

abstract class BusinessInfoRepository {
  Future<Map<String, dynamic>?> userCreateBusiness({
    required String phoneNo,
    required String phoneCode,
    required String email,
    required String businessName,
    required String businessAddress,
    required String businessDescription,
    required String einId,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> userGetBusiness({
    required String userId,
    required String authtoken,
  });
}

class BusinessInfoRepositoryV1 extends BusinessInfoRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  BusinessInfoRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> userCreateBusiness({
    required String phoneNo,
    required String phoneCode,
    required String email,
    required String businessName,
    required String businessAddress,
    required String businessDescription,
    required String einId,
    required String authtoken,
  }) async {
    try {
      final body = {
        "phoneNo": phoneNo,
        "phoneCode": phoneCode,
        "email": email,
        "businessName": businessName,
        "businessAddress": businessAddress,
        "businessDescription": businessDescription,
        "einId": einId
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.userCreateBusiness),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['id'] != null) {
            return jsonMap;
          } else {
            throw Exception('Failed..');
          }
        },
      );
    } catch (e) {
      // throw _determineError(e);
      //  debugPrint("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> userGetBusiness({
    required String userId,
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.userGetBusiness}$userId"),
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
}

final businessInfoRepositoryProvider = Provider<BusinessInfoRepository>(
    (ref) => BusinessInfoRepositoryV1(ApiClient()));
