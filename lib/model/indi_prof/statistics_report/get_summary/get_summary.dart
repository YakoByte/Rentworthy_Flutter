import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_summary.freezed.dart';

part 'get_summary.g.dart';

@freezed
abstract class GetSummary with _$GetSummary {
  const factory GetSummary({
    required bool? success,
    required String? message,
    required String? active_rental,
    required String? requests,
    required String? rented,
    required String? requested,
  }) = _GetSummary;

  factory GetSummary.fromJson(Map<String, dynamic> json) =>
      _$GetSummaryFromJson(json);
}
