import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'all_chat_controller.g.dart';

@riverpod
class AllChatController extends _$AllChatController {
  bool _isbusinessreg = false;

  late TabController tabController;

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

    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: CommonTickerProvider(),
    );

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
