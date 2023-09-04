import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/color.dart';
import 'package:rentworthy/utils/common_components/common_carouselslider.dart';
import 'package:rentworthy/utils/globals.dart';

import '../../../utils/common_components/common_text.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
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
      drawerScrimColor: AppColors.black.withOpacity(0.4),
      drawer: HomeNavDrawer()
          .animate()
          .fadeIn(duration: 30.ms)
          .then(delay: 20.ms)
          .slideX(
              begin: -1,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 400.ms),
      body: Container(
        width: w,
        height: h,
        color: AppColors.white,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                /// Appbar
                const HomeAppBar()
                    .animate()
                    .fadeIn(duration: 50.ms)
                    .then(delay: 50.ms)
                    .slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 300.ms,
                    ),

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
                  animatecontrollerlist: [],
                  isFavIcon: true,
                  isFeature: false,
                  isextended: false,
                  isTopPadding: false,
                  title: AppText.categories,
                  isViewAll: true,
                  height: h * 0.27,
                  favList: [],
                  onFavPressed: (index) {},
                  isCategory: true,
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.05, vertical: h * 0.015),
                  shrinkWrap: true,
                  width: w,
                  nameList: controller().nameList,
                  scrollDirection: Axis.vertical,
                  imgList: controller().imgList,
                ).animate().fadeIn(duration: 300.ms).then(delay: 300.ms).slideX(
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
                  padding: EdgeInsets.symmetric(vertical: h * 0.01),
                  carouselHeight: h * 0.18,
                  carouselController: controller().carouselController,
                  disableGesture: false,
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                    height: h * 0.18,
                    margin: EdgeInsets.symmetric(horizontal: w * 0.02),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ]),
                        borderRadius: BorderRadius.circular(16)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: w * 0.026,
                        vertical: h * 0.01,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: w * 0.35,
                            child: RichText(
                              textAlign: TextAlign.start,
                              text: TextSpan(
                                text: "${AppText.onlymay}\n",
                                style: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: h * 0.016,
                                    fontWeight: FontWeight.w400),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: "${AppText.sonyps}\n",
                                      style: ptSansTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.022,
                                          fontWeight: FontWeight.w700)),
                                  TextSpan(
                                    text: AppText.permonth,
                                    style: ptSansTextStyle(
                                        color: AppColors.white,
                                        fontSize: h * 0.015,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(AppImg.announcement,
                              height: h * 0.32, width: w * 0.45)
                        ],
                      ),
                    ),
                  ),
                  dotindicator: false,
                ).animate().fadeIn(duration: 400.ms).then(delay: 400.ms).slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),

                /// Featured Ads
                Categories(
                  animatecontrollerlist: [],
                  isFavIcon: true,
                  isFeature: true,
                  isTopPadding: false,
                  onFavPressed: (index) {
                    controller().onFavTap(index, 0);
                  },
                  isextended: false,
                  title: AppText.featuredads,
                  isViewAll: false,
                  isCategory: false,
                  shrinkWrap: false,
                  width: w,
                  height: h * 0.35,
                  scrollDirection: Axis.horizontal,
                  nameList: controller().nameList,
                  imgList: controller().imgList,
                  favList: controller().getfeatureadfavlist,
                  contheight: h * 0.32,
                  contwidth: w * 0.45,
                  type: 0,
                  contColor: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ).animate().fadeIn(duration: 500.ms).then(delay: 500.ms).slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),

                ///Promote your ad in Featured
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.015),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.05, vertical: h * 0.015),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CommonText(
                                text: AppText.promoteurad,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.022,
                                  fontWeight: FontWeight.w700,
                                )),
                            Icon(
                              Icons.add,
                              color: AppColors.black,
                              size: h * 0.03,
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: h * 0.25,
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
                        child: CommonCarousel(
                          enlargeFactor: 0.4,
                          dotindicator: true,
                          gradient: false,
                          containerheight: h * 0.2,
                          containerwidth: w,
                          viewportFraction: w / (w * 2),
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
                          padding: EdgeInsets.symmetric(vertical: h * 0.015),
                          carouselHeight: h * 0.2,
                          carouselController: controller().carouselController,
                          disableGesture: false,
                          itemCount: controller().imgList.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                                  height: h * 0.2,
                                  width: h * 0.2,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(14),
                                      color: AppColors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Center(
                                        child: Image.asset(
                                            controller().imgList[pageViewIndex],
                                            height: h * 0.1,
                                            width: w * 0.3),
                                      ),
                                      CommonText(
                                          text: controller()
                                              .nameList[pageViewIndex],
                                          textAlign: TextAlign.center,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.8),
                                            fontSize: h * 0.015,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  )),
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

                /// Nearby ads
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.015),
                  child: Categories(
                    animatecontrollerlist: [],
                    isFavIcon: true,
                    isFeature: false,
                    onFavPressed: (index) {
                      controller().onFavTap(index, 1);
                    },
                    title: AppText.nearbyads,
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

                /// Popular ads
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.005),
                  child: Categories(
                    animatecontrollerlist: [],
                    isFavIcon: true,
                    isFeature: false,
                    isextended: false,
                    title: AppText.popularads,
                    isViewAll: true,
                    isTopPadding: false,
                    type: 2,
                    favList: controller().getpopularfavlist,
                    isCategory: false,
                    shrinkWrap: false,
                    width: w,
                    height: h * 0.35,
                    scrollDirection: Axis.horizontal,
                    nameList: controller().nameList,
                    imgList: controller().imgList,
                    contheight: h * 0.32,
                    contwidth: w * 0.45,
                    contColor: AppColors.white,
                    borderRadius: BorderRadius.circular(14),
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
      ),
    );
  }
}
