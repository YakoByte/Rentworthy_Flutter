import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'all_chat_controller.g.dart';

@riverpod
class AllChatController extends _$AllChatController {
  bool _isbusinessreg = false;

  late TabController tabController;
  List<AnimationController>? animatecontrollerlist = [];

  bool get isbusinessreg => _isbusinessreg;
  bool _iseyehide = false;
  int _selectedTab = 0;

  int get selectedtab => _selectedTab;

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
    tabController.addListener(() {
      onTabTap(val: tabController.index);
      state = const AsyncLoading();
      state = const AsyncValue.data(null);
    });
    for (int i = 0; i < 13; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(milliseconds: int.parse("${i + 1}0")),
      ));

      Future.delayed(const Duration(milliseconds: 100), () {
        animatecontrollerlist![0].forward();
      });
    }
    ref.onDispose(() {
      for (int i = 0; i < 13; i++) {
        animatecontrollerlist![i].dispose();
      }
    });
    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

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
