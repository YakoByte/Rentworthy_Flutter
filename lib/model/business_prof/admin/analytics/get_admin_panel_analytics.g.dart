// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_admin_panel_analytics.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AnalyticsResponseImpl _$$AnalyticsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$AnalyticsResponseImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => AnalyticsData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$AnalyticsResponseImplToJson(
        _$AnalyticsResponseImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$AnalyticsDataImpl _$$AnalyticsDataImplFromJson(Map<String, dynamic> json) =>
    _$AnalyticsDataImpl(
      title: json['title'] as String?,
      total_value: json['total_value'] as String?,
      percent: json['percent'] as String?,
    );

Map<String, dynamic> _$$AnalyticsDataImplToJson(_$AnalyticsDataImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'total_value': instance.total_value,
      'percent': instance.percent,
    };
