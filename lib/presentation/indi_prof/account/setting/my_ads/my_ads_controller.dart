import 'package:flutter/material.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/common_components/common_tickerprovider.dart';

part 'my_ads_controller.g.dart';

@riverpod
class MyAdsController extends _$MyAdsController {
  List<String> filterlist = [
    "Filter",
    "Color",
    "Price",
    "Categories",
  ];

  List<String> get getfilterlist => filterlist;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<AnimationController>? animatecontrollerlist = [];

  AnimationController animationController = AnimationController(
    vsync: CommonTickerProvider(),
    duration: Duration(milliseconds: 1000),
  );

  List<String>? selectedfilter;

  List<String> get getselectedfilter => selectedfilter!;
  List<bool>? favlist;

  List<bool> get getfavlist => favlist!;

  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeOutDoor,
    AppImg.electronics,
    AppImg.star,
    AppImg.guitar,
    AppImg.cleaner,
    AppImg.clothing,
    AppImg.setting,
    AppImg.newTag,
  ];

  List<String> get imgList => _imgList;
  final List<String> _nameList = [
    AppText.film,
    AppText.partyEvents,
    AppText.homeOutDoor,
    AppText.electronics,
    AppText.topRent,
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavyMachine,
    AppText.newMarket,
  ];

  List<String> get nameList => _nameList;

  late TabController tabController;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: CommonTickerProvider(),
    );
    _isLoading = true;

    tabController.addListener(() {
      onTabTap(val: tabController.index);
      state = const AsyncLoading();
      state = const AsyncValue.data(null);
    });
    favlist = List.generate(15, (index) => false);

    selectedfilter = filterlist;
    state = const AsyncValue.data(null);
    animationController.forward();
    for (int i = 0; i < _nameList.length; i++) {
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
    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    // debugPrint('_selectedTab $val');

    for (int i = 0; i < _nameList.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
      ));
      Future.delayed(const Duration(milliseconds: 400), () {
        animatecontrollerlist![0].forward();
      });
      if (i != (animatecontrollerlist!.length - 1)) {
        animatecontrollerlist![i + 1].forward();
      }
    }
    state = const AsyncValue.data(null);
  }

  onchangefilter(
    val,
  ) {
    state = const AsyncLoading();
    // debugPrint("val $val");
    selectedfilter = val;
    // debugPrint("selectedfilter $selectedfilter");
    state = const AsyncValue.data(null);
  }

  onchangecheckbox(
    val,
  ) {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

  onFavTap(
    int index,
  ) {
    state = const AsyncLoading();
    if (favlist![index] == true) {
      favlist![index] = false;
    } else {
      favlist![index] = true;
    }

    state = const AsyncValue.data(null);
  }
}
