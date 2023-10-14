// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetCategoryImpl _$$GetCategoryImplFromJson(Map<String, dynamic> json) =>
    _$GetCategoryImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetCategoryImplToJson(_$GetCategoryImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$CategoryDataImpl _$$CategoryDataImplFromJson(Map<String, dynamic> json) =>
    _$CategoryDataImpl(
      id: json['id'] as String?,
      name: json['name'] as String?,
      img: json['img'] as String?,
    );

Map<String, dynamic> _$$CategoryDataImplToJson(_$CategoryDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'img': instance.img,
    };
