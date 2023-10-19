import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/indi_prof/home/home_screen.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/both_prof/register/register_service.dart';
import '../../../application/validate/validate.dart';
import '../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../utils/common_components/common_tickerprovider.dart';
import '../../business_prof/admin_panel/admin_panel.dart';
import '../../indi_prof/bottombar/bottom_bar.dart';

part 'register_screen_controller.g.dart';

@riverpod
class RegisterScreenController extends _$RegisterScreenController {
  bool _isbusinessreg = false;

  late TabController tabController;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  bool get isbusinessreg => _isbusinessreg;
  bool _iseyehide = false;

  bool get iseyehide => _iseyehide;
  bool _issignin = false;

  bool get issignin => _issignin;
  int _selectedTab = 0;

  int get selectedtab => _selectedTab;

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

  onRegister() async {
    //  state = const AsyncLoading();
    _isSubmit = true;
    FocusScope.of(Globals.navigatorKey.currentContext!)
        .requestFocus(FocusNode());
    debugPrint('onRegister');
    if (validateEmail(emailController.text) == null &&
        validatePassword(passController.text) == null) {
      _isLoading = true;
      User? user = await ref
          .read(registerServiceProvider)
          .signInWithEmailAndPassword(
              email: emailController.text, password: passController.text);
      debugPrint('useruser $user');
      if (user != null) {
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
        //           child:,
        //           type: PageTransitionType.rightToLeftWithFade,
        //           duration: const Duration(milliseconds: 400)),
        //       (Route<dynamic> route) => false);
        // }
      }
      _isLoading = false;
    }
    state = const AsyncValue.data(null);
  }

  onRegtype({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onRegtype $val');
    _isbusinessreg = val;

    state = const AsyncValue.data(null);
  }

  onisSignin({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onisSignin $val');
    _issignin = val;
    if (val == true) {
      _isLoading = true;
      Future.delayed(Duration(seconds: 1), () {
        state = const AsyncLoading();
        _isLoading = false;
        state = const AsyncValue.data(null);
      });
    }

    state = const AsyncValue.data(null);
  }

  onEyeTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onEyeTap $val');
    _iseyehide = val;

    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }
}
