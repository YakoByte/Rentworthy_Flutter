import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_address.freezed.dart';

part 'get_address.g.dart';

@freezed
abstract class GetAddress with _$GetAddress {
  const factory GetAddress({
    required bool? success,
    required String? message,
    required List<AddressData>? data,
  }) = _GetAddress;

  factory GetAddress.fromJson(Map<String, dynamic> json) =>
      _$GetAddressFromJson(json);
}

@freezed
abstract class AddressData with _$AddressData {
  const factory AddressData({
    required String? id,
    required String? name,
    required String? address_type,
    required String? address_line_1,
    required String? address_line_2,
    required String? city,
    required String? state,
    required String? phone_no,
    required String? zip_code,
  }) = _AddressData;

  factory AddressData.fromJson(Map<String, dynamic> json) =>
      _$AddressDataFromJson(json);
}
