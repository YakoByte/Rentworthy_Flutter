// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_track_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackingItemResponseImpl _$$TrackingItemResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackingItemResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => TrackingItemData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$TrackingItemResponseImplToJson(
        _$TrackingItemResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$TrackingItemDataImpl _$$TrackingItemDataImplFromJson(
        Map<String, dynamic> json) =>
    _$TrackingItemDataImpl(
      track_item_id: json['track_item_id'] as String?,
      product_name: json['product_name'] as String?,
      desc: json['desc'] as String?,
      track_type: json['track_type'] as String?,
      thumbnail: json['thumbnail'] as String?,
      order_place_date: json['order_place_date'] as String?,
      renter_name: json['renter_name'] as String?,
      order_id: json['order_id'] as String?,
      order_status: json['order_status'] as String?,
      shipping_address: json['shipping_address'] as String?,
      payment_method: json['payment_method'] as String?,
      item_subtotal: json['item_subtotal'] as String?,
      item_total: json['item_total'] as String?,
    );

Map<String, dynamic> _$$TrackingItemDataImplToJson(
        _$TrackingItemDataImpl instance) =>
    <String, dynamic>{
      'track_item_id': instance.track_item_id,
      'product_name': instance.product_name,
      'desc': instance.desc,
      'track_type': instance.track_type,
      'thumbnail': instance.thumbnail,
      'order_place_date': instance.order_place_date,
      'renter_name': instance.renter_name,
      'order_id': instance.order_id,
      'order_status': instance.order_status,
      'shipping_address': instance.shipping_address,
      'payment_method': instance.payment_method,
      'item_subtotal': instance.item_subtotal,
      'item_total': instance.item_total,
    };
