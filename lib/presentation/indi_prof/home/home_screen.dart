import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/both_prof/g_map/g_map.dart';
import 'package:rentworthy/presentation/indi_prof/sell/post_add/post_ur_ad.dart';
import 'package:rentworthy/presentation/indi_prof/sell/sell_screen.dart';
import 'package:rentworthy/presentation/shimmers/home_page_shimmer.dart';
import 'package:rentworthy/utils/color.dart';
import 'package:rentworthy/utils/common_components/common_appbar.dart';
import 'package:rentworthy/utils/common_components/common_carouselslider.dart';
import 'package:rentworthy/utils/common_components/common_pageview.dart';
import 'package:rentworthy/utils/globals.dart';

import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_loader.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../account/setting/notification/notification.dart';
import '../chat/chat_screen.dart';
import '../error/error_screen.dart';
import 'categories/categories.dart';
import 'categories/home_appbar.dart';
import 'categories/home_nav_drawer.dart';
import 'categories/home_search.dart';
import 'home_screen_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeScreenControllerProvider);
    controller() => ref.read(homeScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.scaffoldKey,
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,

      ///  Post Ad Floating Action Button
      floatingActionButton: controller().isLoading
          ? null
          : Padding(
              padding: EdgeInsets.only(top: h * 0.7),
              child: CommonButton(
                decoration: const BoxDecoration(
                  color: AppColors.yellow,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                onPressed: () {
                  commonNavigator(
                    context: context,
                    child: SellScreen(
                      fromNav: false,
                    ),
                    type: PageTransitionType.rightToLeftWithFade,
                  );
                },
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(100)),
                backgroundColor: AppColors.transparent,
                containerwidth: h * 0.088,
                containerheight: h * 0.088,
                text: 'Post Ad',
                textStyle: ptSansTextStyle(
                  color: AppColors.black.withOpacity(0.8),
                  fontSize: h * 0.022,
                  fontWeight: FontWeight.w600,
                ),
                centericon: Center(
                    child: Image.asset(AppImg.chat1,
                        color: AppColors.white, height: h * 0.035)),
              ),
            ).animate().fadeIn(duration: 150.ms).then(delay: 150.ms).slideX(
              begin: 3,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
      drawerScrimColor: AppColors.black.withOpacity(0.4),

      ///  Home Navigation Drawer
      drawer: const HomeNavDrawer()
          .animate()
          .fadeIn(duration: 30.ms)
          .then(delay: 20.ms)
          .slideX(
              begin: -1,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 400.ms),
      appBar: controller().showAppbar
          ? CommonAppBar(
              centerTitle: false,
              padding: EdgeInsets.symmetric(horizontal: w * 0.05),
              leadingicon: false,
              backgroundColor: AppColors.white,

              /// Notification Icon
              suffixicon: Container(
                height: h * 0.07,
                width: w * 0.1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: const NotificationScreen(),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Image.asset(
                        AppImg.bell,
                        height: h * 0.03,
                        width: h * 0.03,
                      ),
                    ),
                  ],
                ),
              )
                  .animate(
                      controller: controller().appbaranimationcontroller,
                      autoPlay: false)
                  .fadeIn(duration: 250.ms)
                  .then(delay: 250.ms)
                  .slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 1000.ms),
              centerwidget: !controller().isLoading
                  ? const HomeAppBar()
                      .animate(
                          controller: controller().appbaranimationcontroller,
                          autoPlay: false)
                      .fadeIn(duration: 250.ms)
                      .then(delay: 250.ms)
                      .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1000.ms)
                  : null,
            )
          : null,
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const HomeShimmer();
            }
            return Container(
              width: w,
              height: h,
              color: AppColors.white,
              child: SafeArea(
                child: SingleChildScrollView(
                  controller: controller().scrollViewController,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      /// Search
                      const HomeSearch()
                          .animate()
                          .fadeIn(duration: 50.ms)
                          .then(delay: 50.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),

                      /// Categories
                      Categories(
                        animatecontrollerlist: const [],
                        isFavIcon: true,
                        isFeature: false,
                        isextended: false,
                        isTopPadding: false,
                        title: AppText.categories,
                        isViewAll: true,
                        height: h * 0.27,
                        favList: const [],
                        onFavPressed: (index) {},
                        isCategory: true,
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.05, vertical: h * 0.015),
                        shrinkWrap: true,
                        width: w,
                        nameList: controller().nameList,
                        scrollDirection: Axis.vertical,
                        imgList: controller().imgList,
                      )
                          .animate()
                          .fadeIn(duration: 300.ms)
                          .then(delay: 300.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),

                      /// Carousel
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.05,
                            ),
                            child: CommonText(
                                text: "Chance to win",
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.022,
                                  fontWeight: FontWeight.w800,
                                )),
                          ),
                          CommonCarousel(
                            enlargeFactor: 0.3,
                            containerheight: h * 0.18,
                            containerwidth: w,
                            gradient: false,
                            viewportFraction: 0.9,
                            scrollDirection: Axis.horizontal,
                            autoPlayCurve: Curves.bounceIn,
                            aspectRatio: 1 / 1,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            reverse: false,
                            padding: EdgeInsets.symmetric(vertical: h * 0.01),
                            carouselHeight: h * 0.22,
                            carouselController: controller().carouselController,
                            disableGesture: false,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.015),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.asset(
                                  AppImg.banner1,
                                ),
                              ),
                            ),

                            // Container(
                            //   width: w * 0.35,
                            //   child: RichText(
                            //     textAlign: TextAlign.start,
                            //     text: TextSpan(
                            //       text: "${AppText.onlymay}\n",
                            //       style: ptSansTextStyle(
                            //           color: AppColors.white,
                            //           fontSize: h * 0.016,
                            //           fontWeight: FontWeight.w400),
                            //       children: <TextSpan>[
                            //         TextSpan(
                            //             text: "${AppText.sonyps}\n",
                            //             style: ptSansTextStyle(
                            //                 color: AppColors.white,
                            //                 fontSize: h * 0.022,
                            //                 fontWeight: FontWeight.w700)),
                            //         TextSpan(
                            //           text: AppText.permonth,
                            //           style: ptSansTextStyle(
                            //               color: AppColors.white,
                            //               fontSize: h * 0.015,
                            //               fontWeight: FontWeight.w400),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            dotindicator: false,
                          ),
                        ],
                      )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .then(delay: 400.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),

                      /// Featured Ads
                      Categories(
                        animatecontrollerlist: const [],
                        isFavIcon: true,
                        isFeature: true,
                        isTopPadding: false,
                        onFavPressed: (index) {
                          controller().onFavTap(index, 0);
                        },
                        isextended: false,
                        title: AppText.featuredAds,
                        isViewAll: false,
                        isCategory: false,
                        shrinkWrap: false,
                        width: w,
                        height: h * 0.35,
                        scrollDirection: Axis.horizontal,
                        nameList: controller().productList,
                        imgList: controller().productimgList,
                        favList: controller().getfeatureadfavlist,
                        contheight: h * 0.32,
                        contwidth: w * 0.45,
                        type: 0,
                        contColor: AppColors.white,
                        borderRadius: BorderRadius.circular(h * 0.025),
                      )
                          .animate()
                          .fadeIn(duration: 500.ms)
                          .then(delay: 500.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),

                      /// Carousel
                      CommonCarousel(
                        enlargeFactor: 0.3,
                        containerheight: h * 0.18,
                        containerwidth: w,
                        gradient: false,
                        viewportFraction: 0.9,
                        scrollDirection: Axis.horizontal,
                        autoPlayCurve: Curves.bounceIn,
                        aspectRatio: 1 / 1,
                        enableInfiniteScroll: false,
                        autoPlay: false,
                        reverse: false,
                        padding: EdgeInsets.symmetric(vertical: h * 0.02),
                        carouselHeight: h * 0.22,
                        carouselController: controller().carouselController,
                        disableGesture: false,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.015),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                              AppImg.banner1,
                            ),
                          ),
                        ),

                        // Container(
                        //   width: w * 0.35,
                        //   child: RichText(
                        //     textAlign: TextAlign.start,
                        //     text: TextSpan(
                        //       text: "${AppText.onlymay}\n",
                        //       style: ptSansTextStyle(
                        //           color: AppColors.white,
                        //           fontSize: h * 0.016,
                        //           fontWeight: FontWeight.w400),
                        //       children: <TextSpan>[
                        //         TextSpan(
                        //             text: "${AppText.sonyps}\n",
                        //             style: ptSansTextStyle(
                        //                 color: AppColors.white,
                        //                 fontSize: h * 0.022,
                        //                 fontWeight: FontWeight.w700)),
                        //         TextSpan(
                        //           text: AppText.permonth,
                        //           style: ptSansTextStyle(
                        //               color: AppColors.white,
                        //               fontSize: h * 0.015,
                        //               fontWeight: FontWeight.w400),
                        //         ),
                        //       ],
                        //     ),
                        //   ),
                        // ),
                        dotindicator: false,
                      )
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .then(delay: 400.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),

                      /// Popular ads
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.005),
                        child: Categories(
                          animatecontrollerlist: const [],
                          isFavIcon: true,
                          isFeature: false,
                          isextended: false,
                          title: AppText.popularAds,
                          isViewAll: true,
                          isTopPadding: false,
                          type: 2,

                          isCategory: false,
                          shrinkWrap: false,
                          width: w,
                          height: h * 0.35,
                          scrollDirection: Axis.horizontal,
                          nameList: controller().productList,
                          imgList: controller().productimgList,
                          favList: controller().getfeatureadfavlist,
                          contheight: h * 0.32,
                          contwidth: w * 0.45,
                          contColor: AppColors.white,
                          borderRadius: BorderRadius.circular(h * 0.025),
                          onFavPressed: (index) {
                            controller().onFavTap(index, 2);
                          },
                        )
                            .animate()
                            .fadeIn(duration: 600.ms)
                            .then(delay: 600.ms)
                            .slideX(
                              begin: 1,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 600.ms,
                            ),
                      ),

                      ///RentWorthy Collection
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.01),
                        child: Column(
                          children: [
                            Container(
                              height: h * 0.3,
                              width: w,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      AppColors.colorPrimary,
                                      AppColors.colorSecondary
                                    ]),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.05,
                                    ),
                                    child: CommonText(
                                        text: "RentWorthy Collection",
                                        style: ptSansTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.022,
                                          fontWeight: FontWeight.w800,
                                        )),
                                  ),
                                  CommonPageView(
                                      onPageChanged: (index) {
                                        controller().onPageChanged(index);
                                      },
                                      getcurrentPageIndex:
                                          controller().getcurrentPageIndex,
                                      dotindicator: true,
                                      containerHeight: h * 0.2,
                                      containerwidth: w,
                                      scrollDirection: Axis.horizontal,
                                      pageSnapping: false,
                                      reverse: false,
                                      gradient: false,
                                      padEnds: false,
                                      itemBuilder: (BuildContext context,
                                              int pageViewIndex) =>
                                          Center(
                                            child: Container(
                                                height: h * 0.18,
                                                width: h * 0.18,
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: w * 0.02),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            14),
                                                    color: AppColors.white),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Center(
                                                      child: Image.asset(
                                                          controller().imgList[
                                                              pageViewIndex],
                                                          height: h * 0.1,
                                                          width: w * 0.3),
                                                    ),
                                                    CommonText(
                                                        text: controller()
                                                                .nameList[
                                                            pageViewIndex],
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.8),
                                                          fontSize: h * 0.015,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                        )),
                                                  ],
                                                )),
                                          ),
                                      itemCount: controller().imgList.length,
                                      pageController:
                                          controller().rentCollection,
                                      padding: EdgeInsets.only(
                                        top: h * 0.015,
                                        bottom: h * 0.015,
                                      )),
                                ],
                              ),
                            ),
                          ],
                        )
                            .animate()
                            .fadeIn(duration: 600.ms)
                            .then(delay: 600.ms)
                            .slideX(
                              begin: 1,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 600.ms,
                            ),
                      ),

                      /// RentWorthy Experiences
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.05,
                            ),
                            child: CommonText(
                                text: "Rentworthy Experiences",
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.022,
                                  fontWeight: FontWeight.w800,
                                )),
                          ),
                          CommonCarousel(
                            enlargeFactor: 0.3,
                            containerheight: h * 0.18,
                            containerwidth: w,
                            gradient: false,
                            viewportFraction: 0.9,
                            scrollDirection: Axis.horizontal,
                            autoPlayCurve: Curves.bounceIn,
                            aspectRatio: 1 / 1,
                            enableInfiniteScroll: false,
                            autoPlay: false,
                            reverse: false,
                            padding: EdgeInsets.symmetric(vertical: h * 0.01),
                            carouselHeight: h * 0.22,
                            carouselController: controller().carouselController,
                            disableGesture: false,
                            itemCount: 3,
                            itemBuilder: (BuildContext context, int itemIndex,
                                    int pageViewIndex) =>
                                Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.015),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Stack(
                                  children: [
                                    Image.asset(
                                      AppImg.banner1,
                                    ),
                                    Positioned(
                                      bottom: h * 0.02,
                                      left: w * 0.02,
                                      child: CommonText(
                                          text: "Camping",
                                          style: ptSansTextStyle(
                                            color: AppColors.white,
                                            fontSize: h * 0.022,
                                            fontWeight: FontWeight.w800,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                            ),

                            // Container(
                            //   width: w * 0.35,
                            //   child: RichText(
                            //     textAlign: TextAlign.start,
                            //     text: TextSpan(
                            //       text: "${AppText.onlymay}\n",
                            //       style: ptSansTextStyle(
                            //           color: AppColors.white,
                            //           fontSize: h * 0.016,
                            //           fontWeight: FontWeight.w400),
                            //       children: <TextSpan>[
                            //         TextSpan(
                            //             text: "${AppText.sonyps}\n",
                            //             style: ptSansTextStyle(
                            //                 color: AppColors.white,
                            //                 fontSize: h * 0.022,
                            //                 fontWeight: FontWeight.w700)),
                            //         TextSpan(
                            //           text: AppText.permonth,
                            //           style: ptSansTextStyle(
                            //               color: AppColors.white,
                            //               fontSize: h * 0.015,
                            //               fontWeight: FontWeight.w400),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                            dotindicator: false,
                          )
                              .animate()
                              .fadeIn(duration: 400.ms)
                              .then(delay: 400.ms)
                              .slideX(
                                begin: 1,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 600.ms,
                              ),
                        ],
                      ),

                      /// Nearby ads
                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.015),
                        child: Categories(
                          animatecontrollerlist: const [],
                          isFavIcon: true,
                          isFeature: false,
                          onFavPressed: (index) {
                            controller().onFavTap(index, 1);
                          },
                          title: AppText.nearByAds,
                          isViewAll: true,
                          isextended: false,
                          isCategory: false,
                          isTopPadding: false,

                          shrinkWrap: false,
                          width: w,
                          type: 1,
                          height: h * 0.35,
                          scrollDirection: Axis.horizontal,
                          nameList: controller().productList,
                          imgList: controller().productimgList,
                          favList: controller().getfeatureadfavlist,
                          contheight: h * 0.32,
                          contwidth: w * 0.45,
                          contColor: AppColors.white,
                          borderRadius: BorderRadius.circular(h * 0.025),
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

                      Image.asset(AppImg.footer,
                              height: h * 0.4, width: w, fit: BoxFit.fill)
                          .animate()
                          .fadeIn(duration: 900.ms)
                          .then(delay: 900.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),
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
            return const HomeShimmer();
          }),
    );
  }
}
