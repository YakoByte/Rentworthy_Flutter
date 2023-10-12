import 'package:flutter/animation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/common_components/common_tickerprovider.dart';
import '../../../../../utils/text.dart';

part 'statistics_reports_controller.g.dart';

@riverpod
class StatisticsReportsController extends _$StatisticsReportsController {
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
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<String> get getTitle => title;

  List<String> get getsubtitle => subtitle;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    for (int i = 0; i < title.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(milliseconds: int.parse("${i + 1}0")),
      ));

      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        Future.delayed(const Duration(milliseconds: 100), () {
          animatecontrollerlist![0].forward();

          if (i < (animatecontrollerlist!.length - 2)) {
            animatecontrollerlist![i + 1].forward();
          }
        });
        state = const AsyncValue.data(null);
      });
    }
  }
}
