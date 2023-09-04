import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_dropdown.dart';
import '../../../../../utils/common_components/common_dropdown_multiselect.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/common_components/dropdown/dropdown_search.dart';
import '../../../../../utils/common_components/gradient_track_shape.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import '../../../home/categories/categories.dart';
import 'my_ads_controller.dart';

class MyAds extends ConsumerWidget {
  const MyAds({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(myAdsControllerProvider);
    controller() => ref.read(myAdsControllerProvider.notifier);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        leadingicon: true,
        padding:
            EdgeInsets.symmetric(vertical: h * 0.005, horizontal: w * 0.02),
        backgroundColor: AppColors.white,
        centerTitle: false,
        centerwidget: CommonText(
          style: ptSansTextStyle(
              fontSize: w * 0.05,
              color: AppColors.black.withOpacity(0.8),
              fontWeight: FontWeight.w700),
          text: AppText.mylisting,
        ),
      ),
      body: Container(
        height: h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.025),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: TabBar(
                      controller: controller().tabController,
                      indicatorSize: TabBarIndicatorSize.tab,
                      dividerColor: AppColors.transparent,
                      unselectedLabelStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      labelStyle: ptSansTextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ],
                            ).createShader(
                                const Rect.fromLTRB(100, 0, 150, 20)),
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.w700),
                      tabs: [
                        const Tab(text: AppText.ads),
                        const Tab(text: AppText.fav),
                      ]),
                ),
                Container(
                  height: h * 0.85,
                  child: TabBarView(
                      controller: controller().tabController,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.symmetric(vertical: h * 0.05),
                        //   child: Column(
                        //     children: [
                        //       Container(
                        //         height: h * 0.5,
                        //         child: Column(
                        //           mainAxisAlignment:
                        //               MainAxisAlignment.spaceEvenly,
                        //           children: [
                        //             Image.asset(AppImg.searchengines,
                        //                 height: h * 0.3,
                        //                 width: w * 0.6,
                        //                 fit: BoxFit.cover),
                        //             Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   vertical: h * 0.01),
                        //               child: CommonText(
                        //                   text: AppText.haventlisted,
                        //                   style: ptSansTextStyle(
                        //                       color: AppColors.black
                        //                           .withOpacity(0.4),
                        //                       fontSize: h * 0.02,
                        //                       fontWeight: FontWeight.w400)),
                        //             ),
                        //             CommonText(
                        //                 text: AppText.useanymore,
                        //                 style: ptSansTextStyle(
                        //                     color: AppColors.black
                        //                         .withOpacity(0.4),
                        //                     fontSize: h * 0.02,
                        //                     fontWeight: FontWeight.w400)),
                        //             Padding(
                        //               padding: EdgeInsets.symmetric(
                        //                   vertical: h * 0.015),
                        //               child: CommonButton(
                        //                   containerwidth: w * 0.4,
                        //                   containerheight: h * 0.055,
                        //                   backgroundColor:
                        //                       AppColors.transparent,
                        //                   decoration: const BoxDecoration(
                        //                       borderRadius: BorderRadius.all(
                        //                           Radius.circular(4)),
                        //                       gradient: LinearGradient(
                        //                         begin: Alignment.topLeft,
                        //                         end: Alignment.bottomRight,
                        //                         colors: [
                        //                           AppColors.colorPrimary,
                        //                           AppColors.colorSecondary,
                        //                         ],
                        //                       )),
                        //                   shape: RoundedRectangleBorder(
                        //                       borderRadius:
                        //                           BorderRadius.circular(4)),
                        //                   text: AppText.post,
                        //                   textStyle: ptSansTextStyle(
                        //                       color: AppColors.white,
                        //                       fontSize: h * 0.02,
                        //                       fontWeight: FontWeight.w700),
                        //                   onPressed: () {}),
                        //             ),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                          child: Stack(
                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ///listview
                              Positioned(
                                top: h * 0.075,
                                left: 0,
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  width: w,
                                  height: h * 0.85,
                                  child: Categories(
                                      isextended: true,
                                      animatecontrollerlist:
                                          controller().animatecontrollerlist!,
                                      title: "",
                                      favrow: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                              text: "From:  ",
                                              style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.8),
                                                  fontSize: h * 0.017,
                                                  fontWeight: FontWeight.w400),
                                              children: <TextSpan>[
                                                TextSpan(
                                                  text: "05 May 2023 -",
                                                  style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.8),
                                                      fontSize: h * 0.017,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                TextSpan(
                                                  text: "To ",
                                                  style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.8),
                                                      fontSize: h * 0.017,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                TextSpan(
                                                  text: "04 Jun 2023",
                                                  style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.8),
                                                      fontSize: h * 0.017,
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ],
                                            ),
                                          ),
                                          CommonButton(
                                              containerwidth: w * 0.15,
                                              containerheight: h * 0.035,
                                              backgroundColor: AppColors
                                                  .starcolor
                                                  .withOpacity(0.7),
                                              shape: LinearBorder.none,
                                              text: "Active",
                                              textStyle: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.4),
                                                  fontSize: h * 0.012,
                                                  fontWeight: FontWeight.w700),
                                              onPressed: () {}),
                                          CommonIconButton(
                                              containerwidth: w * 0.08,
                                              containerheight: h * 0.052,
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
                                      onFavPressed: (index) {
                                        controller().onFavTap(index);
                                      },
                                      shrinkWrap: true,
                                      isFavIcon: false,
                                      width: w,
                                      isTopPadding: false,
                                      height: controller().imgList.length *
                                          h *
                                          0.077,
                                      favList: [],
                                      scrollDirection: Axis.vertical,
                                      nameList: controller().nameList,
                                      imgList: controller().imgList,
                                      isCategory: false,
                                      lastrow: IntrinsicHeight(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconText(
                                                title: "Views: 84",
                                                textStyle: ptSansTextStyle(
                                                    fontSize: w * 0.03,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    color: AppColors.black,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                subimg: false,
                                                preimg: true,
                                                preiconsize: h * 0.027,
                                                preimgname: AppImg.eye_view),
                                            VerticalDivider(
                                              color: AppColors.black
                                                  .withOpacity(0.2),
                                              thickness: 1,
                                              width: h * 0.01,
                                            ),
                                            IconText(
                                              title: "Likes: 84",
                                              textStyle: ptSansTextStyle(
                                                  fontSize: w * 0.03,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  color: AppColors.black,
                                                  fontWeight: FontWeight.w600),
                                              subimg: false,
                                              preimg: true,
                                              preiconsize: h * 0.027,
                                              preicon: Icons.favorite,
                                            ),
                                          ],
                                        ),
                                      ),
                                      isFeature: false,
                                      isViewAll: false),
                                ),
                              ),

                              ///dropdowns
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    vertical: h * 0.012,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CommonMultiSelectDrop(
                                        dropdownselecttitle: "Filter",
                                        dropdowntitle: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  width: w * 0.85,
                                                  height: h * 0.035,
                                                  color: AppColors.white,
                                                  child: SliderTheme(
                                                      data: SliderThemeData(
                                                        trackHeight: h * 0.013,
                                                        thumbShape:
                                                            GradientRectSliderThumbShape(
                                                                disabledThumbRadius:
                                                                    h * 0.014,
                                                                enabledThumbRadius:
                                                                    h * 0.014),
                                                        trackShape:
                                                            const GradientRectSliderTrackShape(
                                                                gradient:
                                                                    LinearGradient(
                                                                  colors: <Color>[
                                                                    AppColors
                                                                        .colorPrimary,
                                                                    AppColors
                                                                        .colorSecondary
                                                                  ],
                                                                ),
                                                                darkenInactive:
                                                                    true),
                                                      ),
                                                      child: Slider(
                                                        min: 0,
                                                        max: 100,
                                                        inactiveColor: AppColors
                                                            .black
                                                            .withOpacity(0.2),
                                                        thumbColor:
                                                            AppColors.white,
                                                        value: 50.0,
                                                        onChanged:
                                                            (double value) {},
                                                      )),
                                                ),
                                              ],
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: h * 0.015,
                                                  horizontal: w * 0.025),
                                              child: Row(
                                                children: [
                                                  CommonText(
                                                    text:
                                                        "Price: \u{20B9}0 - \u{20B9}5,000 ",
                                                    style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                        items: controller().getfilterlist,
                                        selectedItems:
                                            controller().getselectedfilter,
                                        dropdownDecoratorProps:
                                            DropDownDecoratorProps(
                                                textAlignVertical:
                                                    TextAlignVertical.bottom,
                                                dropdownSearchDecoration:
                                                    InputDecoration(
                                                  border: InputBorder.none,
                                                  prefixIcon: SizedBox(
                                                    height: h * 0.03,
                                                    width: h * 0.03,
                                                    child: Center(
                                                      child: Image.asset(
                                                          AppImg.filter,
                                                          color:
                                                              AppColors.black,
                                                          height: h * 0.025),
                                                    ),
                                                  ),
                                                  hintText: "Select Filter",
                                                  hintStyle: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.4),
                                                      fontSize: h * 0.017,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                baseStyle: ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    fontSize: h * 0.02,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                        clearButtonProps:
                                            const ClearButtonProps(
                                                isVisible: false),
                                        dropdownButtonProps:
                                            DropdownButtonProps(
                                          focusColor: AppColors.white,
                                          color: AppColors.white,
                                          icon: SizedBox(
                                            height: h * 0.03,
                                            width: h * 0.03,
                                            child: Center(
                                              child: Icon(
                                                  Icons
                                                      .keyboard_arrow_down_sharp,
                                                  color: AppColors.black,
                                                  size: h * 0.025),
                                            ),
                                          ),
                                        ),
                                        onChangedsearch: (str) {
                                          print("sdfs $str");
                                          controller().onchangefilter(str);
                                        },
                                        enabled: true,
                                        prefix: SizedBox(
                                          height: h * 0.03,
                                          width: h * 0.03,
                                          child: Center(
                                            child: Image.asset(AppImg.filter,
                                                color: AppColors.black,
                                                height: h * 0.025),
                                          ),
                                        ),
                                        isExpanded: true,
                                        containerwidth: w * 0.88,
                                        containerheight: h * 0.06,
                                        border: Border.all(
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                        containercolor: AppColors.white,
                                        elevation: 5,
                                      ),
                                    ],
                                  ),
                                )
                                    .animate(
                                        controller:
                                            controller().animationController,
                                        autoPlay: false)
                                    .fadeIn(duration: (80).ms)
                                    .then(delay: (80).ms)
                                    .slideX(
                                      begin: 1,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 500.ms,
                                    ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.05),
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.6,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(AppImg.favimg,
                                        height: h * 0.3,
                                        width: w * 0.6,
                                        fit: BoxFit.cover),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.01),
                                      child: CommonText(
                                          text: AppText.haventliked,
                                          style: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.4),
                                              fontSize: h * 0.02,
                                              fontWeight: FontWeight.w400)),
                                    ),
                                    CommonText(
                                        text: AppText.collectthing,
                                        style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.4),
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w400)),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.01),
                                      child: CommonButton(
                                          containerwidth: w * 0.45,
                                          containerheight: h * 0.07,
                                          backgroundColor:
                                              AppColors.transparent,
                                          decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(4)),
                                              gradient: LinearGradient(
                                                begin: Alignment.topLeft,
                                                end: Alignment.bottomRight,
                                                colors: [
                                                  AppColors.colorPrimary,
                                                  AppColors.colorSecondary,
                                                ],
                                              )),
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(4)),
                                          text: AppText.discover,
                                          textStyle: ptSansTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.02,
                                              fontWeight: FontWeight.w700),
                                          onPressed: () {}),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
