import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/validate/validate.dart';
import '../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/globals.dart';
import '../../../both_prof/login/loginwithphone/otp_detect/detect_otp.dart';
import '../../bottombar/bottom_bar.dart';
import '../acc_verification/account_verification.dart';

part 'login_phone_screen_controller.g.dart';

@riverpod
class LoginPhoneScreenController extends _$LoginPhoneScreenController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");

  bool _issubmit = false;

  bool get issubmit => _issubmit;
  bool _iseyehide = false;

  bool get iseyehide => _iseyehide;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    // _issendotp = false;
    state = const AsyncValue.data(null);
  }

  onEyeTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onEyeTap $val');
    _iseyehide = val;

    state = const AsyncValue.data(null);
  }

  onSendOtp({required int index}) async {
    state = const AsyncLoading();
    debugPrint('onSendOtp');
    _issubmit = true;

    if (validatephone(phoneController.text) == null ||
        validateEmail(emailController.text) == null ||
        validateEmail(passwordController.text) == null) {
      state = const AsyncValue.data(null);
      _isLoading = true;
      FocusScope.of(Globals.navigatorKey.currentContext!)
          .requestFocus(FocusNode());
      Future.delayed(Duration(seconds: 1), () {
        state = const AsyncLoading();

        if (index == 0) {
          commonNavigator(
              type: PageTransitionType.rightToLeftWithFade,
              context: Globals.navigatorKey.currentContext!,
              child: DetectOtp(
                phoneNo: countryCodeController.text + phoneController.text,
              ));
        } else if (index == 1) {
          commonNavigator(
            context: Globals.navigatorKey.currentContext!,
            child: AccountVerification(
              email: emailController.text,
            ),
            type: PageTransitionType.rightToLeftWithFade,
          );
        } else if (index == 2) {
          PreferenceManagerUtils.setIsLogin(true);
          PreferenceManagerUtils.setIsIndividual(1);
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: BottomBar(index: 0),
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 400)),
              (Route<dynamic> route) => false);
        } else if (index == 3) {
          PreferenceManagerUtils.setIsLogin(true);
          PreferenceManagerUtils.setIsIndividual(1);
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: BottomBar(index: 0),
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 400)),
              (Route<dynamic> route) => false);
        }
        Future.delayed(Duration(seconds: 1), () {
          _isLoading = false;
        });
        state = const AsyncValue.data(null);
      });
    }

    debugPrint('onSendOtp1');
    state = const AsyncValue.data(null);
  }
}
