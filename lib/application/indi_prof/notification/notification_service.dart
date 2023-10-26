import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/indi_prof/notification/notification_repo.dart';
import '../../../model/indi_prof/notification/get_notification/get_notification.dart';

abstract class NotificationService {
  Future<GetNotification?> getNotificationData();
}

class NotificationServiceV1 implements NotificationService {
  NotificationServiceV1(
    this.notificationRepository,
  );

  final NotificationRepository notificationRepository;

  @override
  Future<GetNotification?> getNotificationData() async {
    return await notificationRepository.getNotificationData();
  }
}

final notificationServiceProvider =
    Provider.autoDispose<NotificationService>((ref) {
  final service = NotificationServiceV1(
    ref.watch(notificationRepositoryProvider),
  );
  return service;
});
