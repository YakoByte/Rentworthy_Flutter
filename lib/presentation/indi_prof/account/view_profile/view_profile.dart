import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/indi_prof/account/view_profile/view_profile_controller.dart';
import 'package:rentworthy/presentation/shimmers/view_profile_shimmer.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/common_outline_button.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_iconbutton.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../error/error_screen.dart';
import '../../home/categories/categories.dart';
import '../../sell/sell_screen.dart';
import '../edit_profile/edit_profile_screen.dart';
import '../widgets/profile_img_name.dart';

class ViewProfile extends ConsumerWidget {
  const ViewProfile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(viewProfileControllerProvider);
    controller() => ref.read(viewProfileControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        leadingicon: false,
        centerTitle: true,
        title: AppText.prof,
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
        suffixicon: SizedBox(
          height: h * 0.06,
          width: h * 0.06,
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
            fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(horizontal: w * 0.025),
        backgroundColor: AppColors.white,
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const ViewProfileShimmer();
            }
            return SafeArea(
              child: SingleChildScrollView(
                physics: const NeverScrollableScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Container(
                          height: controller().getproductlist.isNotEmpty
                              ? h * 0.31
                              : h * 0.24,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.04, vertical: h * 0.03),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ///Profile Image and Name
                                ProfileImgName(
                                        verified: controller()
                                                .getproductlist
                                                .isNotEmpty
                                            ? true
                                            : false,
                                        name: AppText.editProf,
                                        onTap: () {
                                          commonNavigator(
                                            context: context,
                                            child: const EditProfileScreen(),
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                          );
                                        })
                                    .animate()
                                    .fadeIn(duration: 200.ms)
                                    .then(delay: 200.ms)
                                    .slideY(
                                        begin: 30,
                                        end: 0,
                                        curve: Curves.easeInOutCubic,
                                        duration: 1000.ms),
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
                                            ///Member Since
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
                                                .slideY(
                                                    begin: 30,
                                                    end: 0,
                                                    curve:
                                                        Curves.easeInOutCubic,
                                                    duration: 1000.ms),

                                            ///Products Listed
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
                                                .slideY(
                                                    begin: 30,
                                                    end: 0,
                                                    curve:
                                                        Curves.easeInOutCubic,
                                                    duration: 1000.ms),
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
                                                offset: const Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                            border: const GradientBoxBorder(
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
                                              ///Rating
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
                                        )
                                    ],
                                  ),
                                ),
                                if (controller().getproductlist.isNotEmpty)
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.03),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        CommonText(
                                            style: ptSansTextStyle(
                                                foreground: Paint()
                                                  ..shader =
                                                      const LinearGradient(
                                                    colors: <Color>[
                                                      AppColors.colorPrimary,
                                                      AppColors.colorSecondary
                                                    ],
                                                  ).createShader(
                                                          const Rect.fromLTRB(
                                                              30, 0, 150, 10)),
                                                fontSize: h * 0.022,
                                                fontWeight: FontWeight.w500),
                                            text: AppText.businessHrs),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                color: AppColors.black,
                                                fontSize: h * 0.02,
                                                fontWeight: FontWeight.w500),
                                            text: AppText.openTime),
                                      ],
                                    ),
                                  )
                                      .animate()
                                      .fadeIn(duration: 400.ms)
                                      .then(delay: 400.ms)
                                      .slideY(
                                          begin: 30,
                                          end: 0,
                                          curve: Curves.easeInOutCubic,
                                          duration: 1000.ms)
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          color: AppColors.black.withOpacity(0.1),
                          thickness: 1.5,
                          height: h * 0.0,
                        )
                            .animate()
                            .fadeIn(duration: 450.ms)
                            .then(delay: 450.ms)
                            .slideX(
                                begin: 10,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 1000.ms),
                      ],
                    ),

                    ///Products
                    Container(
                      height: h * 0.59,
                      child: controller().getproductlist.isNotEmpty
                          ? Categories(
                              animatecontrollerlist:
                                  controller().animatecontrollerlist!,
                              isFavIcon: true,
                              title: "",
                              isextended: false,
                              onFavPressed: (int) {},
                              shrinkWrap: true,
                              width: w,
                              isTopPadding: false,
                              height: h * 0.59,
                              padding: EdgeInsets.zero,
                              favList: controller().getfavlist,
                              scrollDirection: Axis.vertical,
                              nameList: controller().nameList,
                              imgList: controller().imgList,
                              isCategory: false,
                              isFeature: false,
                              isViewAll: false)
                          : Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: h * 0.055),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image.asset(AppImg.noChat,
                                      height: h * 0.3,
                                      width: w * 0.6,
                                      fit: BoxFit.cover),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * 0.01),
                                    child: CommonText(
                                        textAlign: TextAlign.center,
                                        text: AppText.haveNotListed,
                                        style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.4),
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.06),
                                    child: CommonText(
                                        text: AppText.useAnyMore,
                                        textAlign: TextAlign.center,
                                        style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.4),
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w400)),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: h * 0.02),
                                    child: CommonOutlineButton(
                                      containerwidth: w * 0.5,
                                      containerheight: h * 0.06,
                                      backgroundColor: AppColors.transparent,
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
                                        border: const GradientBoxBorder(
                                          gradient: LinearGradient(colors: [
                                            AppColors.colorPrimary,
                                            AppColors.colorSecondary
                                          ]),
                                          width: 2.5,
                                        ),
                                        borderRadius: BorderRadius.circular(4),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      text: AppText.startSell,
                                      textStyle: ptSansTextStyle(
                                          foreground: Paint()
                                            ..shader = const LinearGradient(
                                              colors: <Color>[
                                                AppColors.colorPrimary,
                                                AppColors.colorSecondary
                                              ],
                                            ).createShader(const Rect.fromLTRB(
                                                100, 0, 300, 20)),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w700),
                                      onPressed: () {
                                        ///Navigate to Sell Screen
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
                        .fadeIn(duration: 450.ms)
                        .then(delay: 450.ms)
                        .slideY(
                            begin: 10,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 1000.ms)
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
            return const ViewProfileShimmer();
          }),
    );
  }
}
