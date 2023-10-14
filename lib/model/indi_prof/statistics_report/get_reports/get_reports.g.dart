// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_reports.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetReportImpl _$$GetReportImplFromJson(Map<String, dynamic> json) =>
    _$GetReportImpl(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ReportData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetReportImplToJson(_$GetReportImpl instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

_$ReportDataImpl _$$ReportDataImplFromJson(Map<String, dynamic> json) =>
    _$ReportDataImpl(
      id: json['id'] as String?,
      report_title: json['report_title'] as String?,
      report_subtitle: json['report_subtitle'] as String?,
      report_val: json['report_val'] as String?,
    );

Map<String, dynamic> _$$ReportDataImplToJson(_$ReportDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'report_title': instance.report_title,
      'report_subtitle': instance.report_subtitle,
      'report_val': instance.report_val,
    };
