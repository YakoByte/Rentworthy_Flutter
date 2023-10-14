// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_del_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetBookingDelStatusImpl _$$GetBookingDelStatusImplFromJson(
        Map<String, dynamic> json) =>
    _$GetBookingDelStatusImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BookingDelStatusData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetBookingDelStatusImplToJson(
        _$GetBookingDelStatusImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$BookingDelStatusDataImpl _$$BookingDelStatusDataImplFromJson(
        Map<String, dynamic> json) =>
    _$BookingDelStatusDataImpl(
      status: json['status'] as String?,
      desc: json['desc'] as String?,
      date: json['date'] as String?,
      active_status: json['active_status'] as bool?,
    );

Map<String, dynamic> _$$BookingDelStatusDataImplToJson(
        _$BookingDelStatusDataImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'desc': instance.desc,
      'date': instance.date,
      'active_status': instance.active_status,
    };
