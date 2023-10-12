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
  List<bool>? _isInvoiceTap;
  List<AnimationController>? animatecontrollerlist = [];

  int get selectedtab => _selectedTab;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<bool> get isInvoiceTap => _isInvoiceTap!;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    for (int i = 0; i < 5; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
      ));
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        Future.delayed(const Duration(milliseconds: 400), () {
          animatecontrollerlist![0].forward();
          if (i != (animatecontrollerlist!.length - 1)) {
            animatecontrollerlist![i + 1].forward();
          }
        });
        state = const AsyncValue.data(null);
      });
    }
    _isInvoiceTap =
        List.generate(animatecontrollerlist!.length, (index) => false);
    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }

  onInvoiceTap({required int index}) async {
    state = const AsyncLoading();

    _isInvoiceTap![index] = !_isInvoiceTap![index];
    debugPrint('_isInvoiceTap $_isInvoiceTap');
    state = const AsyncValue.data(null);
  }
}
