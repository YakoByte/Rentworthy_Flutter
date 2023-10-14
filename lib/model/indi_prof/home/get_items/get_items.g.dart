// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_items.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetItemImpl _$$GetItemImplFromJson(Map<String, dynamic> json) =>
    _$GetItemImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetItemImplToJson(_$GetItemImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ItemDataImpl _$$ItemDataImplFromJson(Map<String, dynamic> json) =>
    _$ItemDataImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      imgs: (json['imgs'] as List<dynamic>?)?.map((e) => e as String).toList(),
      thumbnail: json['thumbnail'] as String?,
      desc: json['desc'] as String?,
      location: json['location'] as String?,
      time_period: json['time_period'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      link: json['link'] as String?,
      price: json['price'] as String?,
      isfav: json['isfav'] as bool?,
    );

Map<String, dynamic> _$$ItemDataImplToJson(_$ItemDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imgs': instance.imgs,
      'thumbnail': instance.thumbnail,
      'desc': instance.desc,
      'location': instance.location,
      'time_period': instance.time_period,
      'lat': instance.lat,
      'long': instance.long,
      'link': instance.link,
      'price': instance.price,
      'isfav': instance.isfav,
    };
