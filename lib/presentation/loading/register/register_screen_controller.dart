import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/common_components/common_tickerprovider.dart';

part 'register_screen_controller.g.dart';

@riverpod
class RegisterScreenController extends _$RegisterScreenController {
  bool _isbusinessreg = false;
  AnimationController? animationController;
  Animation<double>? animation;

  bool get isbusinessreg => _isbusinessreg;
  bool _iseyehide = false;

  bool get iseyehide => _iseyehide;
  bool _issignin = false;

  bool get issignin => _issignin;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

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

    state = const AsyncValue.data(null);
  }

  onRegtype({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onRegtype $val');
    _isbusinessreg = val;

    state = const AsyncValue.data(null);
  }

  onisSignin({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onisSignin $val');
    _issignin = val;

    state = const AsyncValue.data(null);
  }

  onEyeTap({required bool val}) async {
    state = const AsyncLoading();
    debugPrint('onEyeTap $val');
    _iseyehide = val;

    state = const AsyncValue.data(null);
  }
}
