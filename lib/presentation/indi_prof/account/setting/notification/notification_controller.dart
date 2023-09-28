import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  bool _switched = false;

  bool get isSwitched => _switched;

  bool _recswitched = false;

  bool get isrecSwitched => _recswitched;

  @override
  FutureOr<void> build() async {}

  onSwitchTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onEyeTap $val');
    _switched = val;

    state = const AsyncValue.data(null);
  }

  onSwitchrecTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onSwitchrecTap $val');
    _recswitched = val;

    state = const AsyncValue.data(null);
  }
}
