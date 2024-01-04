import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/address/address_repo.dart';

abstract class AddressService {}

class AddressServiceV1 implements AddressService {
  AddressServiceV1(
    this.addressRepository,
  );

  final AddressRepository addressRepository;
}

final addressServiceProvider = Provider.autoDispose<AddressService>((ref) {
  final service = AddressServiceV1(
    ref.watch(addressRepositoryProvider),
  );
  return service;
});
