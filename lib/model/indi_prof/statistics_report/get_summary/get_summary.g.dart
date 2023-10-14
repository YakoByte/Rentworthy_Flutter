// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetSummaryImpl _$$GetSummaryImplFromJson(Map<String, dynamic> json) =>
    _$GetSummaryImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      active_rental: json['active_rental'] as String?,
      requests: json['requests'] as String?,
      rented: json['rented'] as String?,
      requested: json['requested'] as String?,
    );

Map<String, dynamic> _$$GetSummaryImplToJson(_$GetSummaryImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'active_rental': instance.active_rental,
      'requests': instance.requests,
      'rented': instance.rented,
      'requested': instance.requested,
    };
