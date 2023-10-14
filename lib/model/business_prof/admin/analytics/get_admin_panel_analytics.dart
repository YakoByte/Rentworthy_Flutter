import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_admin_panel_analytics.freezed.dart';

part 'get_admin_panel_analytics.g.dart';

@freezed
abstract class AnalyticsResponse with _$AnalyticsResponse {
  const factory AnalyticsResponse({
    required bool? success,
    required String? message,
    required List<AnalyticsData>? data,
  }) = _AnalyticsResponse;

  factory AnalyticsResponse.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsResponseFromJson(json);
}

@freezed
abstract class AnalyticsData with _$AnalyticsData {
  const factory AnalyticsData({
    required String? title,
    required String? total_value,
    required String? percent,
  }) = _AnalyticsData;

  factory AnalyticsData.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsDataFromJson(json);
}
