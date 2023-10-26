import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/shimmers/category_details_shimmer.dart';
import 'package:rentworthy/utils/color.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';
import 'package:rentworthy/utils/common_components/common_loader.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/common_popup.dart';
import 'package:rentworthy/utils/common_components/common_text.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../application/dialog/dialog_service.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_carouselslider.dart';
import '../../../../../utils/images.dart';
import '../../../../both_prof/g_map/g_map.dart';
import '../../../account/view_profile/view_profile.dart';
import '../../../chat/chat_screen.dart';
import '../../../error/error_screen.dart';
import 'category_details_screen_controller.dart';

class CategoryDetailsScreen extends ConsumerWidget {
  String title;

  CategoryDetailsScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(categoryDetailsControllerProvider);
    controller() => ref.read(categoryDetailsControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: AppText.subCat,
          leadingicon: false,
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.035,
          ),
          leadicon: Card(
            elevation: 2,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(h * 0.01)),
            child: CommonIconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              centericon: ShaderMask(
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
                child: Center(
                  child: Icon(Icons.arrow_back_ios_new_outlined,
                      color: AppColors.white, size: h * 0.026),
                ),
              ),
              containerwidth: h * 0.06,
              containerheight: h * 0.06,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.01)),
            ),
          ),
          textstyle: ptSansTextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    AppColors.colorPrimary,
                    AppColors.colorSecondary
                  ],
                ).createShader(const Rect.fromLTRB(150, 0, 250, 20)),
              fontSize: h * 0.025,
              fontWeight: FontWeight.w700),
          suffixicon: Card(
            elevation: 2,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(h * 0.01)),
            child: CommonIconButton(
              onPressed: () async {
                CommonPopup(
                    position:
                        RelativeRect.fromLTRB(w * 0.5, 0, w * 0.02, h * 0.8),
                    items: controller().popupitemList);
              },
              centericon: ShaderMask(
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
                child: Icon(Icons.more_vert,
                    color: AppColors.white, size: h * 0.03),
              ),
              containerwidth: h * 0.06,
              containerheight: h * 0.06,
              backgroundColor: AppColors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(h * 0.01)),
            ),
          )),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const CategoryDetailsShimmer();
            }
            return SizedBox(
              height: h,
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.02),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///product image slider
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
                          .fadeIn(duration: 150.ms)
                          .then(delay: 150.ms)
                          .slideY(
                              begin: 3,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1000.ms),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ///product title
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.02),
                            child: CommonText(
                                text: title,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  fontSize: h * 0.033,
                                  fontWeight: FontWeight.w700,
                                )),
                          ),

                          ///product description
                          CommonText(
                              text: AppText.dummyText,
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.4),
                                fontSize: h * 0.023,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      )
                          .animate()
                          .fadeIn(duration: 350.ms)
                          .then(delay: 350.ms)
                          .slideY(
                              begin: 3,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1100.ms),

                      ///product seller details
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.012),
                        child: Card(
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
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      commonNavigator(
                                        context: context,
                                        child: const ViewProfile(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                      );
                                    },
                                    child: Row(
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
                                              AppImg.homeList,
                                              height: h * 0.075,
                                              width: h * 0.075,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: w * 0.45,
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
                                                        text: AppText.postedBy,
                                                        maxLines: 1,
                                                        style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                        text: AppText.hamzaAli,
                                                        maxLines: 1,
                                                        style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.8),
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                                        text: AppText.postedOn,
                                                        maxLines: 1,
                                                        style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          overflow: TextOverflow
                                                              .ellipsis,
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
                                  ),
                                  CommonIconButton(
                                      containerwidth: h * 0.06,
                                      containerheight: h * 0.06,
                                      backgroundColor: AppColors.transparent,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          gradient: const LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                AppColors.colorPrimary,
                                                AppColors.colorSecondary
                                              ])),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(100)),
                                      centericon: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            colors: [
                                              AppColors.white,
                                              AppColors.yellow,
                                            ],
                                          ).createShader(bounds);
                                        },
                                        child: Image.asset(AppImg.chat2,
                                            color: AppColors.white,
                                            height: h * 0.035),
                                      ),
                                      onPressed: () {
                                        commonNavigator(
                                          context: context,
                                          child: ChatScreen(frombottom: false),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                        );
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 450.ms)
                          .then(delay: 450.ms)
                          .slideY(
                              begin: 3,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1200.ms),

                      /// location
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.008),
                        child: Card(
                          color: AppColors.white,
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12)),
                          child: Container(
                            height: h * 0.3,
                            width: w,
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GoogleMapWidget(
                                    borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(12))),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.06),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          text: AppText.adPostedAt,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.6),
                                            fontSize: h * 0.024,
                                            fontWeight: FontWeight.w600,
                                          )),
                                      CommonText(
                                          text: AppText.tampaFlorida,
                                          style: ptSansTextStyle(
                                            color: AppColors.black,
                                            fontSize: h * 0.034,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ],
                                  ),
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
                              begin: 3,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1300.ms),
                      SizedBox(
                        height: h * 0.15,
                      ),

                      /// product price, Rent button
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CommonText(
                                  text: AppText.day,
                                  style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.03,
                                    fontWeight: FontWeight.w700,
                                  )),
                              CommonText(
                                  text: AppText.totalPayable,
                                  style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
                                    fontSize: h * 0.023,
                                    fontWeight: FontWeight.w500,
                                  )),
                            ],
                          ),

                          /// Rent button
                          CommonButton(
                              containerwidth: w * 0.48,
                              containerheight: h * 0.069,
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
                                borderRadius: BorderRadius.circular(h * 0.006),
                              ),
                              prefixicon: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    backgroundColor:
                                        AppColors.white.withOpacity(0.4),
                                    radius: h * 0.023,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          color: AppColors.white,
                                          size: h * 0.03,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              text: AppText.rentNow,
                              textStyle: ptSansTextStyle(
                                  color: AppColors.white,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w500),
                              onPressed: () {
                                /// show calendar dialog
                                ref
                                    .read(dialogServiceProvider)
                                    .selectDateDialog();
                              }),
                        ],
                      )
                          .animate()
                          .fadeIn(duration: 650.ms)
                          .then(delay: 650.ms)
                          .slideY(
                              begin: 3,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1400.ms)
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
            return CommonLoader();
          }),
    );
  }
}
