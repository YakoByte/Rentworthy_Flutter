// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetChatImpl _$$GetChatImplFromJson(Map<String, dynamic> json) =>
    _$GetChatImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ChatData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetChatImplToJson(_$GetChatImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ChatDataImpl _$$ChatDataImplFromJson(Map<String, dynamic> json) =>
    _$ChatDataImpl(
      rec_user_id: json['rec_user_id'] as String?,
      rec_user_name: json['rec_user_name'] as String?,
      rec_user_img: json['rec_user_img'] as String?,
      product_id: json['product_id'] as String?,
      product_name: json['product_name'] as String?,
      product_img: json['product_img'] as String?,
      product_chat_id: json['product_chat_id'] as String?,
      last_msg: json['last_msg'] as String?,
      last_msg_time: json['last_msg_time'] as String?,
    );

Map<String, dynamic> _$$ChatDataImplToJson(_$ChatDataImpl instance) =>
    <String, dynamic>{
      'rec_user_id': instance.rec_user_id,
      'rec_user_name': instance.rec_user_name,
      'rec_user_img': instance.rec_user_img,
      'product_id': instance.product_id,
      'product_name': instance.product_name,
      'product_img': instance.product_img,
      'product_chat_id': instance.product_chat_id,
      'last_msg': instance.last_msg,
      'last_msg_time': instance.last_msg_time,
    };
