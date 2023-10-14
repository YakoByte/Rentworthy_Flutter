import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_reports.freezed.dart';

part 'get_reports.g.dart';

@freezed
abstract class GetReport with _$GetReport {
  const factory GetReport({
    required bool? success,
    required String? message,
    required List<ReportData>? data,
  }) = _GetReport;

  factory GetReport.fromJson(Map<String, dynamic> json) =>
      _$GetReportFromJson(json);
}

@freezed
abstract class ReportData with _$ReportData {
  const factory ReportData({
    required String? id,
    required String? report_title,
    required String? report_subtitle,
    required String? report_val,
  }) = _ReportData;

  factory ReportData.fromJson(Map<String, dynamic> json) =>
      _$ReportDataFromJson(json);
}
