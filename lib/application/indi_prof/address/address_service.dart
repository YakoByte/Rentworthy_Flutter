import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/address/address_repo.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';
import '../../../model/indi_prof/address/get_product.dart';

abstract class AddressService {
  Future<GetAddress?> getAddressData();

  Future<Map<String, dynamic>?> getuserinformation();

  Future<ProductData?> updateuserinformation(
      {required String id,
      required String title,
      required String description,
      required String brand,
      required String category});

  Future<ProductData?> deleteuserinformation({required String id});
}

class AddressServiceV1 implements AddressService {
  AddressServiceV1(
    this.addressRepository,
  );

  final AddressRepository addressRepository;

  @override
  Future<GetAddress?> getAddressData() async {
    return await addressRepository.getAddressData();
  }

  Future<Map<String, dynamic>?> getuserinformation() async {
    return await addressRepository.getuserinformation();
  }

  @override
  Future<ProductData?> updateuserinformation(
      {required String id,
      required String title,
      required String description,
      required String brand,
      required String category}) async {
    return await addressRepository.updateuserinformation(
        id: id,
        title: title,
        description: description,
        brand: brand,
        category: category);
  }

  Future<ProductData?> deleteuserinformation({required String id}) async {
    return await addressRepository.deleteuserinformation(id: id);
  }
}

final addressServiceProvider = Provider.autoDispose<AddressService>((ref) {
  final service = AddressServiceV1(
    ref.watch(addressRepositoryProvider),
  );
  return service;
});
