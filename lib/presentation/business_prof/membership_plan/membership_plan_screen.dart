import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:rentworthy/utils/common_components/common_appbar.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_carouselslider.dart';
import '../../../utils/common_components/common_searchbar.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/gradient_track_shape.dart';
import '../../../utils/common_components/stepper/src/stepper.dart';
import '../../../utils/globals.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import 'membership_plan_screen_controller.dart';

class MemberShipPlan extends ConsumerWidget {
  const MemberShipPlan({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(memberShipPlanControllerProvider);
    controller() => ref.read(memberShipPlanControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.memberkey,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 3,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.035),
          child: SingleChildScrollView(
            physics: NeverScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                BusinessSearch(adminscaffoldKey: Globals.memberkey)
                    .animate()
                    .fadeIn(duration: 400.ms)
                    .then(delay: 400.ms)
                    .slideX(
                      begin: 2,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),
                Container(
                  height: h * 0.89,
                  width: w,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                                text: "You’re on level 2!",
                                style: ptSansTextStyle(
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ],
                                      ).createShader(
                                          const Rect.fromLTRB(60, 0, 350, 10)),
                                    fontSize: w * 0.063,
                                    fontWeight: FontWeight.w800))
                          ],
                        )
                            .animate()
                            .fadeIn(duration: 500.ms)
                            .then(delay: 500.ms)
                            .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 700.ms,
                            ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.015),
                          child: Card(
                            color: AppColors.white,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            child: Container(
                              height: h * 0.15,
                              width: w,
                              decoration: BoxDecoration(
                                color: AppColors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding:
                                    EdgeInsets.symmetric(horizontal: w * 0.06),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin:
                                              EdgeInsets.only(right: w * 0.03),
                                          height: h * 0.038,
                                          width: h * 0.038,
                                          decoration: BoxDecoration(
                                              color: const Color(0xFFE3C3FF),
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                  color: AppColors.colorPrimary,
                                                  width: 3)),
                                          child: Center(
                                            child: CommonText(
                                                text: "2",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            CommonText(
                                                text: "Level 2",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.024,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                            CommonText(
                                                text:
                                                    "800 Points to next level",
                                                style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.6),
                                                  fontSize: h * 0.02,
                                                  fontWeight: FontWeight.w400,
                                                )),
                                          ],
                                        )
                                      ],
                                    ),
                                    Container(
                                      height: h * 0.045,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: w * 0.01),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(96),
                                        gradient: LinearGradient(
                                          colors: [
                                            AppColors.colorPrimary
                                                .withOpacity(0.4),
                                            AppColors.colorSecondary
                                                .withOpacity(0.4),
                                          ],
                                        ),
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          LinearPercentIndicator(
                                            width: w * 0.6,
                                            lineHeight: h * 0.035,
                                            percent: (80) / 100,
                                            animation: true,
                                            linearGradient:
                                                const LinearGradient(
                                              colors: [
                                                AppColors.colorPrimary,
                                                AppColors.colorSecondary,
                                              ],
                                            ),
                                            leading: Container(
                                                height: h * 0.035,
                                                width: h * 0.035,
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      AppColors.colorPrimary,
                                                      AppColors.colorSecondary,
                                                    ],
                                                  ),
                                                ),
                                                child: Center(
                                                  child: CommonText(
                                                      text: "2",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.white,
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                )),
                                            trailing: Container(
                                                height: h * 0.035,
                                                width: h * 0.035,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      AppColors.colorPrimary
                                                          .withOpacity(0.5),
                                                      AppColors.colorSecondary
                                                          .withOpacity(0.5),
                                                    ],
                                                  ),
                                                ),
                                                child: Center(
                                                  child: CommonText(
                                                      text: "3",
                                                      style: ptSansTextStyle(
                                                        color: AppColors.white,
                                                        fontSize: h * 0.02,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                      )),
                                                )),
                                            center: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.star,
                                                    color: AppColors.white
                                                        .withOpacity(0.6),
                                                    size: h * 0.02),
                                                RichText(
                                                  textAlign: TextAlign.start,
                                                  text: TextSpan(
                                                    text: "5200 ",
                                                    style: ptSansTextStyle(
                                                      color: AppColors.white
                                                          .withOpacity(0.7),
                                                      fontSize: h * 0.018,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: "/ 6000",
                                                        style: ptSansTextStyle(
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.8),
                                                            fontSize: h * 0.017,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w600),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            animateFromLastPercent: true,
                                            clipLinearGradient: false,
                                            barRadius:
                                                const Radius.circular(96),
                                            alignment: MainAxisAlignment.center,
                                            backgroundColor:
                                                AppColors.transparent,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 600.ms)
                            .then(delay: 600.ms)
                            .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 800.ms,
                            ),
                        Container(
                          constraints: BoxConstraints(
                            maxHeight: h * 0.13,
                          ),
                          width: w,
                          child: CupertinoStepper(
                            contwidth: h * 0.03,
                            contheight: h * 0.03,
                            iconsize: h * 0.02,
                            iconcolor: AppColors.white,
                            gradientDec: true,
                            type: StepperType.horizontal,
                            controlsBuilder: (BuildContext context,
                                ControlsDetails controls) {
                              return const SizedBox();
                            },
                            physics: const NeverScrollableScrollPhysics(),
                            onStepTapped: (step) => {},
                            currentStep: 1,
                            steps: [
                              Step(
                                title: CommonText(
                                    text: "",
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.8),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: h * 0.02,
                                      fontWeight: FontWeight.w700,
                                    )),
                                state: StepState.indexed,
                                isActive: controller().getactiveList[0],
                                content: const SizedBox(),
                              ),
                              Step(
                                title: CommonText(
                                    text: "",
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.8),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: h * 0.02,
                                      fontWeight: FontWeight.w700,
                                    )),
                                state: StepState.indexed,
                                isActive: controller().getactiveList[1],
                                content: const SizedBox(),
                              ),
                              Step(
                                title: CommonText(
                                    text: "",
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.8),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: h * 0.02,
                                      fontWeight: FontWeight.w700,
                                    )),
                                state: StepState.indexed,
                                isActive: controller().getactiveList[2],
                                content: const SizedBox(),
                              ),
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 700.ms)
                            .then(delay: 700.ms)
                            .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 900.ms,
                            ),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: w * 0.4,
                                  height: h * 0.18,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: h * 0.08,
                                        width: h * 0.08,
                                        margin:
                                            EdgeInsets.only(bottom: h * 0.01),
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            gradient: const LinearGradient(
                                              colors: <Color>[
                                                AppColors.colorPrimary,
                                                AppColors.colorSecondary
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Icon(Icons.leaderboard_outlined,
                                            color: AppColors.white,
                                            size: h * 0.05),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: CommonText(
                                                text:
                                                    "More Views = Higher Levels",
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.02,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: w * 0.4,
                                  height: h * 0.18,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: h * 0.08,
                                        width: h * 0.08,
                                        margin:
                                            EdgeInsets.only(bottom: h * 0.01),
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            gradient: const LinearGradient(
                                              colors: <Color>[
                                                AppColors.colorPrimary,
                                                AppColors.colorSecondary
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Icon(Icons.leaderboard_outlined,
                                            color: AppColors.white,
                                            size: h * 0.05),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: CommonText(
                                                text:
                                                    "Service Charge decrease as you level up!",
                                                maxLines: 3,
                                                textAlign: TextAlign.center,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.02,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: h * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: w * 0.4,
                                  height: h * 0.17,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Container(
                                        height: h * 0.08,
                                        width: h * 0.08,
                                        margin:
                                            EdgeInsets.only(bottom: h * 0.01),
                                        decoration: BoxDecoration(
                                            color: AppColors.white,
                                            gradient: const LinearGradient(
                                              colors: <Color>[
                                                AppColors.colorPrimary,
                                                AppColors.colorSecondary
                                              ],
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12)),
                                        child: Icon(Icons.leaderboard_outlined,
                                            color: AppColors.white,
                                            size: h * 0.05),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            child: CommonText(
                                                text:
                                                    "More Views = Higher Levels",
                                                maxLines: 2,
                                                textAlign: TextAlign.center,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black,
                                                  fontSize: h * 0.02,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: w * 0.4,
                                ),
                              ],
                            ),
                          ],
                        )
                            .animate()
                            .fadeIn(duration: 800.ms)
                            .then(delay: 800.ms)
                            .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1000.ms,
                            ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.015),
                          child: Row(
                            children: [
                              CommonText(
                                  text: "How membership work",
                                  style: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.028,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 900.ms)
                            .then(delay: 900.ms)
                            .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1100.ms,
                            ),
                        Padding(
                          padding: EdgeInsets.symmetric(vertical: h * 0.015),
                          child: CommonText(
                            text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna lpa qui officia deserunt mollit anim id est laborum.",
                            style: ptSansTextStyle(
                                color: AppColors.black,
                                fontSize: h * 0.018,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 1000.ms)
                            .then(delay: 1000.ms)
                            .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 1200.ms,
                            ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
