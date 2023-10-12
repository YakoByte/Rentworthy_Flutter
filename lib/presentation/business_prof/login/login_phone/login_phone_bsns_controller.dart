import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/business_prof/login/acc_verification/account_verification_bsns.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/validate/validate.dart';
import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/globals.dart';
import '../../../indi_prof/bottombar/bottom_bar.dart';
import '../../admin_panel/admin_panel.dart';
import '../otp_detect/detect_otp_bsns.dart';

part 'login_phone_bsns_controller.g.dart';

@riverpod
class BusinessLoginPhoneController extends _$BusinessLoginPhoneController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _issubmit = false;

  bool get issubmit => _issubmit;
  bool _iseyehide = false;

  bool get iseyehide => _iseyehide;

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
              child: BusinessAccountVerification(
                email: countryCodeController.text + phoneController.text,
              ));
        } else if (index == 1) {
          commonNavigator(
            context: Globals.navigatorKey.currentContext!,
            child: BusinessAccountVerification(
              email: emailController.text,
            ),
            type: PageTransitionType.rightToLeftWithFade,
          );
        } else if (index == 2) {
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: const AdminPanel(),
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 400)),
              (Route<dynamic> route) => false);
        } else if (index == 3) {
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: const AdminPanel(),
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
