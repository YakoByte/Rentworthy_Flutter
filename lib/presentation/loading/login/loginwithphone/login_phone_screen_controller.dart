import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/globals.dart';
import '../../bottombar/bottom_bar.dart';

part 'login_phone_screen_controller.g.dart';

@riverpod
class LoginPhoneScreenController extends _$LoginPhoneScreenController {
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController = TextEditingController();

  // bool _issendotp = false;

  // bool get issendotp => _issendotp;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    // _issendotp = false;
    state = const AsyncValue.data(null);
  }

  onSendOtp() async {
    state = const AsyncLoading();
    debugPrint('onSendOtp');
    // _issendotp = true;
    CommonNavigatior(
        context: Globals.navigatorKey.currentContext!,
        child: const BottomBar());
    debugPrint('onSendOtp1');
    state = const AsyncValue.data(null);
  }
}
