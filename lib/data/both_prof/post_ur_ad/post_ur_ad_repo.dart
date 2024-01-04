// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';

abstract class PostUrAdsRepository {
  Future<Map<String, dynamic>?> userCreateProduct({
    required String name,
    required String description,
    required String address,
    required String location,
    required String link,
    required String startDate,
    required String endDate,
    required String min_qty,
    required String max_qty,
    required String min_price,
    required String price,
    required String max_price,
    required String brand,
    required String imagepath,
    required String imageparam,
  });
}

class PostUrAdsRepositoryV1 extends PostUrAdsRepository {
  FirebaseAuth auth = FirebaseAuth.instance;

  PostUrAdsRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> userCreateProduct({
    required String name,
    required String description,
    required String address,
    required String location,
    required String link,
    required String startDate,
    required String endDate,
    required String min_qty,
    required String max_qty,
    required String min_price,
    required String price,
    required String max_price,
    required String brand,
    required String imagepath,
    required String imageparam,
  }) async {
    try {
      final body = {
        'name': name,
        'description': description,
        'address': address,
        'location.coordinates': location,
        'link': link,
        'startDate': startDate,
        'endDate': endDate,
        'min_qty': min_qty,
        'max_qty': max_qty,
        'min_price': min_price,
        'price': price,
        'max_price': max_price,
        'brand': brand
      };
      return api.multipartData(
        imageparam: imageparam,
        imagepath: imagepath,
        uri: Uri.parse(ApiConfig.userCreateProduct),
        body: body,
        headers: api.createHeaders(authtoken: "", sessionId: ""),
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
      // debugPrint("eeeee $e ");

      return null;
    }
  }
}

final postUrAdsRepositoryProvider =
    Provider<PostUrAdsRepository>((ref) => PostUrAdsRepositoryV1(ApiClient()));
