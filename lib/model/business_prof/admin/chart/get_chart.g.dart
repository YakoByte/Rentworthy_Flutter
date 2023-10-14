// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_chart.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetChartImpl _$$GetChartImplFromJson(Map<String, dynamic> json) =>
    _$GetChartImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetChartData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetChartImplToJson(_$GetChartImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$GetChartDataImpl _$$GetChartDataImplFromJson(Map<String, dynamic> json) =>
    _$GetChartDataImpl(
      xVal: json['xVal'] as String?,
      yVal: json['yVal'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$GetChartDataImplToJson(_$GetChartDataImpl instance) =>
    <String, dynamic>{
      'xVal': instance.xVal,
      'yVal': instance.yVal,
      'type': instance.type,
    };
