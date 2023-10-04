import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/business_prof/subscription/subscription_screen_controller.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';

class SubscriptionScreen extends ConsumerWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(subscriptionControllerProvider);
    controller() => ref.read(subscriptionControllerProvider.notifier);

    return Scaffold(
      key: Globals.subscriptionkey,
      drawer: AdminNavDrawer(
        selectedindex: 10,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.035,
              ),
              child: BusinessSearch(adminscaffoldKey: Globals.subscriptionkey)
                  .animate()
                  .fadeIn(duration: 300.ms)
                  .then(delay: 300.ms)
                  .slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms),
            ),
            Container(
              width: w,
              height: h * 0.8,
              child: Stack(
                children: [
                  Positioned(
                    left: -w * 0.36,
                    top: h * 0.094,
                    child: Column(
                      children: [
                        RotationTransition(
                          turns: new AlwaysStoppedAnimation(-30 / 360),
                          child: Container(
                            width: w * 0.5,
                            height: h * 0.23,
                            decoration: BoxDecoration(
                              color: AppColors.colorSecondary.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: -w * 0.51,
                    top: h * 0.28,
                    child: Column(
                      children: [
                        RotationTransition(
                          turns: new AlwaysStoppedAnimation(-30 / 360),
                          child: Container(
                            width: w * 0.6,
                            height: h * 0.3,
                            decoration: BoxDecoration(
                              color: AppColors.colorSecondary.withOpacity(0.4),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 0,
                    bottom: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CommonText(
                          text: "Subscribe\nRentworthy!!",
                          textAlign: TextAlign.center,
                          style: ptSansTextStyle(
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: <Color>[
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ],
                                ).createShader(
                                    const Rect.fromLTRB(105, 0, 280, 10)),
                              fontSize: w * 0.08,
                              fontWeight: FontWeight.w700),
                        )
                            .animate()
                            .fadeIn(duration: 350.ms)
                            .then(delay: 350.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 650.ms),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.13),
                          child: CommonText(
                            text: "By subscribing us you get various benefits.",
                            textAlign: TextAlign.center,
                            style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.7),
                                fontSize: w * 0.05,
                                fontWeight: FontWeight.w600),
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .then(delay: 400.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 700.ms),
                        CommonText(
                          text: "Benefits of Subscription",
                          textAlign: TextAlign.center,
                          style: ptSansTextStyle(
                              foreground: Paint()
                                ..shader = const LinearGradient(
                                  colors: <Color>[
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ],
                                ).createShader(
                                    const Rect.fromLTRB(105, 0, 280, 10)),
                              fontSize: w * 0.055,
                              fontWeight: FontWeight.w700),
                        )
                            .animate()
                            .fadeIn(duration: 450.ms)
                            .then(delay: 450.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 750.ms),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.13),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: h * 0.01,
                                ),
                                child: Icon(
                                  Icons.circle_sharp,
                                  size: w * 0.02,
                                  color: AppColors.black,
                                ),
                              ),
                              Expanded(
                                  child: CommonText(
                                      textAlign: TextAlign.center,
                                      text:
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                      style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.7),
                                          fontSize: w * 0.034,
                                          fontWeight: FontWeight.w600)))
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 500.ms)
                            .then(delay: 500.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 800.ms),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.13),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: h * 0.01,
                                ),
                                child: Icon(
                                  Icons.circle_sharp,
                                  size: w * 0.02,
                                  color: AppColors.black,
                                ),
                              ),
                              Expanded(
                                  child: CommonText(
                                      textAlign: TextAlign.center,
                                      text:
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                      style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.7),
                                          fontSize: w * 0.034,
                                          fontWeight: FontWeight.w600)))
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 550.ms)
                            .then(delay: 550.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 850.ms),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.13),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: h * 0.01,
                                ),
                                child: Icon(
                                  Icons.circle_sharp,
                                  size: w * 0.02,
                                  color: AppColors.black,
                                ),
                              ),
                              Expanded(
                                  child: CommonText(
                                      textAlign: TextAlign.center,
                                      text:
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                      style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.7),
                                          fontSize: w * 0.034,
                                          fontWeight: FontWeight.w600)))
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 600.ms)
                            .then(delay: 600.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 900.ms),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.13),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: h * 0.01,
                                ),
                                child: Icon(
                                  Icons.circle_sharp,
                                  size: w * 0.02,
                                  color: AppColors.black,
                                ),
                              ),
                              Expanded(
                                  child: CommonText(
                                      textAlign: TextAlign.center,
                                      text:
                                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                                      style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.7),
                                          fontSize: w * 0.034,
                                          fontWeight: FontWeight.w600)))
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 650.ms)
                            .then(delay: 650.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 950.ms),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text: "at just ",
                            style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.8),
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w600),
                            children: <TextSpan>[
                              TextSpan(
                                text: "\$12 only",
                                style: ptSansTextStyle(
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ],
                                      ).createShader(
                                          const Rect.fromLTRB(105, 0, 280, 10)),
                                    fontSize: h * 0.035,
                                    fontWeight: FontWeight.w800),
                              ),
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 700.ms)
                            .then(delay: 700.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 1000.ms),
                        CommonButton(
                                containerwidth: w * 0.7,
                                containerheight: h * 0.07,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(98),
                                    gradient: const LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ])),
                                backgroundColor: AppColors.transparent,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(98),
                                ),
                                text: "Subscribe Now!!!",
                                textStyle: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: h * 0.035,
                                    fontWeight: FontWeight.w700),
                                onPressed: () async {})
                            .animate()
                            .fadeIn(duration: 750.ms)
                            .then(delay: 750.ms)
                            .slideX(
                                begin: 5,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 1500.ms),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
