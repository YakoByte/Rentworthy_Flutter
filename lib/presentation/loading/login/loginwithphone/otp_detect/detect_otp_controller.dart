import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rentworthy/presentation/loading/login/loginwithphone/findlocation/find_location.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/common_components/common_navigator.dart';
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
  Timer? _timer;
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
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          timer.cancel();
          FocusScope.of(Globals.navigatorKey.currentContext!)
              .requestFocus(FocusNode());
          commonNavigator(
              context: Globals.navigatorKey.currentContext!,
              child: FindLocation());
        } else {
          _start--;
          print("_start $_start");
        }
        state = AsyncValue.data(state.value!.copyWith(start: _start));
      },
    );
    state = const AsyncLoading();
  }
}
