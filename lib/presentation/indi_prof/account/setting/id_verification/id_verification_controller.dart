import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/globals.dart';
import '../../../bottombar/bottom_bar.dart';

part 'id_verification_controller.g.dart';

@riverpod
class IdVerificationController extends _$IdVerificationController {
  bool _isVerified = false;
  bool _onverify = false;

  bool get isVerified => _isVerified;

  bool get onverify => _onverify;
  TextEditingController einController = TextEditingController();

  @override
  FutureOr<void> build() async {}

  onerifiedTap() async {
    state = const AsyncLoading();
    if (_onverify == false && _isVerified == false) {
      _onverify = true;
    } else if (_onverify == true && _isVerified == false) {
      _isVerified = true;
    } else if (_isVerified == true && _onverify == true) {
      Navigator.pushAndRemoveUntil(
          Globals.navigatorKey.currentContext!,
          PageTransition(
              child: BottomBar(index: 0),
              type: PageTransitionType.rightToLeftWithFade,
              duration: const Duration(milliseconds: 400)),
          (Route<dynamic> route) => false);

      _isVerified = false;
      _onverify = false;
    }
    debugPrint('_isVerified $_isVerified');
    state = const AsyncValue.data(null);
  }
}
