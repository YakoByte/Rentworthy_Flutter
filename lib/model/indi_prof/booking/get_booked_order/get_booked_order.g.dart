// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_booked_order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetBookedOrderImpl _$$GetBookedOrderImplFromJson(Map<String, dynamic> json) =>
    _$GetBookedOrderImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BookedProduct.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetBookedOrderImplToJson(
        _$GetBookedOrderImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$BookedProductImpl _$$BookedProductImplFromJson(Map<String, dynamic> json) =>
    _$BookedProductImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      thumbnail: json['thumbnail'] as String?,
      desc: json['desc'] as String?,
      delivery_location: json['delivery_location'] as String?,
      lat: json['lat'] as String?,
      long: json['long'] as String?,
      price: json['price'] as String?,
      product_chat_id: json['product_chat_id'] as String?,
      seller_id: json['seller_id'] as String?,
      seller_name: json['seller_name'] as String?,
      seller_img: json['seller_img'] as String?,
      posted_on: json['posted_on'] as String?,
    );

Map<String, dynamic> _$$BookedProductImplToJson(_$BookedProductImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'thumbnail': instance.thumbnail,
      'desc': instance.desc,
      'delivery_location': instance.delivery_location,
      'lat': instance.lat,
      'long': instance.long,
      'price': instance.price,
      'product_chat_id': instance.product_chat_id,
      'seller_id': instance.seller_id,
      'seller_name': instance.seller_name,
      'seller_img': instance.seller_img,
      'posted_on': instance.posted_on,
    };
