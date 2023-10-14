// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_notification.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetNotificationImpl _$$GetNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$GetNotificationImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      recommendations: json['recommendations'] as bool?,
      receive_update_offer: json['receive_update_offer'] as bool?,
    );

Map<String, dynamic> _$$GetNotificationImplToJson(
        _$GetNotificationImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'recommendations': instance.recommendations,
      'receive_update_offer': instance.receive_update_offer,
    };
