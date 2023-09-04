import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../data/shared_pref/shared_pref.dart';
import '../../../utils/globals.dart';

import '../onboarding/onboarding_screen.dart';
import '../register/register_screen.dart';

part 'loading_screen_controller.g.dart';

@riverpod
class LoadingScreenController extends _$LoadingScreenController {
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    Future.delayed(const Duration(seconds: 2), () {
      PreferenceManagerUtils.getIsOnboarding().then((value) {
        if (value == true) {
          print("Loading Screen");
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: const RegisterScreen(),
                  type: PageTransitionType.fade,
                  duration: const Duration(milliseconds: 400)),
              (Route<dynamic> route) => false);
        } else {
          print("Loading Screen1");
          Navigator.pushAndRemoveUntil(
              Globals.navigatorKey.currentContext!,
              PageTransition(
                  child: const OnBoardingScreen(),
                  type: PageTransitionType.rightToLeftWithFade,
                  duration: const Duration(milliseconds: 400)),
              (Route<dynamic> route) => false);
        }
      });
    });
    state = const AsyncValue.data(null);
  }
}
