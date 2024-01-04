import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_controller.g.dart';

@riverpod
class NotificationController extends _$NotificationController {
  bool _switched = false;

  bool get isSwitched => _switched;

  bool _recswitched = false;

  bool get isrecSwitched => _recswitched;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      state = const AsyncValue.data(null);
    });
    state = const AsyncValue.data(null);
  }

  /// onSwitchTap
  onSwitchTap({required bool val}) async {
    state = const AsyncLoading();
    // debugPrint('onEyeTap $val');
    _switched = val;

    state = const AsyncValue.data(null);
  }

  /// onSwitchrecTap
  onSwitchrecTap({required bool val}) async {
    state = const AsyncLoading();
    //  debugPrint('onSwitchrecTap $val');
    _recswitched = val;

    state = const AsyncValue.data(null);
  }
}
