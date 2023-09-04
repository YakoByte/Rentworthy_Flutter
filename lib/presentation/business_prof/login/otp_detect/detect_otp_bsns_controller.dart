import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/globals.dart';

part 'detect_otp_bsns_controller.freezed.dart';

part 'detect_otp_bsns_controller.g.dart';

@freezed
class BusinessDetectOtpState with _$BusinessDetectOtpState {
  const factory BusinessDetectOtpState({
    int? start,
  }) = _BusinessDetectOtpState;

  const BusinessDetectOtpState._();
}

@riverpod
class BusinessDetectOtpController extends _$BusinessDetectOtpController {
  Timer? timer;
  int _start = 60;

  @override
  FutureOr<BusinessDetectOtpState> build() async {
    state = const AsyncLoading();
    startTimer();

    return BusinessDetectOtpState(start: _start);
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
        }
        state = AsyncValue.data(state.value!.copyWith(start: _start));
      },
    );
    state = const AsyncLoading();
  }
}
