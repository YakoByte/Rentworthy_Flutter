import 'dart:async';

import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/both_prof/login/login_service.dart';
import '../../../../application/dialog/dialog_service.dart';
import '../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../../utils/import_utils.dart';
import '../../admin_panel/admin_panel.dart';

part 'account_verification_bsns_controller.freezed.dart';
part 'account_verification_bsns_controller.g.dart';

@freezed
class BusinessAccountVerificationState with _$BusinessAccountVerificationState {
  const factory BusinessAccountVerificationState({
    int? start,
  }) = _BusinessAccountVerificationState;

  const BusinessAccountVerificationState._();
}

@riverpod
class BusinessAccountVerificationController
    extends _$BusinessAccountVerificationController {
  Timer? timer;
  int _start = 60;
  bool _isVerify = false;

  TextEditingController? otpController;

  bool get isVerify => _isVerify;

  PinTheme? isPinTheme;

  @override
  FutureOr<BusinessAccountVerificationState> build() async {
    state = const AsyncLoading();

    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    otpController = TextEditingController();
    initSmsListener();
    isPinTheme = PinTheme(
      height: h * 0.06,
      width: h * 0.06,
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(4),
        color: AppColors.white,
        border: Border.all(color: AppColors.black, width: 1),
      ),
      padding: EdgeInsets.zero,
      textStyle: ptSansTextStyle(
          fontSize: w * 0.04,
          color: AppColors.black,
          fontWeight: FontWeight.w700),
      margin: EdgeInsets.zero,
    );
    ref.onDispose(() {
      //  timer!.cancel();
    });

    return BusinessAccountVerificationState(start: _start);
  }

  Future<void> initSmsListener() async {
    String? comingSms;
    try {
      comingSms = await AltSmsAutofill().listenForSms;
    } on PlatformException {
      comingSms = 'Failed to get Sms.';
      //   print('PlatformExceptionfromcomingsmss ${comingSms}');
    }

    otpController!.text = comingSms![0] +
        comingSms[1] +
        comingSms[2] +
        comingSms[3] +
        comingSms[4] +
        comingSms[5];
    // print('textEditingController1.text ${comingSms}');
    //  print('textEditingController1.text ${otpController!.text}');
    //  print(
    //      'textEditingController1.text2 ${comingSms[34] + comingSms[35] + comingSms[36] + comingSms[37]}');
  }

  void onVerify({required String verificationId}) {
    state = const AsyncLoading();

    if (_isVerify == true) {
      _isVerify = false;
    } else {
      // _isVerify = true;
      ref.read(loginServiceProvider).verifyOTP(
          verificationId: verificationId, smsCode: otpController!.text);
      DialogServiceV1().showSnackBar(
          content: "User Logged-in Successfully!!",
          color: AppColors.colorPrimary.withOpacity(0.7),
          textclr: AppColors.white);
      PreferenceManagerUtils.setIsLogin(true);
      PreferenceManagerUtils.setIsIndividual(2);
      Navigator.pushAndRemoveUntil(
          Globals.navigatorKey.currentContext!,
          PageTransition(
              child: const AdminPanel(),
              type: PageTransitionType.rightToLeftWithFade,
              duration: const Duration(milliseconds: 400)),
          (Route<dynamic> route) => false);
      // startTimer();
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
          // print("_start $_start");
          // print("_timer ${timer!.tick}");
          // print("_timer ${((timer!.tick * 1) / 10).toStringAsFixed(1)}");

          if (timer!.tick > 3) {
            timer!.cancel();
            // commonNavigator(
            //   context: Globals.navigatorKey.currentContext!,
            //   child: AdminPanel(),
            //   type: PageTransitionType.rightToLeftWithFade,
            // );
          }
        }
        state = AsyncValue.data(state.value!.copyWith(start: _start));
      },
    );

    state = const AsyncLoading();
  }
}
