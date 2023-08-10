import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/common_components/common_tickerprovider.dart';
import 'otp_detect/detect_otp.dart';

part 'login_phone_screen_controller.g.dart';

@riverpod
class LoginPhoneScreenController extends _$LoginPhoneScreenController {
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
        vsync: CommonTickerProvider(), duration: const Duration(seconds: 3));
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

    CommonNavigatior(child: const DetectOtp());
    state = const AsyncValue.data(null);
  }
}
