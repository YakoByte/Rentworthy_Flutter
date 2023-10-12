import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/images.dart';
import 'dart:math' as math;

import '../../../application/dialog/dialod_service.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_carouselslider.dart';
import '../../../utils/common_components/common_pageview.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';
import '../../indi_prof/error/error_screen.dart';
import '../../indi_prof/home/categories/categories.dart';
import '../../shimmers/admin_panel_shimmer.dart';
import '../business_category_details/business_category_details_screen.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import '../charts_widget/charts.dart';
import '../charts_widget/src/sparkline/series/spark_area_base.dart';
import '../charts_widget/src/sparkline/utils/enum.dart';
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
    return WillPopScope(
      onWillPop: () async {
        ref.read(dialogServiceProvider).areYouSureDialog(
            titleText: "Are you sure?",
            subtitleText: "Would you like to exit the app?",
            onYesPressed: () {
              SystemNavigator.pop();
            },
            onNoPressed: () {
              Navigator.pop(context);
            });
        return true;
      },
      child: Scaffold(
        key: Globals.key,
        backgroundColor: AppColors.white,
        drawer: AdminNavDrawer(
          selectedindex: 0,
        ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
            begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
        body: asyncState.when(
            data: (data) {
              if (controller().isLoading) {
                return const AdminPanelShimmer();
              }
              return SafeArea(
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                        child: BusinessSearch(adminscaffoldKey: Globals.key)
                            .animate()
                            .fadeIn(duration: 300.ms)
                            .then(delay: 300.ms)
                            .slideX(
                              begin: 1,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 600.ms,
                            ),
                      ),
                      Container(
                        height: h * 0.89,
                        width: w,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              CommonPageView(
                                      onPageChanged: (index) {
                                        controller().onPageChanged(index);
                                      },
                                      getcurrentPageIndex:
                                          controller().getcurrentPageIndex,
                                      dotindicator: false,
                                      containerHeight: h * 0.18,
                                      containerwidth: w,
                                      scrollDirection: Axis.horizontal,
                                      pageSnapping: false,
                                      reverse: false,
                                      gradient: false,
                                      padEnds: false,
                                      itemBuilder: (BuildContext context,
                                              int itemIndex) =>
                                          Row(
                                            children: [
                                              Container(
                                                width: w * 0.6,
                                                height: h * 0.16,
                                                decoration: BoxDecoration(
                                                    color: AppColors.adminColor
                                                        .withOpacity(0.4),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            16)),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.05,
                                                    vertical: h * 0.02,
                                                  ),
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      CommonText(
                                                        style: ptSansTextStyle(
                                                            fontSize: w * 0.047,
                                                            color:
                                                                AppColors.black,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700),
                                                        text: "Views",
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CommonText(
                                                            style: ptSansTextStyle(
                                                                fontSize:
                                                                    w * 0.055,
                                                                color: AppColors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                            text: "721K",
                                                          ),
                                                          IconText(
                                                              title: "+11.01%",
                                                              textStyle: ptSansTextStyle(
                                                                  fontSize:
                                                                      w * 0.04,
                                                                  color:
                                                                      AppColors
                                                                          .black,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700),
                                                              subimgname: AppImg
                                                                  .arrowRise,
                                                              subiconsize:
                                                                  h * 0.035,
                                                              subimgcolor:
                                                                  AppColors
                                                                      .black,
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
                                      itemCount: controller().imgList.length,
                                      pageController:
                                          controller().viewpageController,
                                      padding: EdgeInsets.only(
                                          top: h * 0.015,
                                          bottom: h * 0.015,
                                          left: w * 0.05))
                                  .animate()
                                  .fadeIn(duration: 400.ms)
                                  .then(delay: 400.ms)
                                  .slideX(
                                    begin: 1,
                                    end: 0,
                                    curve: Curves.easeInOutCubic,
                                    duration: 600.ms,
                                  ),
                              Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.035),
                                child: Column(
                                  children: [
                                    Container(
                                            height: h * 0.34,
                                            width: w,
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.03,
                                                vertical: h * 0.02),
                                            decoration: BoxDecoration(
                                                color: AppColors.chartgrey,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                    text: 'Traffic by Device',
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.023,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                                Container(
                                                  height: h * 0.25,
                                                  child: controller()
                                                      .buildDefaultColumnChart(
                                                          type: 0),
                                                ),
                                              ],
                                            ))
                                        .animate()
                                        .fadeIn(duration: 450.ms)
                                        .then(delay: 450.ms)
                                        .slideX(
                                          begin: 3,
                                          end: 0,
                                          curve: Curves.easeInOutCubic,
                                          duration: 550.ms,
                                        ),

                                    Container(
                                            height: h * 0.34,
                                            width: w,
                                            margin:
                                                EdgeInsets.only(top: h * 0.02),
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.03,
                                                vertical: h * 0.02),
                                            decoration: BoxDecoration(
                                                color: AppColors.chartgrey,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                    text: 'Traffic by Location',
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.023,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                                Row(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: h * 0.25,
                                                      width: w * 0.4,
                                                      child: SfCircularChart(
                                                          series: <CircularSeries>[
                                                            DoughnutSeries<
                                                                    ChartData,
                                                                    String>(
                                                                radius: '100%',
                                                                innerRadius:
                                                                    '60%',
                                                                dataSource: [
                                                                  ChartData(
                                                                      x:
                                                                          'United States',
                                                                      y: 38.6,
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                          186,
                                                                          237,
                                                                          189,
                                                                          1)),
                                                                  ChartData(
                                                                      x:
                                                                          'Canada',
                                                                      y: 30.8,
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                          255,
                                                                          202,
                                                                          198,
                                                                          1)),
                                                                  ChartData(
                                                                      x:
                                                                          'Other',
                                                                      y: 8.1,
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                          217,
                                                                          206,
                                                                          234,
                                                                          1)),
                                                                  ChartData(
                                                                      x:
                                                                          'Mexico',
                                                                      y: 22.5,
                                                                      color: const Color
                                                                          .fromRGBO(
                                                                          204,
                                                                          189,
                                                                          227,
                                                                          1)),
                                                                ],
                                                                strokeColor:
                                                                    AppColors
                                                                        .chartgrey,
                                                                strokeWidth:
                                                                    h * 0.005,
                                                                pointColorMapper:
                                                                    (ChartData data,
                                                                            _) =>
                                                                        data
                                                                            .color,
                                                                xValueMapper:
                                                                    (ChartData data,
                                                                            _) =>
                                                                        data.x,
                                                                yValueMapper:
                                                                    (ChartData data,
                                                                            _) =>
                                                                        data.y,

                                                                // Corner style of doughnut segment
                                                                cornerStyle:
                                                                    CornerStyle
                                                                        .bothCurve)
                                                          ]),
                                                    ),
                                                    Container(
                                                      width: w * 0.45,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: w *
                                                                            0.05),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: w *
                                                                              0.02,
                                                                          vertical:
                                                                              h * 0.008),
                                                                      child:
                                                                          Container(
                                                                        height: h *
                                                                            0.015,
                                                                        width: h *
                                                                            0.015,
                                                                        decoration: const BoxDecoration(
                                                                            color: Color.fromRGBO(
                                                                                186,
                                                                                237,
                                                                                189,
                                                                                1),
                                                                            shape:
                                                                                BoxShape.circle),
                                                                      ),
                                                                    ),
                                                                    CommonText(
                                                                        text:
                                                                            "United States",
                                                                        style:
                                                                            ptSansTextStyle(
                                                                          color:
                                                                              AppColors.black,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontSize:
                                                                              w * 0.035,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                              CommonText(
                                                                  text: "38.6%",
                                                                  style:
                                                                      ptSansTextStyle(
                                                                    color: AppColors
                                                                        .black,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontSize: w *
                                                                        0.035,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  )),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: w *
                                                                            0.05),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: w *
                                                                              0.02,
                                                                          vertical:
                                                                              h * 0.008),
                                                                      child:
                                                                          Container(
                                                                        height: h *
                                                                            0.015,
                                                                        width: h *
                                                                            0.015,
                                                                        decoration: const BoxDecoration(
                                                                            color: Color.fromRGBO(
                                                                                255,
                                                                                202,
                                                                                198,
                                                                                1),
                                                                            shape:
                                                                                BoxShape.circle),
                                                                      ),
                                                                    ),
                                                                    CommonText(
                                                                        text:
                                                                            "Canada",
                                                                        style:
                                                                            ptSansTextStyle(
                                                                          color:
                                                                              AppColors.black,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontSize:
                                                                              w * 0.035,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                              CommonText(
                                                                  text: "22.5%",
                                                                  style:
                                                                      ptSansTextStyle(
                                                                    color: AppColors
                                                                        .black,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontSize: w *
                                                                        0.035,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  )),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: w *
                                                                            0.05),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: w *
                                                                              0.02,
                                                                          vertical:
                                                                              h * 0.008),
                                                                      child:
                                                                          Container(
                                                                        height: h *
                                                                            0.015,
                                                                        width: h *
                                                                            0.015,
                                                                        decoration: const BoxDecoration(
                                                                            color: Color.fromRGBO(
                                                                                204,
                                                                                189,
                                                                                227,
                                                                                1),
                                                                            shape:
                                                                                BoxShape.circle),
                                                                      ),
                                                                    ),
                                                                    CommonText(
                                                                        text:
                                                                            "Mexico",
                                                                        style:
                                                                            ptSansTextStyle(
                                                                          color:
                                                                              AppColors.black,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontSize:
                                                                              w * 0.035,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                              CommonText(
                                                                  text: "30.8%",
                                                                  style:
                                                                      ptSansTextStyle(
                                                                    color: AppColors
                                                                        .black,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontSize: w *
                                                                        0.035,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  )),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: w *
                                                                            0.05),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          horizontal: w *
                                                                              0.02,
                                                                          vertical:
                                                                              h * 0.008),
                                                                      child:
                                                                          Container(
                                                                        height: h *
                                                                            0.015,
                                                                        width: h *
                                                                            0.015,
                                                                        decoration: const BoxDecoration(
                                                                            color: Color.fromRGBO(
                                                                                217,
                                                                                206,
                                                                                234,
                                                                                1),
                                                                            shape:
                                                                                BoxShape.circle),
                                                                      ),
                                                                    ),
                                                                    CommonText(
                                                                        text:
                                                                            "Other",
                                                                        style:
                                                                            ptSansTextStyle(
                                                                          color:
                                                                              AppColors.black,
                                                                          overflow:
                                                                              TextOverflow.ellipsis,
                                                                          fontSize:
                                                                              w * 0.035,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        )),
                                                                  ],
                                                                ),
                                                              ),
                                                              CommonText(
                                                                  text: "8.1%",
                                                                  style:
                                                                      ptSansTextStyle(
                                                                    color: AppColors
                                                                        .black,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    fontSize: w *
                                                                        0.035,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                  )),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ))
                                        .animate()
                                        .fadeIn(duration: 500.ms)
                                        .then(delay: 500.ms)
                                        .slideX(
                                          begin: 3,
                                          end: 0,
                                          curve: Curves.easeInOutCubic,
                                          duration: 600.ms,
                                        ),
                                    Container(
                                            height: h * 0.31,
                                            width: w,
                                            color: AppColors.white,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                    text:
                                                        'Recent Cancelled Orders',
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.023,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    )),
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: h * 0.01),
                                                  child: Container(
                                                    height: h * 0.25,
                                                    child: SfSparkAreaChart(
                                                        axisLineWidth: 0,

                                                        // 69DE94
                                                        // lowPointColor: ,
                                                        color: AppColors
                                                            .colorPrimary
                                                            .withOpacity(0.4),
                                                        borderColor: AppColors
                                                            .colorPrimary,
                                                        borderWidth: 1.5,
                                                        lowPointColor: AppColors
                                                            .colorSecondary,
                                                        highPointColor:
                                                            AppColors
                                                                .colorPrimary,
                                                        data: const <double>[
                                                          0,
                                                          3,
                                                          10,
                                                          11,
                                                          12,
                                                          10,
                                                          11,
                                                          12,
                                                          10,
                                                          11,
                                                          2,
                                                          4,
                                                          5,
                                                          10,
                                                          8,
                                                          9,
                                                          12,
                                                          12,
                                                          10,
                                                          11,
                                                          12,
                                                          10,
                                                          10,
                                                          10,
                                                          8,
                                                          9,
                                                          12,
                                                          10,
                                                          11,
                                                          12,
                                                          10,
                                                          10,
                                                          11,
                                                          12,
                                                          4.5,
                                                          4,
                                                          1,
                                                          3,
                                                          11,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          9,
                                                          3,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          9,
                                                          3,
                                                          12,
                                                          2,
                                                          4,
                                                          5,
                                                          10,
                                                          8,
                                                          9,
                                                          10,
                                                          11,
                                                          9,
                                                          3,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          9,
                                                          3,
                                                          4.5,
                                                          4,
                                                          1,
                                                          0,
                                                          3,
                                                          12,
                                                          10,
                                                          11,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          9,
                                                          3,
                                                          12,
                                                          2,
                                                          4,
                                                          5,
                                                          10,
                                                          8,
                                                          9,
                                                          10,
                                                          11,
                                                          9,
                                                          3,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          9,
                                                          3,
                                                          4.5,
                                                          4,
                                                          1,
                                                          0,
                                                          3,
                                                          12,
                                                          10,
                                                          11,
                                                          12,
                                                          11,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          4,
                                                          5,
                                                          11,
                                                          2,
                                                          4,
                                                          5,
                                                          10,
                                                          8,
                                                          9,
                                                          4.5,
                                                          4,
                                                          12,
                                                          11,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          4,
                                                          5,
                                                          11,
                                                          2,
                                                          4,
                                                          5,
                                                          10,
                                                          8,
                                                          9,
                                                          4.5,
                                                          4,
                                                          12,
                                                          2,
                                                          4,
                                                          5,
                                                          10,
                                                          8,
                                                          9,
                                                          10,
                                                          11,
                                                          9,
                                                          3,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          9,
                                                          3,
                                                          4.5,
                                                          4,
                                                          1,
                                                          0,
                                                          3,
                                                          12,
                                                          10,
                                                          11,
                                                          12,
                                                          11,
                                                          12,
                                                          10,
                                                          11,
                                                          8.5,
                                                          4,
                                                          5,
                                                          11,
                                                          2,
                                                          4,
                                                          5,
                                                          10,
                                                          8,
                                                          9,
                                                          4.5,
                                                          4,
                                                          1,
                                                        ]),
                                                  ),
                                                ),
                                              ],
                                            ))
                                        .animate()
                                        .fadeIn(duration: 530.ms)
                                        .then(delay: 530.ms)
                                        .slideX(
                                          begin: 3,
                                          end: 0,
                                          curve: Curves.easeInOutCubic,
                                          duration: 600.ms,
                                        ),

                                    Container(
                                            height: h * 0.45,
                                            width: w,
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.02),
                                            decoration: BoxDecoration(
                                                color: AppColors.white,
                                                borderRadius:
                                                    BorderRadius.circular(16)),
                                            child: Column(
                                              children: [
                                                Container(
                                                    height: h * 0.32,
                                                    child: controller()
                                                        .buildDefaultColumnChart(
                                                            type: 1)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Column(
                                                      children: [
                                                        CommonText(
                                                            text: "\$ 75, 000",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                        CommonText(
                                                            text: "Annually",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  h * 0.023,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        CommonText(
                                                            text: "\$ 50, 800",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                        CommonText(
                                                            text: "Monthly",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  h * 0.023,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                      ],
                                                    ),
                                                    Column(
                                                      children: [
                                                        CommonText(
                                                            text: "\$ 24, 200",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  h * 0.025,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                        CommonText(
                                                            text: "Weekly",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  h * 0.023,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                      ],
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ))
                                        .animate()
                                        .fadeIn(duration: 550.ms)
                                        .then(delay: 550.ms)
                                        .slideX(
                                          begin: 3,
                                          end: 0,
                                          curve: Curves.easeInOutCubic,
                                          duration: 650.ms,
                                        ),

                                    /// Recent Rental
                                    Padding(
                                      padding:
                                          EdgeInsets.only(bottom: h * 0.015),
                                      child: Categories(
                                        onCardPressed:
                                            BusinessCategoryDetails(),
                                        animatecontrollerlist: const [],
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
                                        favList:
                                            controller().getnearbyadfavlist,
                                        shrinkWrap: false,
                                        width: w,
                                        type: 1,
                                        height: h * 0.35,
                                        scrollDirection: Axis.horizontal,
                                        nameList: controller().nameList,
                                        imgList: controller().imgList,
                                        contheight: h * 0.4,
                                        contwidth: w * 0.45,
                                        contColor: AppColors.white,
                                        borderRadius:
                                            BorderRadius.circular(h * 0.025),
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
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            error: (error, stackTrace) => ErrorScreen(
                text: error.toString(),
                backgroundColor: AppColors.white,
                color: AppColors.red),
            loading: () {
              return const AdminPanelShimmer();
            }),
      ),
    );
  }
}
