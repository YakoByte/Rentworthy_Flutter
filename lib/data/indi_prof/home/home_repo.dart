import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/import_utils.dart';
import '../../api_client/api_client.dart';

abstract class HomeRepository {
  Future<Map<String, dynamic>?> userGetCategory();

  Future<Map<String, dynamic>?> createLocation({
    required int lat,
    required int long,
    required String authtoken,
  });

  Future<Map<String, dynamic>?> userGetProduct();

  Future<Map<String, dynamic>?> getAllLocation({
    required String userid,
    required String authtoken,
  });
}

class HomeRepositoryV1 extends HomeRepository {
  HomeRepositoryV1(this.api);

  final ApiClient api;

  @override
  Future<Map<String, dynamic>?> createLocation({
    required int lat,
    required int long,
    required String authtoken,
  }) async {
    try {
      final body = {
        "location": {
          "coordinates": [lat, long]
        }
      };
      return api.postData(
        uri: Uri.parse(ApiConfig.userCreateLocation),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['_id'] != null) {
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
  Future<Map<String, dynamic>?> getAllLocation({
    required String userid,
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse("${ApiConfig.userGetLocation}$userid"),
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
  Future<Map<String, dynamic>?> userGetCategory() {
    return api.getData(
      uri: Uri.parse(ApiConfig.userGetCategory),
      headers: api.createHeaders(authtoken: '', sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['existingCategory']['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> userGetProduct() {
    return api.getData(
      uri: Uri.parse(ApiConfig.userGetProduct),
      headers: api.createHeaders(authtoken: '', sessionId: ""),
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
  Future<Map<String, dynamic>?> userGetSubCategory({
    required String authtoken,
  }) {
    return api.getData(
      uri: Uri.parse(ApiConfig.userGetSubCategory),
      headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);

        if (jsonMap['existingSubCategory']['data'] != []) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<Map<String, dynamic>?> addProductLike({
    required String authtoken,
    required String userId,
    required String productId,
    required bool isFav,
  }) async {
    try {
      final body = {"userId": userId, "productId": productId, "isFav": isFav};
      return api.postData(
        uri: Uri.parse(ApiConfig.userCreateProductLike),
        body: body,
        headers: api.createHeaders(authtoken: authtoken, sessionId: ""),
        builder: (data) {
          Map<String, dynamic> jsonMap = json.decode(data);

          if (jsonMap['existingProduct']['data'] != null) {
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
  Future<Map<String, dynamic>?> userGetProductLike({
    required String authtoken,
    required String userId,
    required String productId,
  }) {
    return api.getData(
      uri: Uri.parse(
          "${ApiConfig.userGetProductLike}$userId&productId=$productId"),
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

final homeRepositoryProvider =
    Provider<HomeRepository>((ref) => HomeRepositoryV1(ApiClient()));
