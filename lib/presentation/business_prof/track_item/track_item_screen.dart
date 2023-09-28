import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_outline_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import 'track_item_screen_controller.dart';

class TrackItem extends ConsumerWidget {
  const TrackItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(trackItemControllerProvider);
    controller() => ref.read(trackItemControllerProvider.notifier);

    return Scaffold(
      key: Globals.trackitemkey,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 6,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.035,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BusinessSearch(adminscaffoldKey: Globals.trackitemkey)
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .then(delay: 300.ms)
                  .slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms),
              Container(
                height: h * 0.06,
                child: TabBar(
                    controller: controller().tabController,
                    onTap: (value) {
                      controller().onTabTap(val: value);
                    },
                    automaticIndicatorColorAdjustment: true,
                    dragStartBehavior: DragStartBehavior.start,
                    indicatorPadding: EdgeInsets.symmetric(
                        vertical: h * 0.005, horizontal: w * 0.02),
                    dividerColor: Colors.transparent,
                    unselectedLabelColor: AppColors.transparent,
                    splashBorderRadius: BorderRadius.zero,
                    indicatorSize: TabBarIndicatorSize.tab,
                    splashFactory: NoSplash.splashFactory,
                    isScrollable: false,
                    tabs: [
                      Tab(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: h * 0.005,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Landed",
                              style: ptSansTextStyle(
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: <Color>[
                                        controller().selectedtab == 0
                                            ? AppColors.colorPrimary
                                            : AppColors.black.withOpacity(0.5),
                                        controller().selectedtab == 0
                                            ? AppColors.colorSecondary
                                            : AppColors.black.withOpacity(0.5)
                                      ],
                                    ).createShader(
                                        const Rect.fromLTRB(25, 0, 70, 10)),
                                  fontSize: w * 0.033,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: h * 0.005,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Rented",
                              style: ptSansTextStyle(
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: <Color>[
                                        controller().selectedtab == 1
                                            ? AppColors.colorPrimary
                                            : AppColors.black.withOpacity(0.5),
                                        controller().selectedtab == 1
                                            ? AppColors.colorSecondary
                                            : AppColors.black.withOpacity(0.5)
                                      ],
                                    ).createShader(
                                        const Rect.fromLTRB(20, 0, 250, 10)),
                                  fontSize: w * 0.033,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: h * 0.005,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Cancelled",
                              style: ptSansTextStyle(
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: <Color>[
                                        controller().selectedtab == 2
                                            ? AppColors.colorPrimary
                                            : AppColors.black.withOpacity(0.5),
                                        controller().selectedtab == 2
                                            ? AppColors.colorSecondary
                                            : AppColors.black.withOpacity(0.5)
                                      ],
                                    ).createShader(
                                        const Rect.fromLTRB(40, 0, 250, 10)),
                                  fontSize: w * 0.033,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          margin: EdgeInsets.symmetric(
                            vertical: h * 0.005,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "Extension",
                              style: ptSansTextStyle(
                                  foreground: Paint()
                                    ..shader = LinearGradient(
                                      colors: <Color>[
                                        controller().selectedtab == 3
                                            ? AppColors.colorPrimary
                                            : AppColors.black.withOpacity(0.5),
                                        controller().selectedtab == 3
                                            ? AppColors.colorSecondary
                                            : AppColors.black.withOpacity(0.5)
                                      ],
                                    ).createShader(
                                        const Rect.fromLTRB(50, 0, 500, 10)),
                                  fontSize: w * 0.033,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ).animate().fadeIn(duration: 400.ms).then(delay: 400.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 700.ms),
              Container(
                height: h * 0.8,
                child: TabBarView(
                    controller: controller().tabController,
                    children: [
                      CommonListView(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        width: w,
                        height: h * 0.8 * 5,
                        itemBuilder: (p0, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            child: Container(
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.contcolor, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: controller().isInvoiceTap[index] ==
                                            false
                                        ? h * 0.12
                                        : h * 0.25,
                                    decoration: BoxDecoration(
                                      color: controller().isInvoiceTap[index] ==
                                              false
                                          ? AppColors.contcolor
                                          : AppColors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.3),
                                            offset: Offset(
                                                0,
                                                controller().isInvoiceTap[
                                                            index] ==
                                                        false
                                                    ? 3
                                                    : 0),
                                            blurRadius: controller()
                                                        .isInvoiceTap[index] ==
                                                    false
                                                ? 3
                                                : 0),
                                      ],
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.025,
                                          vertical: h * 0.015),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          if (controller()
                                                  .isInvoiceTap[index] ==
                                              false)
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  width: w * 0.2,
                                                  child: CommonText(
                                                      text: "Order placed",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                        fontSize: w * 0.03,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                                Container(
                                                  width: w * 0.1,
                                                  child: CommonText(
                                                      text: "Total",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                        fontSize: w * 0.03,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                                Container(
                                                  width: w * 0.11,
                                                  child: CommonText(
                                                      text: "Ship to",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: w * 0.03,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                                Container(
                                                  width: w * 0.4,
                                                  child: CommonText(
                                                      text:
                                                          "Order # 0987-654321",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: w * 0.03,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          Row(
                                            mainAxisAlignment: controller()
                                                        .isInvoiceTap[index] ==
                                                    false
                                                ? MainAxisAlignment.spaceBetween
                                                : MainAxisAlignment.end,
                                            children: [
                                              if (controller()
                                                      .isInvoiceTap[index] ==
                                                  false)
                                                Container(
                                                  width: w * 0.2,
                                                  child: CommonText(
                                                      text: "16 August 2023",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: w * 0.03,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              if (controller()
                                                      .isInvoiceTap[index] ==
                                                  false)
                                                Container(
                                                  width: w * 0.1,
                                                  child: CommonText(
                                                      text: "\$768.00",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: w * 0.03,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              if (controller()
                                                      .isInvoiceTap[index] ==
                                                  false)
                                                Container(
                                                  width: w * 0.11,
                                                  child: CommonText(
                                                      text: "Hamza ali",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.7),
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontSize: w * 0.03,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              Container(
                                                width: w * 0.42,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      controller().isInvoiceTap[
                                                                  index] ==
                                                              false
                                                          ? MainAxisAlignment
                                                              .spaceBetween
                                                          : MainAxisAlignment
                                                              .end,
                                                  children: [
                                                    if (controller()
                                                                .isInvoiceTap[
                                                            index] ==
                                                        false)
                                                      CommonText(
                                                          text:
                                                              "View order details",
                                                          style:
                                                              ptSansTextStyle(
                                                            foreground: Paint()
                                                              ..shader =
                                                                  const LinearGradient(
                                                                colors: <Color>[
                                                                  AppColors
                                                                      .colorPrimary,
                                                                  AppColors
                                                                      .colorSecondary
                                                                ],
                                                              ).createShader(
                                                                      const Rect
                                                                          .fromLTRB(
                                                                          80,
                                                                          0,
                                                                          550,
                                                                          20)),
                                                            fontSize: w * 0.03,
                                                            fontWeight:
                                                                FontWeight.w400,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                          )),
                                                    GestureDetector(
                                                      onTap: () {
                                                        controller()
                                                            .onInvoiceTap(
                                                                index: index);
                                                      },
                                                      child: Container(
                                                        color: AppColors
                                                            .transparent,
                                                        child: Row(
                                                          children: [
                                                            CommonText(
                                                                text: "Invoice",
                                                                style:
                                                                    ptSansTextStyle(
                                                                  foreground:
                                                                      Paint()
                                                                        ..shader =
                                                                            const LinearGradient(
                                                                          colors: <Color>[
                                                                            AppColors.colorPrimary,
                                                                            AppColors.colorSecondary
                                                                          ],
                                                                        ).createShader(const Rect.fromLTRB(
                                                                                80,
                                                                                0,
                                                                                550,
                                                                                20)),
                                                                  fontSize:
                                                                      w * 0.03,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                )),
                                                            ShaderMask(
                                                              shaderCallback:
                                                                  (Rect
                                                                      bounds) {
                                                                return const LinearGradient(
                                                                    begin: Alignment
                                                                        .centerLeft,
                                                                    end: Alignment.centerRight,
                                                                    colors: [
                                                                      AppColors
                                                                          .colorPrimary,
                                                                      AppColors
                                                                          .colorSecondary
                                                                    ]).createShader(
                                                                    bounds);
                                                              },
                                                              child: Icon(
                                                                  controller().isInvoiceTap[
                                                                              index] ==
                                                                          false
                                                                      ? Icons
                                                                          .keyboard_arrow_down_rounded
                                                                      : Icons
                                                                          .keyboard_arrow_up_rounded,
                                                                  color:
                                                                      AppColors
                                                                          .white,
                                                                  size:
                                                                      w * 0.05),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                          if (controller()
                                                  .isInvoiceTap[index] ==
                                              true)
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    width: w * 0.24,
                                                    child: Column(
                                                      children: [
                                                        CommonText(
                                                            text:
                                                                "Shipping Address",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  w * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                        CommonText(
                                                            text:
                                                                "Hamza ali 2464 Royal Ln. Mesa, New Jersey 45463",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize:
                                                                  w * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                      ],
                                                    )),
                                                Container(
                                                    width: w * 0.24,
                                                    child: Column(
                                                      children: [
                                                        CommonText(
                                                            text:
                                                                "Payment Method",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                              fontSize:
                                                                  w * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                            )),
                                                        CommonText(
                                                            text:
                                                                "Lorem ipsum dolor sit amet, consecteturadipiscing elit, sed do eiusmod temporincididunt ut labore ",
                                                            style:
                                                                ptSansTextStyle(
                                                              color: AppColors
                                                                  .black,
                                                              fontSize:
                                                                  w * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            )),
                                                      ],
                                                    )),
                                                Container(
                                                  width: w * 0.35,
                                                  child: Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          CommonText(
                                                              text:
                                                                  "Order Summary",
                                                              style:
                                                                  ptSansTextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize:
                                                                    w * 0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              )),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CommonText(
                                                              text:
                                                                  "Items Subtotal: ",
                                                              style:
                                                                  ptSansTextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize:
                                                                    w * 0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          CommonText(
                                                              text: "\$ 768.00",
                                                              style:
                                                                  ptSansTextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize:
                                                                    w * 0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                        ],
                                                      ),
                                                      // Row(
                                                      //   mainAxisAlignment:
                                                      //       MainAxisAlignment
                                                      //           .spaceBetween,
                                                      //   children: [
                                                      //     CommonText(
                                                      //         text:
                                                      //             "Shipping: ",
                                                      //         style:
                                                      //             ptSansTextStyle(
                                                      //           color:
                                                      //               AppColors
                                                      //                   .black,
                                                      //           fontSize:
                                                      //               w * 0.03,
                                                      //           fontWeight:
                                                      //               FontWeight
                                                      //                   .w500,
                                                      //         )),
                                                      //     CommonText(
                                                      //         text: "\$ 0.00",
                                                      //         style:
                                                      //             ptSansTextStyle(
                                                      //           color:
                                                      //               AppColors
                                                      //                   .black,
                                                      //           fontSize:
                                                      //               w * 0.03,
                                                      //           fontWeight:
                                                      //               FontWeight
                                                      //                   .w500,
                                                      //         )),
                                                      //   ],
                                                      // ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CommonText(
                                                              text: "Total: ",
                                                              style:
                                                                  ptSansTextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize:
                                                                    w * 0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                              )),
                                                          CommonText(
                                                              text: "\$ 768.00",
                                                              style:
                                                                  ptSansTextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                fontSize:
                                                                    w * 0.03,
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
                                                          CommonText(
                                                              text:
                                                                  "Grand Total: ",
                                                              style:
                                                                  ptSansTextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize:
                                                                    w * 0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              )),
                                                          CommonText(
                                                              text: "\$ 768.00",
                                                              style:
                                                                  ptSansTextStyle(
                                                                color: AppColors
                                                                    .black,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                fontSize:
                                                                    w * 0.03,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                              )),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            )
                                        ],
                                      ),
                                    ),
                                  ),
                                  if (controller().isInvoiceTap[index] == true)
                                    Divider(
                                      color: AppColors.contcolor,
                                      height: h * 0.001,
                                      thickness: 1.2,
                                    ),
                                  Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: h * 0.015,
                                            horizontal: w * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: w * 0.04),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.asset(
                                                  AppImg.homelist,
                                                  height: h * 0.12,
                                                  width: w * 0.38,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                    text: "Xbox Series S",
                                                    maxLines: 1,
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.028,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )),
                                                Container(
                                                  width: w * 0.45,
                                                  child: CommonText(
                                                      text:
                                                          "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint.",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        fontSize: h * 0.017,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      )),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: h * 0.02,
                                            left: w * 0.02,
                                            right: w * 0.02),
                                        child: CommonOutlineButton(
                                            containerwidth: w,
                                            containerheight: h * 0.06,
                                            side: BorderSide(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                width: 2),
                                            backgroundColor: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.006),
                                            ),
                                            text: "Track package",
                                            textStyle: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                                fontWeight: FontWeight.w700),
                                            onPressed: () {}),
                                      ),
                                      if (controller().isInvoiceTap[index] ==
                                          true)
                                        Padding(
                                          padding: EdgeInsets.only(
                                              bottom: h * 0.02,
                                              left: w * 0.02,
                                              right: w * 0.02),
                                          child: CommonOutlineButton(
                                              containerwidth: w,
                                              containerheight: h * 0.06,
                                              side: BorderSide(
                                                  color: AppColors.black
                                                      .withOpacity(0.5),
                                                  width: 2),
                                              backgroundColor: AppColors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        h * 0.006),
                                              ),
                                              text: "Return items",
                                              textStyle: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.5),
                                                  fontSize: h * 0.019,
                                                  fontWeight: FontWeight.w700),
                                              onPressed: () {}),
                                        ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: h * 0.02,
                                            left: w * 0.02,
                                            right: w * 0.02),
                                        child: CommonOutlineButton(
                                            containerwidth: w,
                                            containerheight: h * 0.06,
                                            side: BorderSide(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                width: 2),
                                            backgroundColor: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.006),
                                            ),
                                            text: "Leave seller feedback",
                                            textStyle: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                                fontWeight: FontWeight.w700),
                                            onPressed: () {}),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: h * 0.02,
                                            left: w * 0.02,
                                            right: w * 0.02),
                                        child: CommonOutlineButton(
                                            containerwidth: w,
                                            containerheight: h * 0.06,
                                            side: BorderSide(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                width: 2),
                                            backgroundColor: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.006),
                                            ),
                                            text: "Leave delivery feedback",
                                            textStyle: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                                fontWeight: FontWeight.w700),
                                            onPressed: () {}),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: h * 0.02,
                                            left: w * 0.02,
                                            right: w * 0.02),
                                        child: CommonOutlineButton(
                                            containerwidth: w,
                                            containerheight: h * 0.06,
                                            side: BorderSide(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                width: 2),
                                            backgroundColor: AppColors.white,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      h * 0.006),
                                            ),
                                            text: "Write a product review",
                                            textStyle: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                                fontWeight: FontWeight.w700),
                                            onPressed: () {}),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                            bottom: h * 0.02,
                                            left: w * 0.02,
                                            right: w * 0.02),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CommonText(
                                                    text: "Active Order",
                                                    maxLines: 1,
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.028,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )),
                                                CommonText(
                                                    text: "Lorem ipsum",
                                                    maxLines: 1,
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.018,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                    )),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                              .animate(
                                  controller: controller()
                                      .animatecontrollerlist![index],

                                  // onComplete: (controller1) {
                                  //   for (int i = 0; i < (animatecontrollerlist.length - 1); i++) {
                                  //     animatecontrollerlist![i + 1].forward();
                                  //   }
                                  // },
                                  autoPlay: false)
                              .fadeIn(duration: ((index * 40) + 100).ms)
                              .then(delay: ((index * 40) + 100).ms)
                              .slideX(
                                  begin: 1,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 500.ms);
                        },
                      ),
                      CommonListView(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        width: w,
                        height: h * 0.8 * 5,
                        itemBuilder: (p0, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            child: Container(
                              height: h * 0.77,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.contcolor, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: h * 0.12,
                                    decoration: BoxDecoration(
                                      color: AppColors.contcolor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.3),
                                            offset: const Offset(0, 3),
                                            blurRadius: 3),
                                      ],
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.025,
                                          vertical: h * 0.015),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: w * 0.2,
                                                child: CommonText(
                                                    text: "Order placed",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      fontSize: w * 0.03,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.1,
                                                child: CommonText(
                                                    text: "Total",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      fontSize: w * 0.03,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.11,
                                                child: CommonText(
                                                    text: "Ship to",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.4,
                                                child: CommonText(
                                                    text: "Order # 0987-654321",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: w * 0.2,
                                                child: CommonText(
                                                    text: "16 August 2023",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.1,
                                                child: CommonText(
                                                    text: "\$768.00",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.11,
                                                child: CommonText(
                                                    text: "Hamza ali",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.4,
                                                child: Row(
                                                  children: [
                                                    CommonText(
                                                        text:
                                                            "View order details",
                                                        style: ptSansTextStyle(
                                                          foreground: Paint()
                                                            ..shader =
                                                                const LinearGradient(
                                                              colors: <Color>[
                                                                AppColors
                                                                    .colorPrimary,
                                                                AppColors
                                                                    .colorSecondary
                                                              ],
                                                            ).createShader(
                                                                    const Rect
                                                                        .fromLTRB(
                                                                        80,
                                                                        0,
                                                                        550,
                                                                        20)),
                                                          fontSize: w * 0.03,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                    Row(
                                                      children: [
                                                        CommonText(
                                                            text: "Invoice",
                                                            style:
                                                                ptSansTextStyle(
                                                              foreground:
                                                                  Paint()
                                                                    ..shader =
                                                                        const LinearGradient(
                                                                      colors: <Color>[
                                                                        AppColors
                                                                            .colorPrimary,
                                                                        AppColors
                                                                            .colorSecondary
                                                                      ],
                                                                    ).createShader(const Rect
                                                                            .fromLTRB(
                                                                            80,
                                                                            0,
                                                                            550,
                                                                            20)),
                                                              fontSize:
                                                                  w * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                        ShaderMask(
                                                          shaderCallback:
                                                              (Rect bounds) {
                                                            return const LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  AppColors
                                                                      .colorPrimary,
                                                                  AppColors
                                                                      .colorSecondary
                                                                ]).createShader(
                                                                bounds);
                                                          },
                                                          child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: AppColors
                                                                  .white,
                                                              size: w * 0.05),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * 0.015,
                                        horizontal: w * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.04),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              AppImg.homelist,
                                              height: h * 0.12,
                                              width: w * 0.38,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "Xbox Series S",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.6),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.028,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            Container(
                                              width: w * 0.45,
                                              child: CommonText(
                                                  text:
                                                      "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint.",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    fontSize: h * 0.017,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Track package",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  if (controller().isInvoiceTap[index] == true)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: h * 0.02,
                                          left: w * 0.02,
                                          right: w * 0.02),
                                      child: CommonOutlineButton(
                                          containerwidth: w,
                                          containerheight: h * 0.06,
                                          side: BorderSide(
                                              color: AppColors.black
                                                  .withOpacity(0.5),
                                              width: 2),
                                          backgroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                h * 0.006),
                                          ),
                                          text: "Return items",
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.5),
                                              fontSize: h * 0.019,
                                              fontWeight: FontWeight.w700),
                                          onPressed: () {}),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Leave seller feedback",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Leave delivery feedback",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Write a product review",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "Active Order",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.028,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            CommonText(
                                                text: "Lorem ipsum",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.018,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      CommonListView(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        width: w,
                        height: h * 0.8 * 5,
                        itemBuilder: (p0, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            child: Container(
                              height: h * 0.77,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.contcolor, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: h * 0.12,
                                    decoration: BoxDecoration(
                                      color: AppColors.contcolor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.3),
                                            offset: const Offset(0, 3),
                                            blurRadius: 3),
                                      ],
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.025,
                                          vertical: h * 0.015),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: w * 0.2,
                                                child: CommonText(
                                                    text: "Order placed",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      fontSize: w * 0.03,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.1,
                                                child: CommonText(
                                                    text: "Total",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      fontSize: w * 0.03,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.11,
                                                child: CommonText(
                                                    text: "Ship to",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.4,
                                                child: CommonText(
                                                    text: "Order # 0987-654321",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: w * 0.2,
                                                child: CommonText(
                                                    text: "16 August 2023",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.1,
                                                child: CommonText(
                                                    text: "\$768.00",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.11,
                                                child: CommonText(
                                                    text: "Hamza ali",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.4,
                                                child: Row(
                                                  children: [
                                                    CommonText(
                                                        text:
                                                            "View order details",
                                                        style: ptSansTextStyle(
                                                          foreground: Paint()
                                                            ..shader =
                                                                const LinearGradient(
                                                              colors: <Color>[
                                                                AppColors
                                                                    .colorPrimary,
                                                                AppColors
                                                                    .colorSecondary
                                                              ],
                                                            ).createShader(
                                                                    const Rect
                                                                        .fromLTRB(
                                                                        80,
                                                                        0,
                                                                        550,
                                                                        20)),
                                                          fontSize: w * 0.03,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                    Row(
                                                      children: [
                                                        CommonText(
                                                            text: "Invoice",
                                                            style:
                                                                ptSansTextStyle(
                                                              foreground:
                                                                  Paint()
                                                                    ..shader =
                                                                        const LinearGradient(
                                                                      colors: <Color>[
                                                                        AppColors
                                                                            .colorPrimary,
                                                                        AppColors
                                                                            .colorSecondary
                                                                      ],
                                                                    ).createShader(const Rect
                                                                            .fromLTRB(
                                                                            80,
                                                                            0,
                                                                            550,
                                                                            20)),
                                                              fontSize:
                                                                  w * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                        ShaderMask(
                                                          shaderCallback:
                                                              (Rect bounds) {
                                                            return const LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  AppColors
                                                                      .colorPrimary,
                                                                  AppColors
                                                                      .colorSecondary
                                                                ]).createShader(
                                                                bounds);
                                                          },
                                                          child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: AppColors
                                                                  .white,
                                                              size: w * 0.05),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * 0.015,
                                        horizontal: w * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.04),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              AppImg.homelist,
                                              height: h * 0.12,
                                              width: w * 0.38,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "Xbox Series S",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.6),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.028,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            Container(
                                              width: w * 0.45,
                                              child: CommonText(
                                                  text:
                                                      "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint.",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    fontSize: h * 0.017,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Track package",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  if (controller().isInvoiceTap[index] == true)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: h * 0.02,
                                          left: w * 0.02,
                                          right: w * 0.02),
                                      child: CommonOutlineButton(
                                          containerwidth: w,
                                          containerheight: h * 0.06,
                                          side: BorderSide(
                                              color: AppColors.black
                                                  .withOpacity(0.5),
                                              width: 2),
                                          backgroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                h * 0.006),
                                          ),
                                          text: "Return items",
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.5),
                                              fontSize: h * 0.019,
                                              fontWeight: FontWeight.w700),
                                          onPressed: () {}),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Leave seller feedback",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Leave delivery feedback",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Write a product review",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "Active Order",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.028,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            CommonText(
                                                text: "Lorem ipsum",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.018,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                      CommonListView(
                        itemCount: 5,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        padding: EdgeInsets.zero,
                        width: w,
                        height: h * 0.8 * 5,
                        itemBuilder: (p0, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            child: Container(
                              height: h * 0.77,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.contcolor, width: 2),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: h * 0.12,
                                    decoration: BoxDecoration(
                                      color: AppColors.contcolor,
                                      boxShadow: [
                                        BoxShadow(
                                            color: AppColors.black
                                                .withOpacity(0.3),
                                            offset: const Offset(0, 3),
                                            blurRadius: 3),
                                      ],
                                      borderRadius: const BorderRadius.vertical(
                                          top: Radius.circular(12)),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.025,
                                          vertical: h * 0.015),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: w * 0.2,
                                                child: CommonText(
                                                    text: "Order placed",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      fontSize: w * 0.03,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.1,
                                                child: CommonText(
                                                    text: "Total",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      fontSize: w * 0.03,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.11,
                                                child: CommonText(
                                                    text: "Ship to",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.4,
                                                child: CommonText(
                                                    text: "Order # 0987-654321",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Container(
                                                width: w * 0.2,
                                                child: CommonText(
                                                    text: "16 August 2023",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.1,
                                                child: CommonText(
                                                    text: "\$768.00",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.11,
                                                child: CommonText(
                                                    text: "Hamza ali",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.7),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: w * 0.03,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                              Container(
                                                width: w * 0.4,
                                                child: Row(
                                                  children: [
                                                    CommonText(
                                                        text:
                                                            "View order details",
                                                        style: ptSansTextStyle(
                                                          foreground: Paint()
                                                            ..shader =
                                                                const LinearGradient(
                                                              colors: <Color>[
                                                                AppColors
                                                                    .colorPrimary,
                                                                AppColors
                                                                    .colorSecondary
                                                              ],
                                                            ).createShader(
                                                                    const Rect
                                                                        .fromLTRB(
                                                                        80,
                                                                        0,
                                                                        550,
                                                                        20)),
                                                          fontSize: w * 0.03,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                    Row(
                                                      children: [
                                                        CommonText(
                                                            text: "Invoice",
                                                            style:
                                                                ptSansTextStyle(
                                                              foreground:
                                                                  Paint()
                                                                    ..shader =
                                                                        const LinearGradient(
                                                                      colors: <Color>[
                                                                        AppColors
                                                                            .colorPrimary,
                                                                        AppColors
                                                                            .colorSecondary
                                                                      ],
                                                                    ).createShader(const Rect
                                                                            .fromLTRB(
                                                                            80,
                                                                            0,
                                                                            550,
                                                                            20)),
                                                              fontSize:
                                                                  w * 0.03,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                            )),
                                                        ShaderMask(
                                                          shaderCallback:
                                                              (Rect bounds) {
                                                            return const LinearGradient(
                                                                begin: Alignment
                                                                    .centerLeft,
                                                                end: Alignment
                                                                    .centerRight,
                                                                colors: [
                                                                  AppColors
                                                                      .colorPrimary,
                                                                  AppColors
                                                                      .colorSecondary
                                                                ]).createShader(
                                                                bounds);
                                                          },
                                                          child: Icon(
                                                              Icons
                                                                  .keyboard_arrow_down_rounded,
                                                              color: AppColors
                                                                  .white,
                                                              size: w * 0.05),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * 0.015,
                                        horizontal: w * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.04),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.asset(
                                              AppImg.homelist,
                                              height: h * 0.12,
                                              width: w * 0.38,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "Xbox Series S",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.6),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.028,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            Container(
                                              width: w * 0.45,
                                              child: CommonText(
                                                  text:
                                                      "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint.",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    fontSize: h * 0.017,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Track package",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  if (controller().isInvoiceTap[index] == true)
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: h * 0.02,
                                          left: w * 0.02,
                                          right: w * 0.02),
                                      child: CommonOutlineButton(
                                          containerwidth: w,
                                          containerheight: h * 0.06,
                                          side: BorderSide(
                                              color: AppColors.black
                                                  .withOpacity(0.5),
                                              width: 2),
                                          backgroundColor: AppColors.white,
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                h * 0.006),
                                          ),
                                          text: "Return items",
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.5),
                                              fontSize: h * 0.019,
                                              fontWeight: FontWeight.w700),
                                          onPressed: () {}),
                                    ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Leave seller feedback",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Leave delivery feedback",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: CommonOutlineButton(
                                        containerwidth: w,
                                        containerheight: h * 0.06,
                                        side: BorderSide(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            width: 2),
                                        backgroundColor: AppColors.white,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.006),
                                        ),
                                        text: "Write a product review",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        onPressed: () {}),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom: h * 0.02,
                                        left: w * 0.02,
                                        right: w * 0.02),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "Active Order",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.028,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                            CommonText(
                                                text: "Lorem ipsum",
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.018,
                                                  fontWeight: FontWeight.w700,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
