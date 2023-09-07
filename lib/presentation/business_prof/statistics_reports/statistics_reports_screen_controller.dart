// statistics_reports_screen_controller

import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';

part 'statistics_reports_screen_controller.g.dart';

@riverpod
class StatReportController extends _$StatReportController {
  List<String> title = [
    "Earnings",
    "Expenses",
    AppText.request,
    AppText.requested,
    AppText.rental,
    AppText.rented,
  ];

  List<String> subtitle = [
    "US\$0 ",
    "US\$0 ",
    "0 ",
    "0 ",
    "0 ",
    "0 ",
  ];
  List<AnimationController>? animatecontrollerlist = [];

  List<String> get getTitle => title;

  List<String> get getsubtitle => subtitle;
  List<bool>? featureadfavlist;
  List<bool> get getfeatureadfavlist => featureadfavlist!;

  List<bool>? nearbyadfavlist;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeoutdoor,
    AppImg.electronics,
    AppImg.star,
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
    AppText.toprent,
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavymachine,
    AppText.newmarket,
  ];

  List<String> get nameList => _nameList;
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    for (int i = 0; i < title.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(milliseconds: int.parse("${i + 1}0")),
      ));
      popularfavlist = List.generate(_imgList.length, (index) => false);
      featureadfavlist = List.generate(_imgList.length, (index) => false);
      nearbyadfavlist = List.generate(_imgList.length, (index) => false);
      Future.delayed(const Duration(milliseconds: 100), () {
        animatecontrollerlist![0].forward();

        if (i < (animatecontrollerlist!.length - 2)) {
          animatecontrollerlist![i + 1].forward();
        }
      });
    }
    state = const AsyncValue.data(null);
  }

  onFavTap(int index, int type) {
    state = const AsyncLoading();
    if (type == 0) {
      if (featureadfavlist![index] == true) {
        featureadfavlist![index] = false;
      } else {
        featureadfavlist![index] = true;
      }
    } else if (type == 1) {
      if (nearbyadfavlist![index] == true) {
        nearbyadfavlist![index] = false;
      } else {
        nearbyadfavlist![index] = true;
      }
    } else if (type == 2) {
      if (popularfavlist![index] == true) {
        popularfavlist![index] = false;
      } else {
        popularfavlist![index] = true;
      }
    }

    state = const AsyncValue.data(null);
  }
}
