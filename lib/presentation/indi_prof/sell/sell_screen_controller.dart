import 'package:flutter/animation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/import_utils.dart';

part 'sell_screen_controller.g.dart';

@riverpod
class SellScreenController extends _$SellScreenController {
  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeOutDoor,
    AppImg.electronics,
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
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavyMachine,
    AppText.newMarket,
  ];

  List<String> get nameList => _nameList;

  int? selectedIndex;
  String? selectedType;

  int get getselectedIndex => selectedIndex!;

  String get getselectedType => selectedType!;
  List<AnimationController>? animatecontrollerlist = [];
  AnimationController? appbaranimatecontroller;
  AnimationController? divideranimatecontroller;
  AnimationController? nextanimatecontroller;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    selectedIndex = _nameList.length;
    ref.onDispose(() {
      for (int i = 0; i < animatecontrollerlist!.length; i++) {
        animatecontrollerlist![i].dispose();
      }
      divideranimatecontroller!.dispose();
      appbaranimatecontroller!.dispose();
      nextanimatecontroller!.dispose();
    });
    divideranimatecontroller = AnimationController(
        vsync: CommonTickerProvider(), duration: Duration(milliseconds: 100));
    appbaranimatecontroller = AnimationController(
        vsync: CommonTickerProvider(), duration: Duration(milliseconds: 100));
    nextanimatecontroller = AnimationController(
        vsync: CommonTickerProvider(), duration: Duration(milliseconds: 100));
    for (int i = 0; i < _nameList.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(milliseconds: int.parse("${i + 1}0")),
      ));
      Future.delayed(const Duration(milliseconds: 100), () {
        animatecontrollerlist![0].forward();
        animatecontrollerlist![1].forward();
        if (i < (animatecontrollerlist!.length - 2)) {
          animatecontrollerlist![i + 2].forward();
        }

        divideranimatecontroller!.forward();
        appbaranimatecontroller!.forward();
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
