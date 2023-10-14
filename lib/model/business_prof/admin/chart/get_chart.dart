import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_chart.freezed.dart';

part 'get_chart.g.dart';

@freezed
abstract class GetChart with _$GetChart {
  const factory GetChart({
    required bool? success,
    required String? message,
    required List<GetChartData>? data,
  }) = _GetChart;

  factory GetChart.fromJson(Map<String, dynamic> json) =>
      _$GetChartFromJson(json);
}

@freezed
abstract class GetChartData with _$GetChartData {
  const factory GetChartData({
    required String? xVal,
    required String? yVal,
    required String? type,
  }) = _GetChartData;

  factory GetChartData.fromJson(Map<String, dynamic> json) =>
      _$GetChartDataFromJson(json);
}
