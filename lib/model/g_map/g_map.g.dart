// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'g_map.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GMapResponseImpl _$$GMapResponseImplFromJson(Map<String, dynamic> json) =>
    _$GMapResponseImpl(
      offices: (json['offices'] as List<dynamic>?)
          ?.map((e) => Office.fromJson(e as Map<String, dynamic>))
          .toList(),
      regions: (json['regions'] as List<dynamic>?)
          ?.map((e) => Region.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GMapResponseImplToJson(_$GMapResponseImpl instance) =>
    <String, dynamic>{
      'offices': instance.offices,
      'regions': instance.regions,
    };

_$OfficeImpl _$$OfficeImplFromJson(Map<String, dynamic> json) => _$OfficeImpl(
      address: json['address'] as String,
      id: json['id'] as String,
      image: json['image'] as String,
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      region: json['region'] as String,
    );

Map<String, dynamic> _$$OfficeImplToJson(_$OfficeImpl instance) =>
    <String, dynamic>{
      'address': instance.address,
      'id': instance.id,
      'image': instance.image,
      'lat': instance.lat,
      'lng': instance.lng,
      'name': instance.name,
      'phone': instance.phone,
      'region': instance.region,
    };

_$RegionImpl _$$RegionImplFromJson(Map<String, dynamic> json) => _$RegionImpl(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
      id: json['id'] as String,
      name: json['name'] as String,
      zoom: json['zoom'] as int,
    );

Map<String, dynamic> _$$RegionImplToJson(_$RegionImpl instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
      'id': instance.id,
      'name': instance.name,
      'zoom': instance.zoom,
    };
