import 'package:flutter/material.dart';
import 'package:rentworthy/application/validate/validate.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/import_utils.dart';

part 'create_password_controller.g.dart';

@riverpod
class CreatePasswordController extends _$CreatePasswordController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool _iseyehide = false;

  bool get iseyehide => _iseyehide;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  bool _confirmiseyehide = false;

  bool get isconfirmeyehide => _confirmiseyehide;

  @override
  FutureOr<void> build() async {}

  /// This method is used to hide and show password
  onEyeTap({required bool val}) async {
    state = const AsyncLoading();
    // debugPrint('onEyeTap $val');
    _iseyehide = val;

    state = const AsyncValue.data(null);
  }

  /// This method is used to save password
  onSave() async {
    state = const AsyncLoading();
    _isSubmit = true;

    if (validatePassword(passwordController.text) == null &&
        validateConfirmPassword(
                confirmpasswordController.text, passwordController.text) ==
            null) {
      _isLoading = true;
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        Navigator.pop(Globals.navigatorKey.currentContext!);

        state = const AsyncValue.data(null);
      });
      state = const AsyncValue.data(null);
    }

    state = const AsyncValue.data(null);
  }

  /// This method is used to hide and show confirm password
  onconfirmEyeTap({required bool val}) async {
    state = const AsyncLoading();
    //  debugPrint('onEyeTap $val');
    _confirmiseyehide = val;

    state = const AsyncValue.data(null);
  }
}
