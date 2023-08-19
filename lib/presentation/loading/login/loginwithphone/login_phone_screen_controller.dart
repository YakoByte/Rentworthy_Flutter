import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/onboarding/validate/validate.dart';
import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/globals.dart';
import 'otp_detect/detect_otp.dart';

part 'login_phone_screen_controller.g.dart';

@riverpod
class LoginPhoneScreenController extends _$LoginPhoneScreenController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");

  bool _issubmit = false;

  bool get issubmit => _issubmit;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    // _issendotp = false;
    state = const AsyncValue.data(null);
  }

  onSendOtp() async {
    state = const AsyncLoading();
    debugPrint('onSendOtp');
    _issubmit = true;
    if (validatephone(phoneController.text) == null) {
      state = const AsyncValue.data(null);
      FocusScope.of(Globals.navigatorKey.currentContext!)
          .requestFocus(FocusNode());
      commonNavigator(
          type: PageTransitionType.rightToLeftWithFade,
          context: Globals.navigatorKey.currentContext!,
          child: DetectOtp(
            phoneNo: countryCodeController.text + phoneController.text,
          ));
    }

    debugPrint('onSendOtp1');
    state = const AsyncValue.data(null);
  }
}
