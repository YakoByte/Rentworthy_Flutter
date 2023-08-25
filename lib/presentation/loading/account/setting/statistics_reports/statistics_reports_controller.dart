import 'package:riverpod_annotation/riverpod_annotation.dart';

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

  List<String> get getTitle => title;

  List<String> get getsubtitle => subtitle;

  @override
  FutureOr<void> build() async {}
}
