import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_navigator.dart';
import '../../../../../utils/globals.dart';
import '../../../bottombar/bottom_bar.dart';

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

  TextEditingController otpController = TextEditingController();

  bool get isVerify => _isVerify;

  PinTheme? isPinTheme;

  @override
  FutureOr<AccountVerificationState> build() async {
    state = const AsyncLoading();
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;

    isPinTheme = PinTheme(
      width: h * 0.08,
      height: h * 0.08,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.black),
      ),
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
    } else {
      _isVerify = true;
      startTimer();
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
          timer.cancel();
          FocusScope.of(Globals.navigatorKey.currentContext!)
              .requestFocus(FocusNode());
        } else {
          _start--;
          print("_start $_start");
          print("_timer ${timer!.tick}");
          print("_timer ${((timer!.tick * 1) / 10).toStringAsFixed(1)}");

          if (timer!.tick > 3) {
            timer!.cancel();
            commonNavigator(
              context: Globals.navigatorKey.currentContext!,
              child: BottomBar(index: 0),
              type: PageTransitionType.rightToLeftWithFade,
            );
          }
        }
        state = AsyncValue.data(state.value!.copyWith(start: _start));
      },
    );

    state = const AsyncLoading();
  }
}
