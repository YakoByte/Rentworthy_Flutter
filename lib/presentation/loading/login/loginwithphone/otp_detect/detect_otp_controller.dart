import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/globals.dart';

part 'detect_otp_controller.freezed.dart';
part 'detect_otp_controller.g.dart';

@freezed
class DetectOtpState with _$DetectOtpState {
  const factory DetectOtpState({
    int? start,
  }) = _DetectOtpState;

  const DetectOtpState._();
}

@riverpod
class DetectOtpController extends _$DetectOtpController {
  Timer? timer;
  int _start = 60;

  @override
  FutureOr<DetectOtpState> build() async {
    state = const AsyncLoading();
    startTimer();

    return DetectOtpState(start: _start);
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
