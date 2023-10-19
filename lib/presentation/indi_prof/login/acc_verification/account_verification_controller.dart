import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_navigator.dart';
import '../../../../../utils/globals.dart';
import '../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../indi_prof/bottombar/bottom_bar.dart';

part 'account_verification_controller.freezed.dart';

part 'account_verification_controller.g.dart';

@freezed
class AccountVerificationState with _$AccountVerificationState {
  const factory AccountVerificationState({
    int? start,
  }) = _AccountVerificationState;

  const AccountVerificationState._();
}

@riverpod
class AccountVerificationController extends _$AccountVerificationController {
  Timer? timer;
  int _start = 60;
  bool _isVerify = false;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  TextEditingController otpController = TextEditingController();

  bool get isVerify => _isVerify;

  PinTheme? isPinTheme;

  @override
  FutureOr<AccountVerificationState> build() async {
    state = const AsyncLoading();
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;

    isPinTheme = PinTheme(
      shape: PinCodeFieldShape.box,
      borderRadius: BorderRadius.circular(4),
      borderWidth: 1,
      fieldOuterPadding: EdgeInsets.zero,
      activeFillColor: AppColors.white,
      activeBorderWidth: 1,
      activeBoxShadow: [
        BoxShadow(
          color: AppColors.black.withOpacity(0.1),
          blurRadius: 0,
          spreadRadius: 0,
          offset: const Offset(0, 0),
        )
      ],
      selectedFillColor: AppColors.white,
      selectedColor: AppColors.black,
      inactiveFillColor: AppColors.white,
      errorBorderColor: AppColors.red,
      activeColor: AppColors.black,
      inactiveColor: AppColors.black,
      fieldHeight: h * 0.08,
      fieldWidth: h * 0.08,
      disabledColor: AppColors.white,
    );
    ref.onDispose(() {
      timer!.cancel();
    });
    return AccountVerificationState(start: _start);
  }

  void onVerify() {
    state = const AsyncLoading();

    if (_isVerify == true) {
      _isVerify = false;
      _isLoading = false;
    } else {
      _isLoading = true;
      Future.delayed(Duration(seconds: 1), () {
        state = const AsyncLoading();
        _isVerify = true;
        startTimer();
        _isLoading = false;
        state = AsyncValue.data(state.value!.copyWith(start: _start));
      });
    }

    state = AsyncValue.data(state.value!.copyWith(start: _start));
  }

  void startTimer() {
    state = const AsyncLoading();
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          // timer.cancel();
          FocusScope.of(Globals.navigatorKey.currentContext!)
              .requestFocus(FocusNode());
        } else {
          _start--;
          print("_start $_start");
          print("_timer ${timer.tick}");
          print("_timer ${((timer.tick * 1) / 10).toStringAsFixed(1)}");

          if (timer.tick > 3) {
            timer.cancel();
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
        }
        state = AsyncValue.data(state.value!.copyWith(start: _start));
      },
    );

    state = const AsyncLoading();
  }
}
