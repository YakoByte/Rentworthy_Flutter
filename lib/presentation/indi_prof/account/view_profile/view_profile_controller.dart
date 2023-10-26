import 'package:flutter/material.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'view_profile_controller.g.dart';

@riverpod
class ViewProfileController extends _$ViewProfileController {
  List<bool>? favlist;
  List<bool> get getfavlist => favlist!;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> productlist = [];

  List<String> get getproductlist => productlist!;

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
  List<AnimationController>? animatecontrollerlist = [];

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
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
    favlist = List.generate(nameList.length, (index) => false);
    state = const AsyncValue.data(null);
  }
}
