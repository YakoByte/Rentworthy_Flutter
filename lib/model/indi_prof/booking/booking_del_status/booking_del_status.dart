import 'package:freezed_annotation/freezed_annotation.dart';

part 'booking_del_status.freezed.dart';

part 'booking_del_status.g.dart';

@freezed
abstract class GetBookingDelStatus with _$GetBookingDelStatus {
  const factory GetBookingDelStatus({
    required bool? success,
    required String? message,
    required List<BookingDelStatusData>? data,
  }) = _GetBookingDelStatus;

  factory GetBookingDelStatus.fromJson(Map<String, dynamic> json) =>
      _$GetBookingDelStatusFromJson(json);
}

@freezed
abstract class BookingDelStatusData with _$BookingDelStatusData {
  const factory BookingDelStatusData({
    required String? status,
    required String? desc,
    required String? date,
    required bool? active_status,
  }) = _BookingDelStatusData;

  factory BookingDelStatusData.fromJson(Map<String, dynamic> json) =>
      _$BookingDelStatusDataFromJson(json);
}
