import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../utils/color.dart';
import '../../../utils/config.dart';
import '../../api_client/api_client.dart';

abstract class SettingRepository {
  Future<Map<String, dynamic>?> userContactUs({
    required String name,
    required String phoneNo,
    required String description,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> userPrivacyPolicy({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> userTermsCondition({
    required String authtoken,
  });
}

class SettingRepositoryV1 extends SettingRepository {
  SettingRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> userContactUs({
    required String name,
    required String phoneNo,
    required String description,
    required String authtoken,
  }) async {
    try {
      final body = {
        "name": name,
        "phoneNo": phoneNo,
        "description": description
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.userContactUs),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['_id'] != null) {
            //   print("here1");
            // DialogServiceV1().showSnackBar(
            //     content: email != "" ? "Please Verify Your Email!!" : "Please Verify Your Phone No!!",
            //     color: AppColors.colorPrimary.withOpacity(0.7),
            //     textclr: AppColors.white);

            return jsonMap;
          } else {
            //  print("here2");
            DialogServiceV1().showSnackBar(
                content: jsonMap["data"]["message"] ?? jsonMap["message"],
                color: AppColors.colorPrimary.withOpacity(0.7),
                textclr: AppColors.white);

            return {};
          }
        },
      );
    } catch (e) {
      throw Exception('Failed..');
      //  print("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> userPrivacyPolicy({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.userPrivacyPolicy}"),
      headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data']['existingProduct']['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> userTermsCondition({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.userTermsCondition}"),
      headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['data']['existingProduct']['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }
}

final settingRepositoryProvider =
    Provider<SettingRepository>((ref) => SettingRepositoryV1(ApiClient()));
