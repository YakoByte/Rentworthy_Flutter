import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_notification.freezed.dart';

part 'get_notification.g.dart';

@freezed
abstract class GetNotification with _$GetNotification {
  const factory GetNotification({
    required bool? success,
    required String? message,
    required bool? recommendations,
    required bool? receive_update_offer,
  }) = _GetNotification;

  factory GetNotification.fromJson(Map<String, dynamic> json) =>
      _$GetNotificationFromJson(json);
}
