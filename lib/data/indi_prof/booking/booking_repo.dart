import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';

abstract class BookingRepository {}

class BookingRepositoryV1 extends BookingRepository {
  BookingRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> userCreateBooking({
    required String productId,
    required String startDate,
    required String endDate,
    required String quantity,
    required String addressId,
    required String price,
    required String totalAmount,
    required String authtoken,
    required String imagepath,
  }) async {
    try {
      final body = {
        'productId': productId,
        'startDate': startDate,
        'endDate': endDate,
        'quantity': quantity,
        'addressId': addressId,
        'price': price,
        'totalAmount': totalAmount
      };
      return api.multipartData(
        imagepath: imagepath,
        imageparam: "images",
        uri: Uri.parse(ApiConfig.userCreateBooking),
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
            //    print("here2");
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
      //   print("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> userGetBooking({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.userGetBooking}"),
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
  Future<Map<String, dynamic>?> userVerifyStripeId({
    required String authtoken,
    required String stripeId,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.userVerifyStripeId}$stripeId"),
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

final bookingRepositoryProvider =
    Provider<BookingRepository>((ref) => BookingRepositoryV1(ApiClient()));
