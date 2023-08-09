import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentworthy/presentation/loading/login/login_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../application/onboarding/onboarding_service.dart';
import '../../../data/onboarding/shared_pref/shared_pref.dart';
import '../../../model/onboarding/onboarding.dart';
import '../../../utils/common_components/common_navigator.dart';

part 'onboarding_screen_controller.freezed.dart';
part 'onboarding_screen_controller.g.dart';

@freezed
class OnBoardingScreenState with _$OnBoardingScreenState {
  const factory OnBoardingScreenState({
    required List<OnBoardingitem>? onBoardinglist,
    required PageController? pageController,
    required int? currentpageIndex,
  }) = _OnBoardingScreenState;

  const OnBoardingScreenState._();
}

@riverpod
class OnBoardingScreenController extends _$OnBoardingScreenController {
  PageController pageController = PageController(initialPage: 0);
  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  @override
  FutureOr<OnBoardingScreenState> build() async {
    state = const AsyncLoading();
    List<OnBoardingitem>? onBoardinglist =
        await ref.watch(onBoardingServiceProvider).getboardingdata();

    return OnBoardingScreenState(
        onBoardinglist: onBoardinglist!,
        pageController: pageController,
        currentpageIndex: currentpageIndex);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = AsyncValue.data(
        state.value!.copyWith(currentpageIndex: currentpageIndex));
  }

  onBtnTap() async {
    state = const AsyncLoading();
    if (currentpageIndex == 2) {
      PreferenceManagerUtils.setIsOnboarding(true);
      CommonNavigatior(child: LoginScreen());
    } else {
      pageController.animateToPage(currentpageIndex + 1,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOutCubic);
      currentpageIndex++;
    }

    state = AsyncValue.data(
        state.value!.copyWith(currentpageIndex: currentpageIndex));
  }
}
