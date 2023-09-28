import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'business_info_screen_controller.g.dart';

@riverpod
class BusinessInfoScreenController extends _$BusinessInfoScreenController {
  TabController tabController =
      TabController(length: 3, vsync: CommonTickerProvider());
  int _selectedTab = 0;
  List<AnimationController>? animatecontrollerlist = [];
  TextEditingController businessnameController = TextEditingController();
  TextEditingController einIdController = TextEditingController();
  TextEditingController addtitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addtitlelastController = TextEditingController();

  int get selectedtab => _selectedTab;
  List<String> _catList = [
    "cat1",
    "cat2",
    "cat3",
    "cat4",
  ];
  List<String>? _selectCat = [];

  List<String> get selectCat => _selectCat!;

  List<String> get catList => _catList;

  onValSelect({required List<String> val}) async {
    state = const AsyncLoading();
    _selectCat = val;
    state = const AsyncValue.data(null);
  }

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
