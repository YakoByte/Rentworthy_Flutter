import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'business_chat_controller.g.dart';

@riverpod
class BusinessChatController extends _$BusinessChatController {
  TabController tabController =
      TabController(length: 3, vsync: CommonTickerProvider());
  int _selectedTab = 0;
  List<AnimationController>? animatecontrollerlist = [];

  int get selectedtab => _selectedTab;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    for (int i = 0; i < 5; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
      ));
      Future.delayed(const Duration(milliseconds: 400), () {
        animatecontrollerlist![0].forward();
        if (i != (animatecontrollerlist!.length - 1)) {
          animatecontrollerlist![i + 1].forward();
        }
      });
    }
    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }
}
