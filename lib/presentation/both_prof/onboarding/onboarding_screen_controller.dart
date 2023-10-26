import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/onboarding/onboarding_service.dart';
import '../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../model/onboarding/onboarding.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/globals.dart';
import '../register/register_screen.dart';

part 'onboarding_screen_controller.freezed.dart';

part 'onboarding_screen_controller.g.dart';

@freezed
class OnBoardingScreenState with _$OnBoardingScreenState {
  const factory OnBoardingScreenState({
    required List<OnBoardingitem>? onBoardingList,
    required PageController? pageController,
    required int? currentPageIndex,
  }) = _OnBoardingScreenState;

  const OnBoardingScreenState._();
}

@riverpod
class OnBoardingScreenController extends _$OnBoardingScreenController {
  PageController pageController = PageController(initialPage: 0);
  int currentPageIndex = 0;

  int get getCurrentPageIndex => currentPageIndex;

  @override
  FutureOr<OnBoardingScreenState> build() async {
    state = const AsyncLoading();

    /// Get the onBoarding data from the [OnBoardingService]
    List<OnBoardingitem>? onBoardingList =
        await ref.watch(onBoardingServiceProvider).getBoardingData();

    return OnBoardingScreenState(
        onBoardingList: onBoardingList!,
        pageController: pageController,
        currentPageIndex: currentPageIndex);
  }

  /// This method is called when the [PageView] is changed
  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentPageIndex = index;
    state = AsyncValue.data(
        state.value!.copyWith(currentPageIndex: currentPageIndex));
  }

  /// This method is called when the [Get Started] button is tapped
  onBtnTap() async {
    state = const AsyncLoading();
    if (currentPageIndex == 2) {
      /// Set the onBoarding to false
      PreferenceManagerUtils.setIsOnboarding(true);
      FocusScope.of(Globals.navigatorKey.currentContext!)
          .requestFocus(FocusNode());

      /// Navigate to the [RegisterScreen]
      Navigator.pushAndRemoveUntil(
          Globals.navigatorKey.currentContext!,
          PageTransition(
              child: const RegisterScreen(),
              type: PageTransitionType.fade,
              duration: const Duration(milliseconds: 400)),
          (Route<dynamic> route) => false);
    } else {
      /// Animate to the next page
      pageController.animateToPage(currentPageIndex + 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic);
      currentPageIndex++;
    }

    state = AsyncValue.data(
        state.value!.copyWith(currentPageIndex: currentPageIndex));
  }
}
