import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:rentworthy/utils/common_components/common_text.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_tickerprovider.dart';
import '../charts_widget/charts.dart';
import 'admin_panel.dart';

part 'admin_panel_controller.g.dart';

@riverpod
class AdminPanelController extends _$AdminPanelController {
  final List<String> _locationList = [
    'Wagle state',
    'Mumbra',
    'Mulund',
    'Dadar',
    'Mahim',
  ];
  List<bool>? featureadfavlist;
  ScrollController scrollController = ScrollController();

  List<bool> get getfeatureadfavlist => featureadfavlist!;

  List<bool>? nearbyadfavlist;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  List<String> get locationList => _locationList;

  PageController viewpageController = PageController(viewportFraction: 0.68);
  PageController pageController = PageController();

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
  String? _selectedLocation;

  String? get selectedLocation => _selectedLocation;
  TextEditingController searchController = TextEditingController();
  List<String> searchitems = [];
  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  List<String> get getsearchitems => searchitems;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    _selectedLocation = _locationList[0];
    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);

    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;

      state = const AsyncValue.data(null);
    });
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

  SfCartesianChart buildDefaultColumnChart({required int type}) {
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;

    return type == 0
        ? SfCartesianChart(
            plotAreaBorderWidth: 0,
            primaryXAxis: CategoryAxis(
                labelStyle: ptSansTextStyle(
                  color: AppColors.black.withOpacity(0.4),
                  overflow: TextOverflow.ellipsis,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.w500,
                ),
                majorGridLines: const MajorGridLines(width: 0),
                majorTickLines: const MajorTickLines(size: 0)),
            primaryYAxis: NumericAxis(
                labelStyle: ptSansTextStyle(
                  color: AppColors.black.withOpacity(0.4),
                  overflow: TextOverflow.ellipsis,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.w500,
                ),
                axisLine: const AxisLine(width: 0),
                labelFormat: '{value}M',
                majorTickLines: const MajorTickLines(size: 0)),
            series: _getDefaultColumnSeries(),
          )
        : SfCartesianChart(
            plotAreaBorderWidth: 1,
            primaryXAxis: CategoryAxis(
                labelStyle: ptSansTextStyle(
                  color: AppColors.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.w500,
                ),
                majorGridLines: const MajorGridLines(width: 1),
                axisLine: const AxisLine(width: 1),
                desiredIntervals: 21,
                majorTickLines:
                    const MajorTickLines(size: 4, color: AppColors.black)),
            title: ChartTitle(
                alignment: ChartAlignment.near,
                text: type == 0 ? 'Traffic by Device' : 'Incomes',
                textStyle: ptSansTextStyle(
                  color: AppColors.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: h * 0.023,
                  fontWeight: FontWeight.w600,
                )),
            primaryYAxis: NumericAxis(
                minorGridLines: const MinorGridLines(width: 1),
                minorTickLines:
                    const MinorTickLines(size: 4, color: AppColors.black),
                axisLine: const AxisLine(width: 1),
                desiredIntervals: 5,
                interval: 2500,
                labelFormat: '{value}',
                labelStyle: ptSansTextStyle(
                  color: AppColors.black,
                  overflow: TextOverflow.ellipsis,
                  fontSize: w * 0.03,
                  fontWeight: FontWeight.w500,
                ),
                majorTickLines:
                    const MajorTickLines(size: 4, color: AppColors.black)),
            series: _getincomeColumnSeries(),
          );
  }

  List<ColumnSeries<ChartSampleData, String>> _getincomeColumnSeries() {
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        spacing: 0.2,
        width: 1,
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 0, y: 3700),
          ChartSampleData(x: 1, y: 2500),
          ChartSampleData(x: 2, y: 5100),
          ChartSampleData(x: 3, y: 1000),
          ChartSampleData(x: 4, y: 7500),
          ChartSampleData(x: 5, y: 9950),
          ChartSampleData(x: 6, y: 3000),
          ChartSampleData(x: 7, y: 6000),
          ChartSampleData(x: 8, y: 1500),
          ChartSampleData(x: 9, y: 9000),
          ChartSampleData(x: 11, y: 9000),
          ChartSampleData(x: 12, y: 5300),
          ChartSampleData(x: 13, y: 7600),
          ChartSampleData(x: 14, y: 5050),
          ChartSampleData(x: 15, y: 2000),
          ChartSampleData(x: 16, y: 1200),
          ChartSampleData(x: 17, y: 8500),
          ChartSampleData(x: 18, y: 9500),
          ChartSampleData(x: 19, y: 9700),
          ChartSampleData(x: 20, y: 4500),
          ChartSampleData(x: 21, y: 5400),
          ChartSampleData(x: 22, y: 4800),
          ChartSampleData(x: 23, y: 6400),
          ChartSampleData(x: 24, y: 7100),
          ChartSampleData(x: 25, y: 6500),
          ChartSampleData(x: 26, y: 6200),
          ChartSampleData(x: 27, y: 1000),
          ChartSampleData(x: 28, y: 700),
          ChartSampleData(x: 29, y: 7600),
          ChartSampleData(x: 30, y: 7400),
          ChartSampleData(x: 31, y: 2000),
        ],
        name: 'Traffic by Device',
        color: const Color.fromRGBO(204, 189, 227, 1),
        xValueMapper: (ChartSampleData sales, _) => sales.x.toString(),
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: DataLabelSettings(
            isVisible: false,
            textStyle: ptSansTextStyle(
              color: AppColors.black.withOpacity(0.6),
              overflow: TextOverflow.ellipsis,
              fontSize: h * 0.023,
              fontWeight: FontWeight.w600,
            )),
      ),
      ColumnSeries<ChartSampleData, String>(
        spacing: 0.2,
        width: 1,
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 0, y: 1700),
          ChartSampleData(x: 1, y: 4500),
          ChartSampleData(x: 2, y: 5100),
          ChartSampleData(x: 3, y: 6000),
          ChartSampleData(x: 4, y: 3500),
          ChartSampleData(x: 5, y: 7950),
          ChartSampleData(x: 6, y: 6000),
          ChartSampleData(x: 7, y: 2000),
          ChartSampleData(x: 8, y: 5500),
          ChartSampleData(x: 9, y: 3343),
          ChartSampleData(x: 11, y: 6400),
          ChartSampleData(x: 12, y: 4600),
          ChartSampleData(x: 13, y: 6500),
          ChartSampleData(x: 14, y: 5650),
          ChartSampleData(x: 15, y: 3200),
          ChartSampleData(x: 16, y: 1500),
          ChartSampleData(x: 17, y: 3500),
          ChartSampleData(x: 18, y: 8500),
          ChartSampleData(x: 19, y: 7700),
          ChartSampleData(x: 20, y: 5500),
          ChartSampleData(x: 21, y: 2400),
          ChartSampleData(x: 22, y: 6800),
          ChartSampleData(x: 23, y: 9400),
          ChartSampleData(x: 24, y: 8100),
          ChartSampleData(x: 25, y: 2500),
          ChartSampleData(x: 26, y: 4200),
          ChartSampleData(x: 27, y: 2000),
          ChartSampleData(x: 28, y: 7500),
          ChartSampleData(x: 29, y: 3600),
          ChartSampleData(x: 30, y: 2400),
          ChartSampleData(x: 31, y: 1500),
        ],
        name: 'Traffic by Device',
        color: const Color.fromRGBO(255, 202, 198, 1),
        xValueMapper: (ChartSampleData sales, _) => sales.x.toString(),
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: DataLabelSettings(
            isVisible: false,
            textStyle: ptSansTextStyle(
              color: AppColors.black.withOpacity(0.6),
              overflow: TextOverflow.ellipsis,
              fontSize: h * 0.023,
              fontWeight: FontWeight.w600,
            )),
      ),
    ];
  }

  List<ColumnSeries<ChartSampleData, String>> _getDefaultColumnSeries() {
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    return <ColumnSeries<ChartSampleData, String>>[
      ColumnSeries<ChartSampleData, String>(
        dataSource: <ChartSampleData>[
          ChartSampleData(x: 'Linux', y: 15.0),
          ChartSampleData(x: 'Mac', y: 22.0),
          ChartSampleData(x: 'iOS', y: 18.0),
          ChartSampleData(x: 'Windows', y: 25.0),
          ChartSampleData(x: 'Android', y: 5.0),
          ChartSampleData(x: 'Other', y: 22.0),
        ],
        name: 'Traffic by Device',
        width: 0.4,
        pointColorMapper: (ChartSampleData sales, _) => sales.x == 'Linux'
            ? const Color.fromRGBO(204, 189, 227, 1)
            : sales.x == 'Mac'
                ? const Color.fromRGBO(186, 237, 189, 1)
                : sales.x == 'iOS'
                    ? const Color.fromRGBO(204, 189, 227, 1)
                    : sales.x == 'Windows'
                        ? const Color.fromRGBO(255, 215, 212, 1)
                        : sales.x == 'Android'
                            ? const Color.fromRGBO(255, 215, 212, 1)
                            : const Color.fromRGBO(217, 206, 234, 1),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
        xValueMapper: (ChartSampleData sales, _) => sales.x.toString(),
        yValueMapper: (ChartSampleData sales, _) => sales.y,
        dataLabelSettings: DataLabelSettings(
            isVisible: false,
            textStyle: ptSansTextStyle(
              color: AppColors.black.withOpacity(0.6),
              overflow: TextOverflow.ellipsis,
              fontSize: h * 0.023,
              fontWeight: FontWeight.w600,
            )),
      )
    ];
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }

  void filterSearchResults(String query) {
    state = const AsyncLoading();
    // searchitems = carlist
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    print("searchitems $searchitems");
    state = const AsyncValue.data(null);
  }

  onValSelect({required String val}) async {
    state = const AsyncLoading();
    _selectedLocation = val;
    state = const AsyncValue.data(null);
  }
}

class ChartSampleData {
  /// Holds the datapoint values like x, y, etc.,
  ChartSampleData({
    this.x,
    this.y,
    this.xValue,
    this.yValue,
  });

  /// Holds x value of the datapoint
  final dynamic x;

  /// Holds y value of the datapoint
  final num? y;

  /// Holds x value of the datapoint
  final dynamic xValue;

  /// Holds y value of the datapoint
  final num? yValue;
}
