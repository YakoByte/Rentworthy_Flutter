import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_method_screen_controller.g.dart';

@riverpod
class LoginMethodScreenController extends _$LoginMethodScreenController {
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    state = const AsyncValue.data(null);
  }
}
