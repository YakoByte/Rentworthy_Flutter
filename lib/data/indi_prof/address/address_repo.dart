import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/globals.dart';
import '../../../application/dialog/dialog_service.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';
import '../../../model/indi_prof/address/get_product.dart';
import '../../../utils/color.dart';
import '../../api_client/api_client.dart';

abstract class AddressRepository {
  Future<GetAddress?> getAddressData();

  Future<ProductData?> updateuserinformation(
      {required String id,
      required String title,
      required String description,
      required String brand,
      required String category});

  Future<Map<String, dynamic>?> getuserinformation();

  Future<ProductData?> deleteuserinformation({required String id});
}

class AddressRepositoryV1 extends AddressRepository {
  AddressRepositoryV1(this.api);

  final ApiClient api;
  final List<AddressData> _onAddressData = [
    const AddressData(
        id: "1",
        name: "Mukesh Kumar",
        address_type: "Home",
        address_line_1: "B-1/10, Sector-18",
        address_line_2: "Rohini",
        city: "New Delhi",
        state: "Delhi",
        phone_no: "9999999999",
        zip_code: "110089"),
    const AddressData(
        id: "2",
        name: "Anil Kumar",
        address_type: "Office",
        address_line_1: "A-1/10, Sector-18",
        address_line_2: "Sector-18",
        city: "New Delhi",
        state: "Delhi",
        phone_no: "8888888888",
        zip_code: "110089"),
  ];

  List<AddressData>? get onAddressData => _onAddressData;

  @override
  Future<GetAddress?> getAddressData() async {
    return GetAddress(success: true, message: "OK", data: _onAddressData);
  }

  @override
  Future<Map<String, dynamic>?> getuserinformation() {
    return api.getData(
      uri: Uri.parse("https://dummyjson.com/products"),
      headers: api.createHeaders(authtoken: "", sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        ProductResponse productResponse = ProductResponse.fromJson(jsonMap);
        debugPrint("ProductResponse data is =- $productResponse");

        if (jsonMap["products"] != null) {
          return jsonMap;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<ProductData?> updateuserinformation(
      {required String id,
      required String title,
      required String description,
      required String brand,
      required String category}) {
    return api.putData(
      uri: Uri.parse("https://dummyjson.com/products/$id"),
      body: {
        "id": id,
        "title": title,
        "description": description,
        "brand": brand,
        "category": category
      },
      headers: api.createHeaders(authtoken: "", sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        ProductData productResponse = ProductData.fromJson(jsonMap);
        debugPrint("ProductResponse data is =- $productResponse");

        if (productResponse != null) {
          DialogServiceV1().showSnackBar(
              content: "Product Updated Successfully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          return productResponse;
        } else {
          throw Exception('Failed..');
        }
      },
    );
  }

  @override
  Future<ProductData?> deleteuserinformation({required String id}) {
    return api.deleteData(
      uri: Uri.parse("https://dummyjson.com/products/$id"),
      headers: api.createHeaders(authtoken: "", sessionId: ""),
      builder: (data) {
        Map<String, dynamic> jsonMap = json.decode(data);
        ProductData productResponse = ProductData.fromJson(jsonMap);
        debugPrint("ProductResponse data is =- $productResponse");

        if (productResponse != null) {
          DialogServiceV1().showSnackBar(
              content: "Product Deleted Successfully",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
          Navigator.pop(Globals.navigatorKey.currentContext!);
          return productResponse;
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
