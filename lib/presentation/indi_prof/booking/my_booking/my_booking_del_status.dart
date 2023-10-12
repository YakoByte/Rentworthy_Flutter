import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_iconbutton.dart';
import '../../../../utils/common_components/common_outline_button.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/stepper/src/stepper.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../../shimmers/booking_del_status_shimmer.dart';
import '../../account/setting/my_address/my_address.dart';
import '../../account/view_profile/view_profile.dart';
import '../../chat/chat_screen.dart';
import '../../error/error_screen.dart';
import 'my_booking_del_status_controller.dart';

class MyBookingDelStatus extends ConsumerWidget {
  const MyBookingDelStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(myBookingDelStatusControllerProvider);
    controller() => ref.read(myBookingDelStatusControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
          backgroundColor: AppColors.white,
          centerTitle: true,
          leadingicon: false,
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.035,
          ),
          centerwidget: CommonText(
                  text: "Xbox",
                  style: ptSansTextStyle(
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ],
                        ).createShader(const Rect.fromLTRB(10, 0, 60, 50)),
                      fontSize: h * 0.025,
                      fontWeight: FontWeight.w700))
              .animate()
              .fade(duration: 1000.ms)
              .then(delay: 1000.ms)
              .slideX(
                  begin: 0, end: 0, curve: Curves.decelerate, duration: 800.ms),
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
          ).animate().fade(duration: 1000.ms).then(delay: 1000.ms).slideX(
              begin: 0, end: 0, curve: Curves.decelerate, duration: 800.ms),
          suffixicon: Card(
            elevation: 2,
            color: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(h * 0.01)),
            child: CommonIconButton(
              onPressed: () async {},
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
          ).animate().fade(duration: 1000.ms).then(delay: 1000.ms).slideX(
              begin: 0, end: 0, curve: Curves.decelerate, duration: 800.ms)),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const MyBookingDelStatusShimmer();
            }
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.02),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: w * 0.016),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppImg.homelist,
                              height: h * 0.12,
                              width: w * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: "Xbox Series S",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.028,
                                  fontWeight: FontWeight.w700,
                                )),
                            Container(
                              width: w * 0.45,
                              child: CommonText(
                                  text:
                                      "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint.",
                                  style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
                                    fontSize: h * 0.017,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .then(delay: 600.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .then(delay: 600.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  CupertinoStepper(
                    contwidth: h * 0.03,
                    contheight: h * 0.03,
                    iconsize: h * 0.02,
                    iconcolor: AppColors.white,
                    gradientDec: true,
                    type: StepperType.vertical,
                    controlsBuilder:
                        (BuildContext context, ControlsDetails controls) {
                      return SizedBox();
                    },
                    physics: NeverScrollableScrollPhysics(),
                    onStepTapped: (step) => {},
                    currentStep: 1,
                    steps: [
                      Step(
                        title: CommonText(
                            text: "Requested, June 26 2023",
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.8),
                              overflow: TextOverflow.ellipsis,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w700,
                            )),
                        state: StepState.complete,
                        isActive: controller().getactiveList[0],
                        content: SizedBox(),
                      ),
                      Step(
                        title: CommonText(
                            text: "Order confirmed, June 26",
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.8),
                              overflow: TextOverflow.ellipsis,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w700,
                            )),
                        state: StepState.complete,
                        isActive: controller().getactiveList[1],
                        content: SizedBox(),
                      ),
                      Step(
                        title: CommonText(
                            text: "Shipped, June 27",
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.8),
                              overflow: TextOverflow.ellipsis,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w700,
                            )),
                        state: StepState.complete,
                        isActive: controller().getactiveList[2],
                        content: SizedBox(),
                      ),
                      Step(
                        title: CommonText(
                            text: "Delivered, June 28",
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.8),
                              overflow: TextOverflow.ellipsis,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w700,
                            )),
                        state: StepState.complete,
                        isActive: controller().getactiveList[3],
                        content: SizedBox(),
                      ),
                    ],
                  )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .then(delay: 700.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 900.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .then(delay: 700.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 900.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.01),
                    child: CommonOutlineButton(
                      containerwidth: w,
                      containerheight: h * 0.06,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.006),
                        side: const BorderSide(
                            color: AppColors.colorPrimary, width: 2),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ]),
                          width: 2.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      prefix: ShaderMask(
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
                        child: Icon(
                          Icons.close,
                          color: AppColors.white,
                        ),
                      ),
                      text: AppText.cancelorder,
                      textStyle: ptSansTextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ],
                            ).createShader(
                                const Rect.fromLTRB(100, 0, 250, 20)),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700),
                      onPressed: () {},
                      side: BorderSide.none,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .then(delay: 800.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1000.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .then(delay: 800.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1000.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                              style: ptSansTextStyle(
                                  fontSize: w * 0.045,
                                  color: AppColors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w700),
                              text: "Delivery Address",
                            ),
                            CommonOutlineButton(
                              containerwidth: w * 0.3,
                              containerheight: h * 0.045,
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(h * 0.006),
                                side: const BorderSide(
                                    color: AppColors.colorPrimary, width: 2),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ]),
                                  width: 2.5,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              text: "Change",
                              textStyle: ptSansTextStyle(
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        AppColors.colorPrimary,
                                        AppColors.colorSecondary
                                      ],
                                    ).createShader(
                                        Rect.fromLTRB(200, 0, 350, 20)),
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w700),
                              onPressed: () {
                                commonNavigator(
                                  context: context,
                                  child: MyAddressesScreen(),
                                  type: PageTransitionType.rightToLeftWithFade,
                                );
                              },
                              side: BorderSide.none,
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CommonText(
                              style: ptSansTextStyle(
                                  fontSize: w * 0.045,
                                  color: AppColors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w700),
                              text: AppText.hamzaali,
                            ),
                            Padding(
                              padding: EdgeInsets.all(w * 0.015),
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.02, vertical: h * 0.005),
                                decoration: BoxDecoration(
                                  color: AppColors.starcolor.withOpacity(0.6),
                                ),
                                child: CommonText(
                                  text: "Home".toUpperCase(),
                                  style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.4),
                                      fontSize: h * 0.014,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            ),
                          ],
                        ),
                        CommonText(
                          style: ptSansTextStyle(
                              fontSize: w * 0.033,
                              color: AppColors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600),
                          text:
                              "Street: C501, Vishal Apt, Behind Vishal Hall, Andheri Kurla Rd, Andheri (e)",
                        ),
                        CommonText(
                          style: ptSansTextStyle(
                              fontSize: w * 0.033,
                              color: AppColors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600),
                          text: "City: Mumbai",
                        ),
                        CommonText(
                          style: ptSansTextStyle(
                              fontSize: w * 0.033,
                              color: AppColors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600),
                          text: "State/province/area: Maharashtra",
                        ),
                        CommonText(
                          style: ptSansTextStyle(
                              fontSize: w * 0.033,
                              color: AppColors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600),
                          text: "Phone number 02226833712",
                        ),
                        CommonText(
                          style: ptSansTextStyle(
                              fontSize: w * 0.033,
                              color: AppColors.black.withOpacity(0.8),
                              fontWeight: FontWeight.w600),
                          text: "Zip code 400069",
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 900.ms)
                      .then(delay: 900.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1100.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 900.ms)
                      .then(delay: 900.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1100.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.012),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                              GestureDetector(
                                onTap: () {
                                  commonNavigator(
                                    context: context,
                                    child: ViewProfile(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
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
                                          decoration: TextDecoration.underline,
                                          decorationColor: AppColors.white,
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 1000.ms)
                      .then(delay: 1000.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1200.ms),
                  CommonButton(
                          containerwidth: w,
                          containerheight: h * 0.069,
                          prefixicon: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor:
                                    AppColors.white.withOpacity(0.4),
                                radius: h * 0.023,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      AppImg.chat,
                                      height: h * 0.023,
                                      width: h * 0.023,
                                      color: AppColors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ])),
                          backgroundColor: AppColors.transparent,
                          shape: LinearBorder.none,
                          text: AppText.chatnow,
                          textStyle: ptSansTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.022,
                              fontWeight: FontWeight.w700),
                          onPressed: () {
                            commonNavigator(
                              context: context,
                              child: ChatScreen(frombottom: false),
                              type: PageTransitionType.rightToLeftWithFade,
                            );
                          })
                      .animate()
                      .fadeIn(duration: 1000.ms)
                      .then(delay: 1000.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1200.ms)
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return const MyBookingDelStatusShimmer();
          }),
    );
  }
}
