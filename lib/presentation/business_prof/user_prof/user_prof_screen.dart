import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/common_outline_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/icon_text.dart';
import '../../../utils/globals.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../../indi_prof/account/edit_profile/edit_profile_screen.dart';
import '../../indi_prof/account/widgets/profile_img_name.dart';
import '../../indi_prof/error/error_screen.dart';
import '../../indi_prof/home/categories/categories.dart';
import '../../indi_prof/sell/sell_screen.dart';
import '../../shimmers/user_profile_shimmer.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import 'user_prof_screen_controller.dart';

class BusinessUserProf extends ConsumerWidget {
  const BusinessUserProf({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(businessUserProfControllerProvider);
    controller() => ref.read(businessUserProfControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    print("user prof ${controller().tabController.index}");
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.userProfKey,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 5,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const UserProfileShimmer();
            }
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                child: SingleChildScrollView(
                  physics: NeverScrollableScrollPhysics(),
                  child: Column(
                    children: [
                      BusinessSearch(adminscaffoldKey: Globals.userProfKey)
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .then(delay: 300.ms)
                          .slideX(
                            begin: 30,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.04, vertical: h * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ProfileImgName(
                                        verified:
                                            controller().getproductlist.isEmpty
                                                ? true
                                                : false,
                                        items: controller().popupitemList,
                                        name: AppText.editProf,
                                        vertbtn: true,
                                        onTap: () {
                                          commonNavigator(
                                            context: context,
                                            child: EditProfileScreen(),
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                          );
                                        })
                                    .animate()
                                    .fadeIn(duration: 200.ms)
                                    .then(delay: 200.ms)
                                    .slideX(
                                        begin: 30,
                                        end: 0,
                                        curve: Curves.easeInOutCubic,
                                        duration: 700.ms),
                                Container(
                                  height: h * 0.1,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.03),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            IconText(
                                              preimg: true,
                                              subimg: false,
                                              preshadermask: false,
                                              preiconsize: h * 0.03,
                                              title: AppText.memberSince,
                                              preicon:
                                                  Icons.calendar_today_rounded,
                                              preimgcolor: AppColors.black
                                                  .withOpacity(0.8),
                                              textStyle: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: h * 0.021,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                                .animate()
                                                .fadeIn(duration: 300.ms)
                                                .then(delay: 300.ms)
                                                .slideX(
                                                    begin: 30,
                                                    end: 0,
                                                    curve:
                                                        Curves.easeInOutCubic,
                                                    duration: 750.ms),
                                            IconText(
                                              preimg: true,
                                              subimg: false,
                                              preshadermask: false,
                                              preiconsize: h * 0.03,
                                              title: AppText.productList,
                                              preimgname: AppImg.gameController,
                                              preimgcolor: AppColors.black
                                                  .withOpacity(0.8),
                                              textStyle: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                overflow: TextOverflow.ellipsis,
                                                fontSize: h * 0.021,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            )
                                                .animate()
                                                .fadeIn(duration: 350.ms)
                                                .then(delay: 350.ms)
                                                .slideX(
                                                    begin: 30,
                                                    end: 0,
                                                    curve:
                                                        Curves.easeInOutCubic,
                                                    duration: 800.ms),
                                          ],
                                        ),
                                      ),
                                      if (controller()
                                          .getproductlist
                                          .isNotEmpty)
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 2,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            border: GradientBoxBorder(
                                              gradient: LinearGradient(colors: [
                                                AppColors.colorPrimary,
                                                AppColors.colorSecondary
                                              ]),
                                              width: 1.5,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                          height: h * 0.09,
                                          width: w * 0.22,
                                          padding: EdgeInsets.all(w * 0.01),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              IconText(
                                                preimg: true,
                                                subimg: false,
                                                preshadermask: false,
                                                preiconsize: h * 0.025,
                                                title: "3.4",
                                                preicon: Icons.star,
                                                preimgcolor: AppColors.yellow,
                                                textStyle: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.8),
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontSize: h * 0.018,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                              CommonText(
                                                  textAlign: TextAlign.center,
                                                  style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.8),
                                                      fontSize: h * 0.015,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  text: AppText.custRating),
                                            ],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(
                            color: AppColors.black.withOpacity(0.1),
                            thickness: 1.5,
                            height: h * 0.0,
                          )
                              .animate()
                              .fadeIn(duration: 400.ms)
                              .then(delay: 400.ms)
                              .slideX(
                                  begin: 30,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 850.ms),
                          Container(
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
                                unselectedLabelStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.5),
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w500),
                                isScrollable: false,
                                labelStyle: ptSansTextStyle(
                                    foreground: Paint()
                                      ..shader = LinearGradient(
                                        colors: <Color>[
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ],
                                      ).createShader(
                                          controller().tabController.index == 0
                                              ? Rect.fromLTRB(45, 0, 140, 10)
                                              : Rect.fromLTRB(220, 0, 280, 10)),
                                    fontSize: w * 0.042,
                                    fontWeight: FontWeight.w700),
                                tabs: [
                                  Tab(
                                    height: h * 0.06,
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
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    height: h * 0.06,
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
                                              fontSize: w * 0.042,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                          )
                              .animate()
                              .fadeIn(duration: 450.ms)
                              .then(delay: 450.ms)
                              .slideX(
                                  begin: 30,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 900.ms),
                          Container(
                            height: h * 0.58,
                            child: TabBarView(
                                controller: controller().tabController,
                                children: [
                                  Container(
                                    height: h * 0.58,
                                    child: controller().getproductlist.isEmpty
                                        ? Categories(
                                            animatecontrollerlist: controller()
                                                .animatecontrollerlist!,
                                            isFavIcon: true,
                                            title: "",
                                            isextended: false,
                                            onFavPressed: (int) {},
                                            shrinkWrap: true,
                                            width: w,
                                            isTopPadding: false,
                                            height: h * 0.58,
                                            padding: EdgeInsets.zero,
                                            favList: controller().getfavlist,
                                            scrollDirection: Axis.vertical,
                                            nameList: controller().nameList,
                                            imgList: controller().imgList,
                                            isCategory: false,
                                            isFeature: false,
                                            isViewAll: false)
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.055),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.asset(AppImg.noChat,
                                                    height: h * 0.3,
                                                    width: w * 0.6,
                                                    fit: BoxFit.cover),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: h * 0.01),
                                                  child: CommonText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text:
                                                          AppText.haveNotListed,
                                                      style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: w * 0.06),
                                                  child: CommonText(
                                                      text: AppText.useAnyMore,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: h * 0.02),
                                                  child: CommonOutlineButton(
                                                    containerwidth: w * 0.5,
                                                    containerheight: h * 0.06,
                                                    backgroundColor:
                                                        AppColors.transparent,
                                                    // decoration: const BoxDecoration(
                                                    //     borderRadius: BorderRadius.all(Radius.circular(4)),
                                                    //     gradient: LinearGradient(
                                                    //       begin: Alignment.topLeft,
                                                    //       end: Alignment.bottomRight,
                                                    //       colors: [
                                                    //         AppColors.colorPrimary,
                                                    //         AppColors.colorSecondary,
                                                    //       ],
                                                    //     )),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: GradientBoxBorder(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              AppColors
                                                                  .colorPrimary,
                                                              AppColors
                                                                  .colorSecondary
                                                            ]),
                                                        width: 2.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                    text: AppText.startSell,
                                                    textStyle: ptSansTextStyle(
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
                                                                      100,
                                                                      0,
                                                                      300,
                                                                      20)),
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    onPressed: () {
                                                      commonNavigator(
                                                        context: context,
                                                        child: SellScreen(
                                                          fromNav: false,
                                                        ),
                                                        type: PageTransitionType
                                                            .rightToLeftWithFade,
                                                      );
                                                    },
                                                    side: BorderSide.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  )
                                      .animate()
                                      .fadeIn(duration: 500.ms)
                                      .then(delay: 500.ms)
                                      .slideX(
                                          begin: 30,
                                          end: 0,
                                          curve: Curves.easeInOutCubic,
                                          duration: 1000.ms),
                                  Container(
                                    height: h * 0.58,
                                    child: controller().getproductlist.isEmpty
                                        ? Categories(
                                            animatecontrollerlist: controller()
                                                .animatecontrollerlist!,
                                            isFavIcon: true,
                                            title: "",
                                            isextended: false,
                                            onFavPressed: (int) {},
                                            shrinkWrap: true,
                                            width: w,
                                            isTopPadding: false,
                                            height: h * 0.58,
                                            padding: EdgeInsets.zero,
                                            favList: controller().getfavlist,
                                            scrollDirection: Axis.vertical,
                                            nameList: controller().nameList,
                                            imgList: controller().imgList,
                                            isCategory: false,
                                            isFeature: false,
                                            isViewAll: false)
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: h * 0.055),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Image.asset(AppImg.noChat,
                                                    height: h * 0.3,
                                                    width: w * 0.6,
                                                    fit: BoxFit.cover),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: h * 0.01),
                                                  child: CommonText(
                                                      textAlign:
                                                          TextAlign.center,
                                                      text:
                                                          AppText.haveNotListed,
                                                      style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: w * 0.06),
                                                  child: CommonText(
                                                      text: AppText.useAnyMore,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          fontSize: h * 0.02,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: h * 0.02),
                                                  child: CommonOutlineButton(
                                                    containerwidth: w * 0.5,
                                                    containerheight: h * 0.06,
                                                    backgroundColor:
                                                        AppColors.transparent,
                                                    // decoration: const BoxDecoration(
                                                    //     borderRadius: BorderRadius.all(Radius.circular(4)),
                                                    //     gradient: LinearGradient(
                                                    //       begin: Alignment.topLeft,
                                                    //       end: Alignment.bottomRight,
                                                    //       colors: [
                                                    //         AppColors.colorPrimary,
                                                    //         AppColors.colorSecondary,
                                                    //       ],
                                                    //     )),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      border: GradientBoxBorder(
                                                        gradient:
                                                            LinearGradient(
                                                                colors: [
                                                              AppColors
                                                                  .colorPrimary,
                                                              AppColors
                                                                  .colorSecondary
                                                            ]),
                                                        width: 2.5,
                                                      ),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              4),
                                                    ),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        4)),
                                                    text: AppText.startSell,
                                                    textStyle: ptSansTextStyle(
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
                                                                      100,
                                                                      0,
                                                                      300,
                                                                      20)),
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    onPressed: () {
                                                      commonNavigator(
                                                        context: context,
                                                        child: SellScreen(
                                                          fromNav: false,
                                                        ),
                                                        type: PageTransitionType
                                                            .rightToLeftWithFade,
                                                      );
                                                    },
                                                    side: BorderSide.none,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                  )
                                      .animate()
                                      .fadeIn(duration: 550.ms)
                                      .then(delay: 550.ms)
                                      .slideX(
                                          begin: 30,
                                          end: 0,
                                          curve: Curves.easeInOutCubic,
                                          duration: 1000.ms)
                                ]),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return const UserProfileShimmer();
          }),
    );
  }
}
