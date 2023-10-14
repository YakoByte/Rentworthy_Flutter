// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetAddressImpl _$$GetAddressImplFromJson(Map<String, dynamic> json) =>
    _$GetAddressImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AddressData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetAddressImplToJson(_$GetAddressImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$AddressDataImpl _$$AddressDataImplFromJson(Map<String, dynamic> json) =>
    _$AddressDataImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address_type: json['address_type'] as String?,
      address_line_1: json['address_line_1'] as String?,
      address_line_2: json['address_line_2'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      phone_no: json['phone_no'] as String?,
      zip_code: json['zip_code'] as String?,
    );

Map<String, dynamic> _$$AddressDataImplToJson(_$AddressDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address_type': instance.address_type,
      'address_line_1': instance.address_line_1,
      'address_line_2': instance.address_line_2,
      'city': instance.city,
      'state': instance.state,
      'phone_no': instance.phone_no,
      'zip_code': instance.zip_code,
    };
