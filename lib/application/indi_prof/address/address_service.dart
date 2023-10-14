import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/address/address_repo.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';

abstract class AddressService {
  @override
  Future<GetAddress?> getAddressData();
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
}

final addressServiceProvider = Provider.autoDispose<AddressService>((ref) {
  final service = AddressServiceV1(
    ref.watch(addressRepositoryProvider),
  );
  return service;
});
