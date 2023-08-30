import 'package:flutter/animation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/common_components/common_tickerprovider.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';

part 'sell_screen_controller.g.dart';

@riverpod
class SellScreenController extends _$SellScreenController {
  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeoutdoor,
    AppImg.electronics,
    AppImg.guitar,
    AppImg.cleaner,
    AppImg.clothing,
    AppImg.setting,
    AppImg.newtag,
  ];

  List<String> get imgList => _imgList;
  final List<String> _nameList = [
    AppText.film,
    AppText.partyevents,
    AppText.homeoutdoor,
    AppText.electronics,
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavymachine,
    AppText.newmarket,
  ];

  List<String> get nameList => _nameList;

  int? selectedIndex;
  String? selectedType;

  int get getselectedIndex => selectedIndex!;

  String get getselectedType => selectedType!;
  List<AnimationController>? animatecontrollerlist = [];

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    selectedIndex = _nameList.length;
    for (int i = 0; i < _nameList.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(milliseconds: int.parse("${i + 1}0")),
      ));

      Future.delayed(const Duration(milliseconds: 100), () {
        animatecontrollerlist![0].forward();
        animatecontrollerlist![1].forward();
      });
    }
    state = const AsyncValue.data(null);
  }

  onSelect(int index) async {
    state = const AsyncLoading();
    selectedIndex = index;
    selectedType = _nameList[index];
    state = const AsyncValue.data(null);
  }
}
