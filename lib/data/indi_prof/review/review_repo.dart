import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/import_utils.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../api_client/api_client.dart';

abstract class ReviewRepository {
  Future<Map<String, dynamic>?> userCreateProductReview({
    required String productId,
    required String userId,
    required String review,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> userGetProductReview({
    required String authtoken,
    required String productId,
    required String userId,
  });
}

class ReviewRepositoryV1 extends ReviewRepository {
  ReviewRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> userCreateProductReview({
    required String productId,
    required String userId,
    required String review,
    required String authtoken,
  }) async {
    try {
      final body = {"userId": userId, "productId": productId, "review": review};
      return api.postData(
        uri: Uri.parse(ApiConfig.userCreateProductReview),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['_id'] != null) {
            //    print("here1");
            // DialogServiceV1().showSnackBar(
            //     content: email != "" ? "Please Verify Your Email!!" : "Please Verify Your Phone No!!",
            //     color: AppColors.colorPrimary.withOpacity(0.7),
            //     textclr: AppColors.white);

            return jsonMap;
          } else {
            //   print("here2");
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
      // print("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> userGetProductReview({
    required String authtoken,
    required String productId,
    required String userId,
  }) {
    return api.getData(
      uri: Uri.parse(
          "${ApiConfig.userGetProductReview}?userId=$userId&productId=$productId"),
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
  Future<Map<String, dynamic>?> userCreateProductRating({
    required String productId,
    required String userId,
    required int rating,
    required String authtoken,
  }) async {
    try {
      final body = {"userId": userId, "productId": productId, "rating": rating};
      return api.postData(
        uri: Uri.parse(ApiConfig.userCreateProductRating),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['_id'] != null) {
            //    print("here1");
            // DialogServiceV1().showSnackBar(
            //     content: email != "" ? "Please Verify Your Email!!" : "Please Verify Your Phone No!!",
            //     color: AppColors.colorPrimary.withOpacity(0.7),
            //     textclr: AppColors.white);

            return jsonMap;
          } else {
            //       print("here2");
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
  Future<Map<String, dynamic>?> userGetProductRating({
    required String authtoken,
    required String productId,
    required String userId,
  }) {
    return api.getData(
      uri: Uri.parse(
          "${ApiConfig.userGetProductRating}?userId=$userId&productId=$productId"),
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

final reviewRepositoryProvider =
    Provider<ReviewRepository>((ref) => ReviewRepositoryV1(ApiClient()));
