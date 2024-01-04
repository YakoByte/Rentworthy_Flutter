import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/application/both_prof/login/login_service.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/both_prof/register/register_service.dart';
import '../../../application/dialog/dialog_service.dart';
import '../../../application/validate/validate.dart';
import '../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../utils/common_components/common_tickerprovider.dart';
import '../../../utils/import_utils.dart';
import '../../business_prof/admin_panel/admin_panel.dart';
import '../../indi_prof/bottombar/bottom_bar.dart';
import '../../indi_prof/login/acc_verification/account_verification.dart';

part 'register_screen_controller.g.dart';

@riverpod
class RegisterScreenController extends _$RegisterScreenController {
  late TabController tabController;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  bool _isEyeHide = false;

  bool get isEyeHide => _isEyeHide;
  bool _isSignIn = false;

  bool get isSignIn => _isSignIn;
  int _selectedTab = 0;

  int get selectedTab => _selectedTab;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: CommonTickerProvider(),
    );

    state = const AsyncValue.data(null);
  }

  /// onRegister
  onRegister() async {
    //  state = const AsyncLoading();
    _isSubmit = true;
    FocusScope.of(Globals.navigatorKey.currentContext!)
        .requestFocus(FocusNode());
    // debugPrint('onRegister');

    if (validateEmail(emailController.text) == null &&
        validatePassword(passController.text) == null) {
      _isLoading = true;

      Map<String, dynamic>? user =
          await ref.read(registerServiceProvider).registerWithEmailAndPassword(
                email: emailController.text,
                password: passController.text,
                phoneNo: '',
                businessType: _selectedTab == 0 ? "individual" : "company",
                loginType: 'regular',
              );

      // debugPrint('useruser $user');
      if (user!['_id'] != null) {
        onisSignin(val: true);
        Map<String, dynamic>? otp = await ref
            .read(registerServiceProvider)
            .createOTP(email: emailController.text);
        // PreferenceManagerUtils.setIsLogin(true);
        // PreferenceManagerUtils.setIsIndividual(_selectedTab == 0 ? 1 : 2);
        // // if () {
        //
        // Navigator.pushAndRemoveUntil(
        //     Globals.navigatorKey.currentContext!,
        //     PageTransition(
        //         child: _selectedTab == 0
        //             ? BottomBar(index: 0)
        //             : const AdminPanel(),
        //         type: PageTransitionType.rightToLeftWithFade,
        //         duration: const Duration(milliseconds: 400)),
        //     (Route<dynamic> route) => false);
        // } else if (_selectedTab == 1) {
        //   Navigator.pushAndRemoveUntil(
        //       Globals.navigatorKey.currentContext!,
        //       PageTransition(
        //           child:,
        //           type: PageTransitionType.rightToLeftWithFade,
        //           duration: const Duration(milliseconds: 400)),
        //       (Route<dynamic> route) => false);
        // }
        if (otp!['existingOTP']["otp"] != '') {
          commonNavigator(
              type: PageTransitionType.rightToLeftWithFade,
              context: Globals.navigatorKey.currentContext!,
              child: AccountVerification(
                // verificationId: verificationId,
                email: emailController.text,
              ));
        }
      }
      _isLoading = false;
    }
    state = const AsyncValue.data(null);
  }

  // /// onSocialRegister
  // onSocialRegister() async {
  //   //  state = const AsyncLoading();
  //   _isSubmit = true;
  //   FocusScope.of(Globals.navigatorKey.currentContext!)
  //       .requestFocus(FocusNode());
  //   debugPrint('onSocialRegister');
  //
  //   if (validateEmail(emailController.text) == null &&
  //       validatePassword(passController.text) == null) {
  //     _isLoading = true;
  //
  //     Map<String, dynamic>? user =
  //     await ref.read(registerServiceProvider).registerWithSocial(email: email, phoneNo: phoneNo, businessType: businessType, loginType: loginType);
  //
  //     debugPrint('useruser $user');
  //
  //     _isLoading = false;
  //   }
  //   state = const AsyncValue.data(null);
  // }
  /// onSignIn
  onSignIn() async {
    //  state = const AsyncLoading();
    _isSubmit = true;
    FocusScope.of(Globals.navigatorKey.currentContext!)
        .requestFocus(FocusNode());
    // debugPrint('onSignIn');

    if (validateEmail(emailController.text) == null &&
        validatePassword(passController.text) == null) {
      _isLoading = true;

      Map<String, dynamic>? user =
          await ref.read(loginServiceProvider).loginWithEmailAndPassword(
                email: emailController.text,
                password: passController.text,
                phoneNo: '',
              );

      // debugPrint('useruser $user');
      if (user!['token'] != null) {
        PreferenceManagerUtils.setIsLogin(true);
        PreferenceManagerUtils.setIsIndividual(_selectedTab == 0 ? 1 : 2);
        // if () {

        Navigator.pushAndRemoveUntil(
            Globals.navigatorKey.currentContext!,
            PageTransition(
                child: _selectedTab == 0
                    ? BottomBar(index: 0)
                    : const AdminPanel(),
                type: PageTransitionType.rightToLeftWithFade,
                duration: const Duration(milliseconds: 400)),
            (Route<dynamic> route) => false);
        // } else if (_selectedTab == 1) {
        //   Navigator.pushAndRemoveUntil(
        //       Globals.navigatorKey.currentContext!,
        //       PageTransition(
        //           child: ,
        //           type: PageTransitionType.rightToLeftWithFade,
        //           duration: const Duration(milliseconds: 400)),
        //       (Route<dynamic> route) => false);
        // }
      }
      _isLoading = false;
    }
    state = const AsyncValue.data(null);
  }

  onContinueasGuest() async {
    state = const AsyncLoading();
    PreferenceManagerUtils.setIsLogin(false);
    PreferenceManagerUtils.setAsGuest(true);
    PreferenceManagerUtils.setIsIndividual(_selectedTab == 0 ? 1 : 2);
    // if () {

    Navigator.pushAndRemoveUntil(
        Globals.navigatorKey.currentContext!,
        PageTransition(
            child: _selectedTab == 0 ? BottomBar(index: 0) : const AdminPanel(),
            type: PageTransitionType.rightToLeftWithFade,
            duration: const Duration(milliseconds: 400)),
        (Route<dynamic> route) => false);
    state = const AsyncValue.data(null);
  }

  /// onisSignin
  onisSignin({required bool val}) async {
    state = const AsyncLoading();
    // debugPrint('onisSignin $val');
    _isSignIn = val;
    if (val == true) {
      // _isLoading = true;
      Future.delayed(const Duration(seconds: 1), () {
        state = const AsyncLoading();
        // _isLoading = false;
        state = const AsyncValue.data(null);
      });
    }

    state = const AsyncValue.data(null);
  }

  /// onEyeTap
  onEyeTap({required bool val}) async {
    state = const AsyncLoading();
    // debugPrint('onEyeTap $val');
    _isEyeHide = val;

    state = const AsyncValue.data(null);
  }

  /// onTabTap
  onTabTap({required int val}) async {
    state = const AsyncLoading();
    // debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }
}
