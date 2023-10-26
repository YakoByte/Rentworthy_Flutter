import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/both_prof/login/login_service.dart';
import '../../../../application/dialog/dialog_service.dart';
import '../../../../application/validate/validate.dart';
import '../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../../utils/color.dart';
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

  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;
  bool _isEyeHide = false;

  bool get isEyeHide => _isEyeHide;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

  /// This is the function that is called when the eye icon is tapped
  onEyeTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onEyeTap $val');
    _isEyeHide = val;

    state = const AsyncValue.data(null);
  }

  /// This is the function that is called when the submit button is tapped
  onSendOtp({required int index}) async {
    state = const AsyncLoading();
    debugPrint('onSendOtp');
    _isSubmit = true;

    if (validatePhone(phoneController.text) == null ||
        validateEmail(emailController.text) == null ||
        validateEmail(passwordController.text) == null) {
      state = const AsyncValue.data(null);
      _isLoading = true;
      FocusScope.of(Globals.navigatorKey.currentContext!)
          .requestFocus(FocusNode());
      Future.delayed(Duration(seconds: 1), () {
        state = const AsyncLoading();

        if (index == 0) {
          /// Send OTP to the user
          ref.read(loginServiceProvider).sendOTP(
                phoneNumber: countryCodeController.text + phoneController.text,
                verificationCompleted: (PhoneAuthCredential credential) {
                  debugPrint('verificationCompleted');
                },
                verificationFailed: (FirebaseAuthException e) {
                  debugPrint('verificationFailed');
                },
                // codeSent: (String verificationId, int? resendToken) {},
                codeAutoRetrievalTimeout: (String verificationId) {
                  debugPrint('codeAutoRetrievalTimeout');
                },
                // You can use the `codeSent` callback to display the generated OTP to the user
                codeSent: (String verificationId, int? resendToken) {
                  commonNavigator(
                      type: PageTransitionType.rightToLeftWithFade,
                      context: Globals.navigatorKey.currentContext!,
                      child: AccountVerification(
                        email:
                            countryCodeController.text + phoneController.text,
                      ));
                  debugPrint('Verification code: $verificationId');
                },
              );
        } else if (index == 1) {
          /// Google Sign-in
          commonNavigator(
            context: Globals.navigatorKey.currentContext!,
            child: AccountVerification(
              email: emailController.text,
            ),
            type: PageTransitionType.rightToLeftWithFade,
          );
        } else if (index == 2) {
          /// Apple Sign-in
          DialogServiceV1().showSnackBar(
              content: "User Logged-in Successfully!!",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);
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
          /// Facebook Sign-in
          DialogServiceV1().showSnackBar(
              content: "User Logged-in Successfully!!",
              color: AppColors.colorPrimary.withOpacity(0.7),
              textclr: AppColors.white);

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
