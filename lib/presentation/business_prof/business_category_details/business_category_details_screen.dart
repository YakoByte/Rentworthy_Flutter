import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/business_prof/business_widgets/business_search.dart';
import 'package:rentworthy/presentation/business_prof/user_prof/user_prof_screen.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';

import '../../../application/dialog/dialod_service.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_carouselslider.dart';
import '../../../utils/common_components/common_dropdown.dart';
import '../../../utils/common_components/common_iconbutton.dart';
import '../../../utils/common_components/common_listview.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/common_outline_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/dropdown/src/properties/clear_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_decorator_props.dart';
import '../../../utils/globals.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../../indi_prof/account/view_profile/view_profile.dart';
import '../admin_panel/admin_panel_controller.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../charts_widget/charts.dart';
import '../charts_widget/sparkcharts.dart';
import 'business_category_details_screen_controller.dart';

class BusinessCategoryDetails extends ConsumerWidget {
  const BusinessCategoryDetails({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(businessCatDetailsControllerProvider);
    controller() => ref.read(businessCatDetailsControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.catdetkey,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 2,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.04,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BusinessSearch(adminscaffoldKey: Globals.catdetkey)
                  .animate()
                  .fadeIn(duration: 50.ms)
                  .then(delay: 50.ms)
                  .slideY(
                      begin: 13,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 500.ms),
              Container(
                height: h * 0.89,
                width: w,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CommonCarousel(
                        enlargeFactor: 0.4,
                        dotindicator: true,
                        gradient: true,
                        containerheight: h * 0.4,
                        containerwidth: w,
                        viewportFraction: w / (w * 1),
                        scrollDirection: Axis.horizontal,
                        autoPlayCurve: Curves.bounceIn,
                        onPageChanged: (index, reason) {
                          controller().onPageChanged(index);
                        },
                        aspectRatio: 1 / 1,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        reverse: false,
                        getcurrentPageIndex: controller().getcurrentPageIndex,
                        padding: EdgeInsets.only(bottom: h * 0.015),
                        carouselHeight: h * 0.4,
                        carouselController: controller().carouselController,
                        disableGesture: false,
                        itemCount: controller().imgList.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Image.asset(AppImg.xbox,
                                  height: h * 0.3,
                                  width: w * 0.8,
                                  fit: BoxFit.cover),
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 100.ms)
                          .then(delay: 100.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 550.ms),
                      Padding(
                        padding: EdgeInsets.only(top: h * 0.05),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconText(
                                title: "2 Days left",
                                textStyle: ptSansTextStyle(
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ],
                                      ).createShader(
                                          const Rect.fromLTRB(40, 0, 200, 20)),
                                    fontSize: h * 0.03,
                                    fontWeight: FontWeight.w700),
                                preicon: Icons.timer_outlined,
                                preshadermask: true,
                                preimgcolor: AppColors.white,
                                preiconsize: h * 0.035,
                                subimg: false,
                                preimg: true),
                            CommonButton(
                                containerwidth: w * 0.5,
                                containerheight: h * 0.08,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(h * 0.006),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ])),
                                backgroundColor: AppColors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.006),
                                ),
                                prefixicon: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(AppImg.table,
                                        height: h * 0.04,
                                        width: h * 0.04,
                                        fit: BoxFit.contain),
                                  ],
                                ),
                                text: "Request for extension",
                                textStyle: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: w * 0.034,
                                    fontWeight: FontWeight.w500),
                                onPressed: () {
                                  ref
                                      .read(dialogServiceProvider)
                                      .businessrentScreeningDialog();
                                }),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 150.ms)
                          .then(delay: 150.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 570.ms),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            child: CommonText(
                                text: "Xbox Series S",
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  fontSize: h * 0.033,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                          CommonText(
                              text: AppText.dummytext,
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.4),
                                fontSize: h * 0.023,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      )
                          .animate()
                          .fadeIn(duration: 200.ms)
                          .then(delay: 200.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 590.ms),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.015),
                          child: CommonText(
                              text: "Product Return",
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.4),
                                  decoration: TextDecoration.underline,
                                  decorationColor:
                                      AppColors.black.withOpacity(0.4),
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600)),
                        )
                            .animate()
                            .fadeIn(duration: 250.ms)
                            .then(delay: 250.ms)
                            .slideY(
                                begin: 13,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 900.ms),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.02),
                        child: CommonText(
                            text: "Tracking ID:87654321",
                            style: ptSansTextStyle(
                                color: AppColors.black,
                                fontSize: h * 0.024,
                                fontWeight: FontWeight.w600)),
                      )
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .then(delay: 300.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 610.ms),
                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.02),
                        child: CommonOutlineButton(
                            containerwidth: w,
                            containerheight: h * 0.06,
                            side: const BorderSide(
                                color: AppColors.black, width: 2),
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(h * 0.006),
                              side: const BorderSide(
                                  color: AppColors.black, width: 2),
                            ),
                            text: "Track item",
                            textStyle: ptSansTextStyle(
                                color: AppColors.black,
                                fontSize: h * 0.019,
                                fontWeight: FontWeight.w700),
                            onPressed: () {}),
                      )
                          .animate()
                          .fadeIn(duration: 350.ms)
                          .then(delay: 350.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 630.ms),
                      Card(
                        color: AppColors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: h * 0.11,
                          width: w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.only(right: w * 0.016),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(1000),
                                        child: Image.asset(
                                          AppImg.homelist,
                                          height: h * 0.075,
                                          width: h * 0.075,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w * 0.4,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CommonText(
                                                    text: AppText.postedby,
                                                    maxLines: 1,
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.4),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CommonText(
                                                    text: AppText.hamzaali,
                                                    maxLines: 1,
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.8),
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                    )),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              Expanded(
                                                child: CommonText(
                                                    text: AppText.postedon,
                                                    maxLines: 1,
                                                    style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.4),
                                                      overflow:
                                                          TextOverflow.ellipsis,
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
                                  ],
                                ),
                                GestureDetector(
                                  onTap: () {
                                    commonNavigator(
                                      context: context,
                                      child: BusinessUserProf(),
                                      type: PageTransitionType
                                          .rightToLeftWithFade,
                                    );
                                  },
                                  child: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        colors: [
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary,
                                        ],
                                      ).createShader(bounds);
                                    },
                                    child: CommonText(
                                        text: "View Profile",
                                        style: ptSansTextStyle(
                                            color: AppColors.white,
                                            decoration:
                                                TextDecoration.underline,
                                            decorationColor: AppColors.white,
                                            fontSize: h * 0.021,
                                            fontWeight: FontWeight.w600)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .then(delay: 400.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 650.ms),
                      Card(
                        color: AppColors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: h * 0.6,
                          width: w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.035, vertical: h * 0.015),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: "Invoice OverView",
                                        maxLines: 1,
                                        style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonDropdown(
                                          selectedItem:
                                              controller().selectedsorted,
                                          items: controller().sortList,
                                          dropdownDecoratorProps:
                                              DropDownDecoratorProps(
                                                  textAlignVertical:
                                                      TextAlignVertical.bottom,
                                                  dropdownSearchDecoration:
                                                      InputDecoration(
                                                    border: InputBorder.none,
                                                    prefix: CommonText(
                                                        text: "Sort By:",
                                                        maxLines: 1,
                                                        style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.6),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w600,
                                                        )),
                                                    hintText: "Select Location",
                                                    hintStyle: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        fontSize: h * 0.017,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                  baseStyle: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.8),
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                          clearButtonProps: ClearButtonProps(
                                              isVisible: false),
                                          dropdownButtonProps:
                                              DropdownButtonProps(
                                            icon: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: h * 0.03,
                                                  color: AppColors.white,
                                                  child: Icon(
                                                      Icons
                                                          .keyboard_arrow_down_sharp,
                                                      color: AppColors.black,
                                                      size: h * 0.025),
                                                ),
                                              ],
                                            ),
                                          ),
                                          onChangedsearch: (str) {
                                            controller().onValSelect(val: str!);
                                          },
                                          enabled: true,
                                          isExpanded: true,
                                          containerwidth: w * 0.4,
                                          containerheight: h * 0.06,
                                          containercolor: AppColors.white,
                                          elevation: 0,
                                        ),
                                        CommonIconButton(
                                            containerwidth: w * 0.08,
                                            containerheight: h * 0.06,
                                            backgroundColor: AppColors.white,
                                            shape: LinearBorder.none,
                                            centericon: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(Icons.more_vert,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    size: h * 0.03),
                                              ],
                                            ),
                                            onPressed: () {}),
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                      children: [
                                        CommonText(
                                            text: "Total Revenue - Total Views",
                                            maxLines: 1,
                                            style: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.025,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CommonText(
                                            text: "\$9,542.00",
                                            maxLines: 1,
                                            style: ptSansTextStyle(
                                              color: AppColors.black,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.04,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        CommonText(
                                            text:
                                                "From Jan 20,2022 to July,2022",
                                            maxLines: 1,
                                            style: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.6),
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.022,
                                              fontWeight: FontWeight.w600,
                                            )),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.15,
                                  width: w,
                                  child: SfSparkAreaChart(
                                      axisLineWidth: 0,
                                      // 69DE94
                                      // lowPointColor: ,
                                      color:
                                          AppColors.darkgreen.withOpacity(0.4),
                                      borderColor: AppColors.darkgreen,
                                      borderWidth: 2,
                                      lowPointColor: AppColors.colorSecondary,
                                      highPointColor: AppColors.colorPrimary,
                                      data: <double>[
                                        0,
                                        3,
                                        2,
                                        4,
                                        5,
                                        10,
                                        8,
                                        9,
                                        12,
                                        10,
                                        11,
                                        8.5,
                                        9,
                                        3,
                                        4.5,
                                        4,
                                        1,
                                        0
                                      ]),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.02,
                                              vertical: h * 0.008),
                                          child: Container(
                                            height: h * 0.02,
                                            width: h * 0.02,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors.lightgreen,
                                                    width: 3.5),
                                                color: AppColors.darkgreen,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "3,526.56",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                            CommonText(
                                                text: "Net Profit",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.023,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: w * 0.02,
                                              vertical: h * 0.008),
                                          child: Container(
                                            height: h * 0.02,
                                            width: h * 0.02,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: AppColors.lightred,
                                                    width: 3.5),
                                                color: AppColors.red,
                                                shape: BoxShape.circle),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "3,526.56",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.025,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                            CommonText(
                                                text: "Net Revenue",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.023,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                // CommonText(22C55E
                                //   text: AppText.comingsoon,
                                //   style: ptSansTextStyle(
                                //       foreground: Paint()
                                //         ..shader = const LinearGradient(
                                //           colors: <Color>[
                                //             AppColors.colorPrimary,
                                //             AppColors.colorSecondary
                                //           ],
                                //         ).createShader(
                                //             const Rect.fromLTRB(100, 0, 350, 20)),
                                //       fontSize: h * 0.05,
                                //       fontWeight: FontWeight.w700),
                                // ),
                              ],
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 450.ms)
                          .then(delay: 450.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 670.ms),
                      Card(
                        color: AppColors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: h * 0.45,
                          width: w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.035, vertical: h * 0.03),
                            child: SfCartesianChart(
                              plotAreaBorderWidth: 0,
                              primaryXAxis: CategoryAxis(
                                  rangePadding: ChartRangePadding.auto,
                                  labelStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: w * 0.03,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  majorGridLines:
                                      const MajorGridLines(width: 0),
                                  majorTickLines:
                                      const MajorTickLines(size: 0)),
                              primaryYAxis: NumericAxis(
                                  interval: 5,
                                  rangePadding: ChartRangePadding.auto,
                                  labelStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
                                    overflow: TextOverflow.ellipsis,
                                    fontSize: w * 0.03,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  axisLine: const AxisLine(width: 0),
                                  labelFormat: '{value}k',
                                  majorTickLines:
                                      const MajorTickLines(size: 0)),
                              series: <ColumnSeries<ChartSampleData, String>>[
                                ColumnSeries<ChartSampleData, String>(
                                  dataSource: <ChartSampleData>[
                                    ChartSampleData(x: "Feb", y: 16),
                                    ChartSampleData(x: "Mar", y: 19),
                                    ChartSampleData(x: "Apr", y: 10),
                                    ChartSampleData(x: "May", y: 14),
                                    ChartSampleData(x: "Jun", y: 17),
                                    ChartSampleData(x: "Jul ", y: 19),
                                  ],
                                  name: 'Traffic by Device',
                                  width: 1,
                                  spacing: w * 0.0023,
                                  color: AppColors.fbblue,
                                  xValueMapper: (ChartSampleData sales, _) =>
                                      sales.x.toString(),
                                  yValueMapper: (ChartSampleData sales, _) =>
                                      sales.y,
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
                                  dataSource: <ChartSampleData>[
                                    ChartSampleData(x: "Feb", y: 18),
                                    ChartSampleData(x: "Mar", y: 16),
                                    ChartSampleData(x: "Apr", y: 17),
                                    ChartSampleData(x: "May", y: 16),
                                    ChartSampleData(x: "Jun", y: 18),
                                    ChartSampleData(x: "Jul ", y: 17),
                                  ],
                                  name: 'Traffic by Device',
                                  width: 1,
                                  spacing: w * 0.0023,
                                  color: AppColors.darkgreen,
                                  xValueMapper: (ChartSampleData sales, _) =>
                                      sales.x.toString(),
                                  yValueMapper: (ChartSampleData sales, _) =>
                                      sales.y,
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
                                  width: 1,
                                  spacing: w * 0.0023,
                                  dataSource: <ChartSampleData>[
                                    ChartSampleData(x: "Feb", y: 10),
                                    ChartSampleData(x: "Mar", y: 12),
                                    ChartSampleData(x: "Apr", y: 18),
                                    ChartSampleData(x: "May", y: 19),
                                    ChartSampleData(x: "Jun", y: 14),
                                    ChartSampleData(x: "Jul ", y: 10),
                                  ],
                                  name: 'Traffic by Device',
                                  color: AppColors.amber,
                                  xValueMapper: (ChartSampleData sales, _) =>
                                      sales.x.toString(),
                                  yValueMapper: (ChartSampleData sales, _) =>
                                      sales.y,
                                  dataLabelSettings: DataLabelSettings(
                                      isVisible: false,
                                      textStyle: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.6),
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: h * 0.023,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .then(delay: 500.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 690.ms),
                      Card(
                        color: AppColors.white,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: h * 0.8,
                          width: w,
                          decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.035, vertical: h * 0.015),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CommonText(
                                        text: "Current Statistic",
                                        maxLines: 1,
                                        style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.8),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.03,
                                          fontWeight: FontWeight.w600,
                                        )),
                                    CommonIconButton(
                                        containerwidth: w * 0.08,
                                        containerheight: h * 0.06,
                                        backgroundColor: AppColors.white,
                                        shape: LinearBorder.none,
                                        centericon: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(Icons.more_vert,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                size: h * 0.03),
                                          ],
                                        ),
                                        onPressed: () {}),
                                  ],
                                ),
                                SfCircularChart(series: <CircularSeries>[
                                  DoughnutSeries<ChartData, String>(
                                      dataSource: [
                                        ChartData(
                                            x: 'David',
                                            y: 25,
                                            color: AppColors.fbblue),
                                        ChartData(
                                            x: 'Steve',
                                            y: 28.9,
                                            color: AppColors.darkgreen),
                                        ChartData(
                                            x: 'Others',
                                            y: 21.81,
                                            color: AppColors.amberdark),
                                        ChartData(
                                            x: 'Jack',
                                            y: 13.59,
                                            color: AppColors.orng),
                                        ChartData(
                                            x: 'Jack',
                                            y: 10.93,
                                            color:
                                                AppColors.colorSecondarydark),
                                      ],
                                      dataLabelSettings: DataLabelSettings(
                                        isVisible: true,
                                        builder: (data, point, series,
                                            pointIndex, seriesIndex) {
                                          return Container(
                                            child: Text(
                                              "${data.y}%",
                                              style: ptSansTextStyle(
                                                color: AppColors.white,
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: h * 0.015,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                      innerRadius: '65%',
                                      pointColorMapper: (ChartData data, _) =>
                                          data.color,
                                      xValueMapper: (ChartData data, _) =>
                                          data.x,
                                      yValueMapper: (ChartData data, _) =>
                                          data.y,
                                      // Radius of doughnut
                                      radius: '100%')
                                ]),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.05),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.02,
                                                    vertical: h * 0.008),
                                                child: Container(
                                                  height: h * 0.02,
                                                  width: h * 0.02,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              191, 219, 254, 1),
                                                          width: 3.5),
                                                      color: AppColors.fbblue,
                                                      shape: BoxShape.circle),
                                                ),
                                              ),
                                              CommonText(
                                                  text: "Income",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: h * 0.023,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        IconText(
                                            title: "43.29%",
                                            textStyle: ptSansTextStyle(
                                              color: AppColors.fbblue,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.023,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            preicon: Icons.trending_up_rounded,
                                            preimgcolor: AppColors.fbblue,
                                            subimg: false,
                                            preimg: true),
                                      ],
                                    ),
                                    CommonText(
                                        text: "\$161,466.24",
                                        style: ptSansTextStyle(
                                          color: AppColors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.05),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.02,
                                                    vertical: h * 0.008),
                                                child: Container(
                                                  height: h * 0.02,
                                                  width: h * 0.02,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .lightgreen,
                                                          width: 3.5),
                                                      color:
                                                          AppColors.darkgreen,
                                                      shape: BoxShape.circle),
                                                ),
                                              ),
                                              CommonText(
                                                  text: "Income",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: h * 0.023,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        IconText(
                                            title: "36.16%",
                                            textStyle: ptSansTextStyle(
                                              color: AppColors.darkgreen,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.023,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            preicon: Icons.trending_up_rounded,
                                            preimgcolor: AppColors.darkgreen,
                                            subimg: false,
                                            preimg: true),
                                      ],
                                    ),
                                    CommonText(
                                        text: "\$56,411.33",
                                        style: ptSansTextStyle(
                                          color: AppColors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.05),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.02,
                                                    vertical: h * 0.008),
                                                child: Container(
                                                  height: h * 0.02,
                                                  width: h * 0.02,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: AppColors
                                                              .lightred,
                                                          width: 3.5),
                                                      color: AppColors.red,
                                                      shape: BoxShape.circle),
                                                ),
                                              ),
                                              CommonText(
                                                  text: "Income",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: h * 0.023,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        IconText(
                                            title: "40.22%",
                                            textStyle: ptSansTextStyle(
                                              color: AppColors.red,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.023,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            preicon: Icons.trending_up_rounded,
                                            preimgcolor: AppColors.red,
                                            subimg: false,
                                            preimg: true),
                                      ],
                                    ),
                                    CommonText(
                                        text: "\$81,981.22",
                                        style: ptSansTextStyle(
                                          color: AppColors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.05),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.02,
                                                    vertical: h * 0.008),
                                                child: Container(
                                                  height: h * 0.02,
                                                  width: h * 0.02,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              254, 215, 170, 1),
                                                          width: 3.5),
                                                      color: AppColors.orng,
                                                      shape: BoxShape.circle),
                                                ),
                                              ),
                                              CommonText(
                                                  text: "Income",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: h * 0.023,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        IconText(
                                            title: "25.53%",
                                            textStyle: ptSansTextStyle(
                                              color: AppColors.orng,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.023,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            preicon: Icons.trending_up_rounded,
                                            preimgcolor: AppColors.orng,
                                            subimg: false,
                                            preimg: true),
                                      ],
                                    ),
                                    CommonText(
                                        text: "\$12,432.51",
                                        style: ptSansTextStyle(
                                          color: AppColors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.only(right: w * 0.05),
                                          child: Row(
                                            children: [
                                              Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.02,
                                                    vertical: h * 0.008),
                                                child: Container(
                                                  height: h * 0.02,
                                                  width: h * 0.02,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color: Color.fromRGBO(
                                                              254, 240, 138, 1),
                                                          width: 3.5),
                                                      color:
                                                          AppColors.amberdark,
                                                      shape: BoxShape.circle),
                                                ),
                                              ),
                                              CommonText(
                                                  text: "Income",
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontSize: h * 0.023,
                                                    fontWeight: FontWeight.w500,
                                                  )),
                                            ],
                                          ),
                                        ),
                                        IconText(
                                            title: "25.53%",
                                            textStyle: ptSansTextStyle(
                                              color: AppColors.amberdark,
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: h * 0.023,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            preicon: Icons.trending_up_rounded,
                                            preimgcolor: AppColors.amberdark,
                                            subimg: false,
                                            preimg: true),
                                      ],
                                    ),
                                    CommonText(
                                        text: "\$12,432.51",
                                        style: ptSansTextStyle(
                                          color: AppColors.black,
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.023,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 550.ms)
                          .then(delay: 550.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 710.ms),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.01, vertical: h * 0.01),
                        child: CommonText(
                            text: "Ratings & Reviews",
                            style: ptSansTextStyle(
                                color: AppColors.black,
                                fontSize: h * 0.03,
                                fontWeight: FontWeight.w600)),
                      )
                          .animate()
                          .fadeIn(duration: 600.ms)
                          .then(delay: 600.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 730.ms),
                      Container(
                        width: w,
                        padding: EdgeInsets.symmetric(
                          vertical: h * 0.01,
                          horizontal: w * 0.01,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(11),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: w * 0.25,
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(vertical: h * 0.01),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconText(
                                        isCenter: false,
                                        title: "4.5",
                                        subicon: Icons.stars,
                                        subimg: true,
                                        preimg: false,
                                        subimgcolor: AppColors.black,
                                        subiconsize: w * 0.08,
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black,
                                            fontSize: w * 0.075,
                                            fontWeight: FontWeight.w600)),
                                    SizedBox(
                                      width: w * 0.23,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: CommonText(
                                                text:
                                                    "141 Ratings & 16 Reviews",
                                                maxLines: 4,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.6),
                                                  fontSize: w * 0.035,
                                                  fontWeight: FontWeight.w500,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: h * 0.01),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconText(
                                          isCenter: false,
                                          title: "5",
                                          subicon: Icons.stars,
                                          subimg: true,
                                          preimg: false,
                                          subimgcolor: AppColors.black,
                                          subiconsize: w * 0.05,
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black,
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w600)),
                                      Container(
                                        width: w * 0.32,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: w * 0.02),
                                        child: LinearProgressIndicator(
                                          minHeight: h * 0.013,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          value: 0.4,
                                          backgroundColor:
                                              AppColors.black.withOpacity(0.2),
                                          color: AppColors.greendark,
                                          semanticsLabel:
                                              'Linear progress indicator',
                                          semanticsValue:
                                              'Linear progress indicator',
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  AppColors.greendark),
                                        ),
                                      ),
                                      CommonText(
                                          text: "3,934",
                                          maxLines: 2,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.6),
                                            fontSize: w * 0.035,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconText(
                                          isCenter: true,
                                          title: "4",
                                          subicon: Icons.stars,
                                          subimg: true,
                                          preimg: false,
                                          subimgcolor: AppColors.black,
                                          subiconsize: w * 0.05,
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black,
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w600)),
                                      Container(
                                        width: w * 0.32,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: w * 0.02),
                                        child: LinearProgressIndicator(
                                          minHeight: h * 0.013,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          value: 0.5,
                                          backgroundColor:
                                              AppColors.black.withOpacity(0.2),
                                          color: AppColors.greendark,
                                          semanticsLabel:
                                              'Linear progress indicator',
                                          semanticsValue:
                                              'Linear progress indicator',
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  AppColors.greendark),
                                        ),
                                      ),
                                      CommonText(
                                          text: "334",
                                          maxLines: 2,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.6),
                                            fontSize: w * 0.035,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconText(
                                          isCenter: true,
                                          title: "3",
                                          subicon: Icons.stars,
                                          subimg: true,
                                          preimg: false,
                                          subimgcolor: AppColors.black,
                                          subiconsize: w * 0.05,
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black,
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w600)),
                                      Container(
                                        width: w * 0.32,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: w * 0.02),
                                        child: LinearProgressIndicator(
                                          minHeight: h * 0.013,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          value: 0.6,
                                          backgroundColor:
                                              AppColors.black.withOpacity(0.2),
                                          color: AppColors.greendark,
                                          semanticsLabel:
                                              'Linear progress indicator',
                                          semanticsValue:
                                              'Linear progress indicator',
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  AppColors.greendark),
                                        ),
                                      ),
                                      CommonText(
                                          text: "82",
                                          maxLines: 2,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.6),
                                            fontSize: w * 0.035,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconText(
                                          isCenter: true,
                                          title: "2",
                                          subicon: Icons.stars,
                                          subimg: true,
                                          preimg: false,
                                          subimgcolor: AppColors.black,
                                          subiconsize: w * 0.05,
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black,
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w600)),
                                      Container(
                                        width: w * 0.32,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: w * 0.02),
                                        child: LinearProgressIndicator(
                                          minHeight: h * 0.013,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          value: 0.7,
                                          backgroundColor:
                                              AppColors.black.withOpacity(0.2),
                                          color: AppColors.amberdark,
                                          semanticsLabel:
                                              'Linear progress indicator',
                                          semanticsValue:
                                              'Linear progress indicator',
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  AppColors.amberdark),
                                        ),
                                      ),
                                      CommonText(
                                          text: "40",
                                          maxLines: 2,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.6),
                                            fontSize: w * 0.035,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconText(
                                          isCenter: true,
                                          title: "1",
                                          subicon: Icons.stars,
                                          subimg: true,
                                          preimg: false,
                                          subimgcolor: AppColors.black,
                                          subiconsize: w * 0.05,
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.black,
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w600)),
                                      Container(
                                        width: w * 0.32,
                                        margin: EdgeInsets.symmetric(
                                            horizontal: w * 0.02),
                                        child: LinearProgressIndicator(
                                          minHeight: h * 0.013,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          value: 0.3,
                                          backgroundColor:
                                              AppColors.black.withOpacity(0.2),
                                          color: AppColors.red,
                                          semanticsLabel:
                                              'Linear progress indicator',
                                          semanticsValue:
                                              'Linear progress indicator',
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                                  AppColors.red),
                                        ),
                                      ),
                                      CommonText(
                                          text: "225",
                                          maxLines: 2,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.6),
                                            fontSize: w * 0.035,
                                            fontWeight: FontWeight.w500,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 650.ms)
                          .then(delay: 650.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 750.ms),
                      CommonListView(
                              itemCount: 3,
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              padding: EdgeInsets.zero,
                              width: w,
                              height: (h * 0.35) * 3,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.01),
                                  child: Container(
                                    width: w,
                                    decoration: BoxDecoration(
                                      color: AppColors.white,
                                      borderRadius: BorderRadius.circular(11),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.02),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: w * 0.12,
                                                    height: h * 0.05,
                                                    decoration: BoxDecoration(
                                                        color:
                                                            AppColors.greendark,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(4)),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        IconText(
                                                            isCenter: true,
                                                            title: "5",
                                                            subicon:
                                                                Icons.stars,
                                                            subimg: true,
                                                            preimg: false,
                                                            subimgcolor:
                                                                AppColors.white,
                                                            subiconsize:
                                                                h * 0.022,
                                                            textStyle: ptSansTextStyle(
                                                                color: AppColors
                                                                    .white,
                                                                fontSize:
                                                                    h * 0.023,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600)),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                w * 0.02),
                                                    child: CommonText(
                                                      text: "Perfect Product!",
                                                      maxLines: 1,
                                                      style: ptSansTextStyle(
                                                          fontSize: w * 0.045,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: AppColors.black
                                                              .withOpacity(0.8),
                                                          fontWeight:
                                                              FontWeight.w800),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.01),
                                            child: CommonText(
                                              text: index.isEven
                                                  ? "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis."
                                                  : "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.Lorem ipsum dolor sit amet, consectetur adipiscing elit.  ",
                                              style: ptSansTextStyle(
                                                  fontSize: w * 0.04,
                                                  color: AppColors.black
                                                      .withOpacity(0.7),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              CommonText(
                                                text: AppText.hamzaali,
                                                maxLines: 1,
                                                style: ptSansTextStyle(
                                                    fontSize: w * 0.025,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: AppColors.black
                                                        .withOpacity(0.6),
                                                    fontWeight:
                                                        FontWeight.w500),
                                              ),
                                              IconText(
                                                  isCenter: true,
                                                  title:
                                                      "Certified Renter, USA Jul, 2023",
                                                  preicon: Icons.check_circle,
                                                  subimg: false,
                                                  preimg: true,
                                                  preimgcolor: AppColors.black
                                                      .withOpacity(0.7),
                                                  preiconsize: h * 0.025,
                                                  textStyle: ptSansTextStyle(
                                                      fontSize: w * 0.03,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              IconText(
                                                  isCenter: true,
                                                  title: "51",
                                                  preicon:
                                                      Icons.thumb_up_alt_sharp,
                                                  subimg: false,
                                                  preimg: true,
                                                  preimgcolor: AppColors.black
                                                      .withOpacity(0.7),
                                                  preiconsize: h * 0.025,
                                                  textStyle: ptSansTextStyle(
                                                      fontSize: w * 0.025,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w500)),
                                              IconText(
                                                  isCenter: true,
                                                  title: "4",
                                                  preicon: Icons
                                                      .thumb_down_alt_sharp,
                                                  subimg: false,
                                                  preimg: true,
                                                  preimgcolor: AppColors.black
                                                      .withOpacity(0.7),
                                                  preiconsize: h * 0.025,
                                                  textStyle: ptSansTextStyle(
                                                      fontSize: w * 0.025,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      color: AppColors.black
                                                          .withOpacity(0.6),
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              })
                          .animate()
                          .fadeIn(duration: 700.ms)
                          .then(delay: 700.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 790.ms),
                      Padding(
                              padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonText(
                                    text: "All 516 reviews",
                                    style: ptSansTextStyle(
                                        foreground: Paint()
                                          ..shader = const LinearGradient(
                                            colors: <Color>[
                                              AppColors.colorPrimary,
                                              AppColors.colorSecondary
                                            ],
                                          ).createShader(const Rect.fromLTRB(
                                              40, 0, 100, 20)),
                                        fontSize: h * 0.025,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ))
                          .animate()
                          .fadeIn(duration: 750.ms)
                          .then(delay: 750.ms)
                          .slideY(
                              begin: 13,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 810.ms),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ChartData {
  ChartData({required this.x, required this.y, required this.color});

  final String x;
  final double y;
  final Color color;
}
