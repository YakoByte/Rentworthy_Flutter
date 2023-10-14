// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetLocationImpl _$$GetLocationImplFromJson(Map<String, dynamic> json) =>
    _$GetLocationImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetLocData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetLocationImplToJson(_$GetLocationImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$GetLocDataImpl _$$GetLocDataImplFromJson(Map<String, dynamic> json) =>
    _$GetLocDataImpl(
      loc_id: json['loc_id'] as String?,
      location: json['location'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
    );

Map<String, dynamic> _$$GetLocDataImplToJson(_$GetLocDataImpl instance) =>
    <String, dynamic>{
      'loc_id': instance.loc_id,
      'location': instance.location,
      'lat': instance.lat,
      'long': instance.long,
    };
