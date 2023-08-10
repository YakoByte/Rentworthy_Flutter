import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/common_components/common_tickerprovider.dart';

part 'detect_otp_controller.g.dart';

@riverpod
class DetectOtpController extends _$DetectOtpController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();
  bool _issendotp = false;

  bool get issendotp => _issendotp;
  AnimationController? animationController;
  Animation<double>? animation;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    animationController = AnimationController(
        vsync: CommonTickerProvider(), duration: Duration(seconds: 3));
    animation = Tween<double>(begin: 0, end: -300).animate(animationController!)
      ..addListener(() {
        // print(animation!.value);
        state = const AsyncValue.data(null);
      });
    _issendotp = false;
    state = const AsyncValue.data(null);
  }

  onSendOtp() async {
    state = const AsyncLoading();
    _issendotp = true;

    state = const AsyncValue.data(null);
  }
}
