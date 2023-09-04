import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/color.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/common_popup.dart';
import 'package:rentworthy/utils/common_components/common_text.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../application/dialog/dialod_service.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_carouselslider.dart';
import '../../../../../utils/images.dart';
import '../../../chat/chat_screen.dart';
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
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: h * 0.7),
        child: CommonButton(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.colorPrimary,
                  AppColors.colorSecondary,
                ],
              )),
          onPressed: () {
            commonNavigator(
              context: context,
              child: ChatScreen(frombottom: false),
              type: PageTransitionType.rightToLeftWithFade,
            );
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
          backgroundColor: AppColors.transparent,
          containerwidth: h * 0.068,
          containerheight: h * 0.068,
          text: '',
          textStyle: ptSansTextStyle(),
          centericon: Center(
              child: Image.asset(AppImg.chat1,
                  color: AppColors.white, height: h * 0.035)),
        ),
      ).animate().fadeIn(duration: 150.ms).then(delay: 150.ms).slideY(
          begin: 3, end: 0, curve: Curves.easeInOutCubic, duration: 1000.ms),
      appBar: CommonAppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          title: AppText.subcat,
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
      body: Container(
        height: h,
        child: SingleChildScrollView(
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
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
                            height: h * 0.3, width: w * 0.8, fit: BoxFit.cover),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: 150.ms).then(delay: 150.ms).slideY(
                    begin: 3,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 1000.ms),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    CommonText(
                        text: AppText.dummytext,
                        style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.4),
                          fontSize: h * 0.023,
                          fontWeight: FontWeight.w400,
                        )),
                  ],
                ).animate().fadeIn(duration: 350.ms).then(delay: 350.ms).slideY(
                    begin: 3,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 1100.ms),
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
                        padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: w * 0.016),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: Image.asset(
                                      AppImg.homelist,
                                      height: h * 0.075,
                                      width: h * 0.075,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: w * 0.45,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
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
                                                  fontWeight: FontWeight.w400,
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
                                                  fontWeight: FontWeight.w400,
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
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            CommonIconButton(
                                containerwidth: h * 0.06,
                                containerheight: h * 0.06,
                                backgroundColor: AppColors.transparent,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ])),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(100)),
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
                                  child: Icon(Icons.call_outlined,
                                      color: AppColors.white, size: h * 0.035),
                                ),
                                onPressed: () {}),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).animate().fadeIn(duration: 450.ms).then(delay: 450.ms).slideY(
                    begin: 3,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 1200.ms),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.008),
                  child: Card(
                    color: AppColors.white,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    child: Container(
                      height: h * 0.11,
                      width: w,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: w * 0.06),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                                text: AppText.adpostedat,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  fontSize: h * 0.024,
                                  fontWeight: FontWeight.w600,
                                )),
                            CommonText(
                                text: AppText.tampaflorida,
                                style: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.034,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ).animate().fadeIn(duration: 550.ms).then(delay: 550.ms).slideY(
                    begin: 3,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 1300.ms),
                SizedBox(
                  height: h * 0.15,
                ),
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
                            text: AppText.totalpayable,
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.4),
                              fontSize: h * 0.023,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                    CommonButton(
                        containerwidth: w * 0.48,
                        containerheight: h * 0.069,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.006),
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
                              backgroundColor: AppColors.white.withOpacity(0.4),
                              radius: h * 0.023,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
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
                        text: AppText.rentnow,
                        textStyle: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w500),
                        onPressed: () {
                          ref.read(dialogServiceProvider).selectDatedialog();
                        }),
                  ],
                ).animate().fadeIn(duration: 650.ms).then(delay: 650.ms).slideY(
                    begin: 3,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 1400.ms)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryDetailsShimmer extends ConsumerWidget {
  const CategoryDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Shimmer.fromColors(
      baseColor: AppColors.shimmergrey,
      highlightColor: AppColors.greybgColor,
      enabled: true,
      child: ListView.builder(
        itemBuilder: (_, __) => Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 48.0,
                height: 48.0,
                color: Colors.white,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: double.infinity,
                      height: 8.0,
                      color: Colors.white,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 2.0),
                    ),
                    Container(
                      width: 40.0,
                      height: 8.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        itemCount: 6,
      ),
    );
  }
}
