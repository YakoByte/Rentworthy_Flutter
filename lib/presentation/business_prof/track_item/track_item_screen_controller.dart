// statistics_reports_screen_controller

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'track_item_screen_controller.g.dart';

@riverpod
class TrackItemController extends _$TrackItemController {
  TabController tabController =
      TabController(length: 4, vsync: CommonTickerProvider());
  int _selectedTab = 0;
  bool _isInvoiceTap = false;
  List<AnimationController>? animatecontrollerlist = [];

  int get selectedtab => _selectedTab;

  bool get isInvoiceTap => _isInvoiceTap;

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

  onInvoiceTap() async {
    state = const AsyncLoading();

    _isInvoiceTap = !_isInvoiceTap;
    debugPrint('_isInvoiceTap $_isInvoiceTap');
    state = const AsyncValue.data(null);
  }
}
