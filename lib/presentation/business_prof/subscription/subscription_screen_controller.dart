import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'subscription_screen_controller.g.dart';

@riverpod
class SubscriptionController extends _$SubscriptionController {
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    state = const AsyncValue.data(null);
  }
}
