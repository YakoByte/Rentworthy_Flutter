import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../utils/color.dart';
import '../../../utils/config.dart';
import '../../api_client/api_client.dart';

abstract class ForgotPasswordRepository {
  Future<Map<String, dynamic>?> forgotPassword({
    required String newPassword,
    required String oldPassword,
    required String authtoken,
  });
}

class ForgotPasswordRepositoryV1 extends ForgotPasswordRepository {
  ForgotPasswordRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> forgotPassword({
    required String newPassword,
    required String oldPassword,
    required String authtoken,
  }) async {
    try {
      final body = {
        'newPassword': newPassword,
        'oldPassword': oldPassword,
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.userResetPassword),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['_id'] != null) {
            DialogServiceV1().showSnackBar(
                content: "User Registered Successfully!!",
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
      //   print("eeeee $e ");

      return null;
    }
  }
}

final forgotPasswordRepositoryProvider = Provider<ForgotPasswordRepository>(
    (ref) => ForgotPasswordRepositoryV1(ApiClient()));
