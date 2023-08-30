import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/common_components/common_tickerprovider.dart';

part 'register_screen_controller.g.dart';

@riverpod
class RegisterScreenController extends _$RegisterScreenController {
  bool _isbusinessreg = false;

  late TabController tabController;

  bool get isbusinessreg => _isbusinessreg;
  bool _iseyehide = false;

  bool get iseyehide => _iseyehide;
  bool _issignin = false;

  bool get issignin => _issignin;
  int _selectedTab = 0;

  int get selectedtab => _selectedTab;

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    tabController = TabController(
      initialIndex: 0,
      length: 2,
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

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }
}
