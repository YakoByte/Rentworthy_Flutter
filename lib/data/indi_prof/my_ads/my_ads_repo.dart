import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';

abstract class MyAdsRepository {
  Future<Map<String, dynamic>?> addToWishlist({
    required String productId,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> getWishlist({
    required String authtoken,
  });

  Future<Map<String, dynamic>?> deleteProductFromWishlist({
    required String productId,
    required String authtoken,
  });
}

class MyAdsRepositoryV1 extends MyAdsRepository {
  MyAdsRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> addToWishlist({
    required String productId,
    required String authtoken,
  }) async {
    try {
      final body = {
        'productIds': productId,
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.userAddWishlist),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['existingAddress'] != null) {
            DialogServiceV1().showSnackBar(
                content: "Product Added To Wishlist Successfully!!",
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
      //  print("eeeee $e ");

      return null;
    }
  }

  @override
  Future<Map<String, dynamic>?> getWishlist({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.userGetWishlist),
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
  Future<Map<String, dynamic>?> deleteProductFromWishlist({
    required String productId,
    required String authtoken,
  }) {
    final body = {
      'productIds': productId,
    };
    return api.deleteData(
      uri: Uri.parse(ApiConfig.userRemoveWishlist),
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

final myAdsRepositoryProvider =
    Provider<MyAdsRepository>((ref) => MyAdsRepositoryV1(ApiClient()));
