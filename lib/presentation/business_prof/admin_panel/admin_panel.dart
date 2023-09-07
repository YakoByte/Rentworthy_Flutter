import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_circle_chart/flutter_circle_chart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/common_appbar.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'dart:math' as math;

import '../../../utils/color.dart';
import '../../../utils/common_components/common_carouselslider.dart';
import '../../../utils/common_components/common_searchbar.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';
import '../../indi_prof/home/categories/categories.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import 'admin_panel_controller.dart';

class AdminPanel extends ConsumerWidget {
  const AdminPanel({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(adminPanelControllerProvider);
    controller() => ref.read(adminPanelControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.key,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 0,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.035),
            child: Column(
              children: [
                BusinessSearch(adminscaffoldKey: Globals.key)
                    .animate()
                    .fadeIn(duration: 300.ms)
                    .then(delay: 300.ms)
                    .slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),
                CommonCarousel(
                  enlargeFactor: 0.3,
                  containerheight: h * 0.18,
                  containerwidth: w,
                  gradient: false,
                  viewportFraction: 0.6,
                  scrollDirection: Axis.horizontal,
                  autoPlayCurve: Curves.bounceIn,
                  aspectRatio: 16 / 9,
                  enableInfiniteScroll: false,
                  autoPlay: false,
                  reverse: false,
                  padding: EdgeInsets.symmetric(vertical: h * 0.01),
                  carouselHeight: h * 0.15,
                  carouselController: controller().carouselController,
                  disableGesture: false,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Column(
                    children: [
                      Container(
                        width: w * 0.55,
                        height: itemIndex == 0 ? h * 0.1 : h * 0.14,
                        decoration: BoxDecoration(
                            color: AppColors.adminColor.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(16)),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.05,
                            vertical: itemIndex == 0 ? 0 : h * 0.02,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                style: ptSansTextStyle(
                                    fontSize: w * 0.047,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700),
                                text: "Views",
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    style: ptSansTextStyle(
                                        fontSize: w * 0.055,
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w700),
                                    text: "721K",
                                  ),
                                  IconText(
                                      title: "+11.01%",
                                      textStyle: ptSansTextStyle(
                                          fontSize: w * 0.04,
                                          color: AppColors.black,
                                          fontWeight: FontWeight.w700),
                                      subimgname: AppImg.arrowRise,
                                      subiconsize: h * 0.035,
                                      subimgcolor: AppColors.black,
                                      subimg: true,
                                      preimg: false),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  dotindicator: false,
                ).animate().fadeIn(duration: 400.ms).then(delay: 400.ms).slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),
                // SfCartesianChart(
                //   title: ChartTitle(text: "Column Chart"),
                //   series: <ChartSeries>[
                //     ColumnSeries<SalesData, double>(
                //         borderRadius:
                //             BorderRadius.vertical(top: Radius.circular(10)),
                //         dataSource: controller().chartData,
                //         xValueMapper: (SalesData sales, _) => sales.year,
                //         yValueMapper: (SalesData sales, _) => sales.sales),
                //   ],
                // ),
                // SfCircularChart(series: <CircularSeries>[
                //   DoughnutSeries<SalesData, double>(
                //       dataSource: controller().chartData,
                //       xValueMapper: (SalesData data, _) => data.year,
                //       yValueMapper: (SalesData data, _) => data.sales,
                //       // Corner style of doughnut segment
                //       cornerStyle: CornerStyle.bothFlat)
                // ]),
                // CircleChart(
                //   chartType: CircleChartType.solid,
                //   items: List.generate(
                //     3,
                //     (index) => CircleChartItemData(
                //       color: randomColor(),
                //       value: 100 + Random.secure().nextDouble() * 1000,
                //       name: 'Lorem Ipsum $index',
                //       description:
                //           'Lorem Ipsum $index không phải chỉ là một đoạn văn bản ngẫu nhiên.',
                //     ),
                //   ),
                // ),
                CommonText(
                  text: AppText.comingsoon,
                  style: ptSansTextStyle(
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ],
                        ).createShader(const Rect.fromLTRB(100, 0, 350, 20)),
                      fontSize: h * 0.05,
                      fontWeight: FontWeight.w700),
                ).animate().fadeIn(duration: 500.ms).then(delay: 500.ms).slideX(
                      begin: 3,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),

                /// Recent Rental
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.015),
                  child: Categories(
                    animatecontrollerlist: [],
                    isFavIcon: true,
                    isFeature: false,
                    onFavPressed: (index) {
                      controller().onFavTap(index, 1);
                    },
                    title: "Recent Rental",
                    isViewAll: true,
                    isextended: false,
                    isCategory: false,
                    isTopPadding: false,
                    favList: controller().getnearbyadfavlist,
                    shrinkWrap: false,
                    width: w,
                    type: 1,
                    height: h * 0.35,
                    scrollDirection: Axis.horizontal,
                    nameList: controller().nameList,
                    imgList: controller().imgList,
                    contheight: h * 0.32,
                    contwidth: w * 0.45,
                    contColor: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
                  )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .then(delay: 700.ms)
                      .slideX(
                        begin: 1,
                        end: 0,
                        curve: Curves.easeInOutCubic,
                        duration: 600.ms,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
