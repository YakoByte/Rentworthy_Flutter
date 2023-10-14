// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_user_prof.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetUserProfImpl _$$GetUserProfImplFromJson(Map<String, dynamic> json) =>
    _$GetUserProfImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetUserProfImplToJson(_$GetUserProfImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$UserDataImpl _$$UserDataImplFromJson(Map<String, dynamic> json) =>
    _$UserDataImpl(
      user_id: json['user_id'] as String?,
      user_name: json['user_name'] as String?,
      user_img: json['user_img'] as String?,
      user_desc: json['user_desc'] as String?,
      user_contrycode: json['user_contrycode'] as String?,
      user_phoneno: json['user_phoneno'] as String?,
      user_email: json['user_email'] as String?,
    );

Map<String, dynamic> _$$UserDataImplToJson(_$UserDataImpl instance) =>
    <String, dynamic>{
      'user_id': instance.user_id,
      'user_name': instance.user_name,
      'user_img': instance.user_img,
      'user_desc': instance.user_desc,
      'user_contrycode': instance.user_contrycode,
      'user_phoneno': instance.user_phoneno,
      'user_email': instance.user_email,
    };
