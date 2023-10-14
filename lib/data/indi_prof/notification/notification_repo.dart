import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../model/indi_prof/notification/get_notification/get_notification.dart';

abstract class NotificationRepository {
  Future<GetNotification?> getNotificationData();
}

class NotificationRepositoryV1 extends NotificationRepository {
  @override
  Future<GetNotification?> getNotificationData() async {
    return const GetNotification(
        success: true,
        message: "OK",
        recommendations: true,
        receive_update_offer: false);
  }
}

final notificationRepositoryProvider =
    Provider<NotificationRepository>((ref) => NotificationRepositoryV1());
