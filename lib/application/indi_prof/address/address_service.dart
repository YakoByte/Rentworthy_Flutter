import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/address/address_repo.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';
import '../../../model/indi_prof/address/get_product.dart';

abstract class AddressService {
  Future<GetAddress?> getAddressData();

  Future<Map<String, dynamic>?> getUserInformation();

  Future<ProductData?> updateUserInformation(
      {required String id,
      required String title,
      required String description,
      required String brand,
      required String category});

  Future<ProductData?> deleteUserInformation({required String id});
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

  @override
  Future<Map<String, dynamic>?> getUserInformation() async {
    return await addressRepository.getUserInformation();
  }

  @override
  Future<ProductData?> updateUserInformation(
      {required String id,
      required String title,
      required String description,
      required String brand,
      required String category}) async {
    return await addressRepository.updateUserInformation(
        id: id,
        title: title,
        description: description,
        brand: brand,
        category: category);
  }

  @override
  Future<ProductData?> deleteUserInformation({required String id}) async {
    return await addressRepository.deleteUserInformation(id: id);
  }
}

final addressServiceProvider = Provider.autoDispose<AddressService>((ref) {
  final service = AddressServiceV1(
    ref.watch(addressRepositoryProvider),
  );
  return service;
});
