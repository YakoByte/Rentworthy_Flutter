import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'create_password_controller.g.dart';

@riverpod
class CreatePasswordController extends _$CreatePasswordController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool _iseyehide = false;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool get iseyehide => _iseyehide;
  bool _confirmiseyehide = false;

  bool get isconfirmeyehide => _confirmiseyehide;

  @override
  FutureOr<void> build() async {}

  onEyeTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onEyeTap $val');
    _iseyehide = val;

    state = const AsyncValue.data(null);
  }

  onSave() async {
    state = const AsyncLoading();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      state = const AsyncValue.data(null);
    });
    state = const AsyncValue.data(null);
  }

  onconfirmEyeTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onEyeTap $val');
    _confirmiseyehide = val;

    state = const AsyncValue.data(null);
  }
}
