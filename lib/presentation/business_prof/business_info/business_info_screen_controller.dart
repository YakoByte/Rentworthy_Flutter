import 'package:flutter/material.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../application/validate/validate.dart';

part 'business_info_screen_controller.g.dart';

@riverpod
class BusinessInfoScreenController extends _$BusinessInfoScreenController {
  bool _verified = false;

  bool get verified => _verified;
  bool _underreview = false;

  bool get underreview => _underreview;
  bool _banned = false;

  bool get banned => _banned;

  TextEditingController businessnameController = TextEditingController();
  TextEditingController einIdController = TextEditingController();
  TextEditingController priceController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _issubmit = false;

  bool get issubmit => _issubmit;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

  onVerified({required bool val}) async {
    state = const AsyncLoading();
    // debugPrint('_verified $val');
    _verified = val;
    Navigator.pop(Globals.navigatorKey.currentContext!);
    state = const AsyncValue.data(null);
  }

  onCont() async {
    state = const AsyncLoading();
    _issubmit = true;
    if (validate(businessnameController.text) == null &&
        validate(businessnameController.text) == null &&
        validate(businessnameController.text) == null &&
        validate(businessnameController.text) == null &&
        validate(businessnameController.text) == null &&
        validate(businessnameController.text) == null) {
      _isLoading = true;
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        ref.read(dialogServiceProvider).profileCreatedDialog(
          profVerified: (verified) {
            onVerified(val: verified);
          },
        );
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  onUnderReview({required bool val}) async {
    state = const AsyncLoading();
    // debugPrint('onUnderReview $val');
    _underreview = val;
    state = const AsyncValue.data(null);
  }

  onBanned({required bool val}) async {
    state = const AsyncLoading();
    // debugPrint('onBanned $val');
    _banned = val;
    state = const AsyncValue.data(null);
  }
}
