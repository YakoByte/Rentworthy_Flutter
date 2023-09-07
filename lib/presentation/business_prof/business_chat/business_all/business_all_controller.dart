import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'business_all_controller.g.dart';

@riverpod
class BusinessAllController extends _$BusinessAllController {
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
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 4}0")),
      ));

      Future.delayed(const Duration(milliseconds: 400), () {
        animatecontrollerlist![0].forward();
        if (i != (animatecontrollerlist!.length - 1)) {
          animatecontrollerlist![i + 1].forward();
        }
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
}
