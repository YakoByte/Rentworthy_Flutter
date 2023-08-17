import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/home/categories/home_appbar.dart';
import 'package:rentworthy/utils/color.dart';
import 'package:rentworthy/utils/common_components/common_carouselslider.dart';

import '../../../utils/common_components/common_text.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import 'categories/categories.dart';
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
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
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
                const HomeAppBar(),

                /// Search
                const HomeSearch(),

                /// Categories
                Categories(
                  isFeature: false,
                  title: AppText.categories,
                  isViewAll: true,
                  height: h * 0.27,
                  favList: [],
                  isCategory: true,
                  padding: EdgeInsets.only(top: h * 0.02),
                  shrinkWrap: true,
                  width: w,
                  nameList: controller().nameList,
                  scrollDirection: Axis.vertical,
                  imgList: controller().imgList,
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
                  padding: EdgeInsets.zero,
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
                        horizontal: w * 0.025,
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
                ),

                /// Featured Ads
                Categories(
                  isFeature: true,
                  title: AppText.featuredads,
                  isViewAll: false,
                  isCategory: false,
                  shrinkWrap: false,
                  width: w,
                  height: h * 0.31,
                  scrollDirection: Axis.horizontal,
                  nameList: controller().nameList,
                  imgList: controller().imgList,
                  favList: controller().getfeatureadfavlist,
                  contheight: h * 0.3,
                  contwidth: w * 0.45,
                  type: 0,
                  contColor: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ),

                ///Promote your ad in Featured
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.05, vertical: h * 0.01),
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
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: h * 0.01,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonCarousel(
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
                          padding: EdgeInsets.only(bottom: h * 0.015),
                          carouselHeight: h * 0.2,
                          carouselController: controller().carouselController,
                          disableGesture: false,
                          itemCount: controller().imgList.length,
                          itemBuilder: (BuildContext context, int itemIndex,
                                  int pageViewIndex) =>
                              Container(
                                  height: h * 0.2,
                                  width: h * 0.2,
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
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.8),
                                            fontSize: h * 0.015,
                                            fontWeight: FontWeight.w400,
                                          )),
                                    ],
                                  )),
                        ),
                      ],
                    ),
                  ),
                ),

                /// Nearby ads
                Categories(
                  isFeature: false,
                  title: AppText.nearbyads,
                  isViewAll: true,
                  isCategory: false,
                  favList: controller().getnearbyadfavlist,
                  shrinkWrap: false,
                  width: w,
                  type: 1,
                  height: h * 0.31,
                  scrollDirection: Axis.horizontal,
                  nameList: controller().nameList,
                  imgList: controller().imgList,
                  contheight: h * 0.3,
                  contwidth: w * 0.45,
                  contColor: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ),

                /// Popular ads
                Categories(
                  isFeature: false,
                  title: AppText.popularads,
                  isViewAll: true,
                  type: 2,
                  favList: controller().getpopularfavlist,
                  isCategory: false,
                  shrinkWrap: false,
                  width: w,
                  height: h * 0.31,
                  scrollDirection: Axis.horizontal,
                  nameList: controller().nameList,
                  imgList: controller().imgList,
                  contheight: h * 0.3,
                  contwidth: w * 0.45,
                  contColor: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ),
                Image.asset(AppImg.footer,
                    height: h * 0.4, width: w, fit: BoxFit.fill),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
