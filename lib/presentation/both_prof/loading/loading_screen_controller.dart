import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../utils/globals.dart';
import '../../business_prof/admin_panel/admin_panel.dart';
import '../../indi_prof/bottombar/bottom_bar.dart';
import '../onboarding/onboarding_screen.dart';
import '../register/register_screen.dart';

part 'loading_screen_controller.g.dart';

@riverpod
class LoadingScreenController extends _$LoadingScreenController {
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    Future.delayed(const Duration(seconds: 2), () {
      PreferenceManagerUtils.getIsOnboarding().then((onBoard) {
        //  print("here");
        // if (value == true) {
        PreferenceManagerUtils.getIsLogin().then((isLogin) {
          // print("here1");
          PreferenceManagerUtils.getIsIndividual().then((isIndividual) {
            PreferenceManagerUtils.getAsGuest().then((asGuest) {
              //    print("here2 $onBoard $isLogin $isIndividual $asGuest");
              switch (onBoard) {
                case true:
                  //    print("here3");
                  switch (isLogin) {
                    case true:
                      // print("here4");
                      Navigator.pushAndRemoveUntil(
                          Globals.navigatorKey.currentContext!,
                          PageTransition(
                              child: isIndividual == 1
                                  ? BottomBar(index: 0)
                                  : isIndividual == 2
                                      ? const AdminPanel()
                                      : const RegisterScreen(),
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                      break;
                    case false:
                      // print("here5");
                      switch (asGuest) {
                        case true:
                          //    print("here6");
                          Navigator.pushAndRemoveUntil(
                              Globals.navigatorKey.currentContext!,
                              PageTransition(
                                  child: isIndividual == 1
                                      ? BottomBar(index: 0)
                                      : isIndividual == 2
                                          ? const AdminPanel()
                                          : const RegisterScreen(),
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 400)),
                              (Route<dynamic> route) => false);
                          break;
                        case false:
                          //  print("here7");
                          Navigator.pushAndRemoveUntil(
                              Globals.navigatorKey.currentContext!,
                              PageTransition(
                                  child: const RegisterScreen(),
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 400)),
                              (Route<dynamic> route) => false);
                          break;
                        case null:
                          //       print("here8");
                          Navigator.pushAndRemoveUntil(
                              Globals.navigatorKey.currentContext!,
                              PageTransition(
                                  child: const RegisterScreen(),
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 400)),
                              (Route<dynamic> route) => false);
                          break;
                        default:
                          //   print("here9");
                          Navigator.pushAndRemoveUntil(
                              Globals.navigatorKey.currentContext!,
                              PageTransition(
                                  child: const RegisterScreen(),
                                  type: PageTransitionType.fade,
                                  duration: const Duration(milliseconds: 400)),
                              (Route<dynamic> route) => false);
                          break;
                      }
                      break;
                    case null:
                      //  print("here10");
                      Navigator.pushAndRemoveUntil(
                          Globals.navigatorKey.currentContext!,
                          PageTransition(
                              child: const RegisterScreen(),
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                      break;
                    default:
                      // print("here11");
                      Navigator.pushAndRemoveUntil(
                          Globals.navigatorKey.currentContext!,
                          PageTransition(
                              child: const RegisterScreen(),
                              type: PageTransitionType.fade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                      break;
                  }
                  break;
                case false:
                  //  print("here12");
                  Navigator.pushAndRemoveUntil(
                      Globals.navigatorKey.currentContext!,
                      PageTransition(
                          child: const OnBoardingScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 400)),
                      (Route<dynamic> route) => false);
                  break;
                case null:
                  //   print("here13");
                  Navigator.pushAndRemoveUntil(
                      Globals.navigatorKey.currentContext!,
                      PageTransition(
                          child: const OnBoardingScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 400)),
                      (Route<dynamic> route) => false);
                  break;
                default:
                  //   print("here14");
                  Navigator.pushAndRemoveUntil(
                      Globals.navigatorKey.currentContext!,
                      PageTransition(
                          child: const OnBoardingScreen(),
                          type: PageTransitionType.fade,
                          duration: const Duration(milliseconds: 400)),
                      (Route<dynamic> route) => false);
                  break;
              }
            });
          });
        });
      });
    });
    state = const AsyncValue.data(null);
  }
}
