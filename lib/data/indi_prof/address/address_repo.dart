import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/indi_prof/address/get_address/get_address.dart';

abstract class AddressRepository {
  Future<GetAddress?> getAddressData();
}

class AddressRepositoryV1 extends AddressRepository {
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
}

final addressRepositoryProvider =
    Provider<AddressRepository>((ref) => AddressRepositoryV1());
