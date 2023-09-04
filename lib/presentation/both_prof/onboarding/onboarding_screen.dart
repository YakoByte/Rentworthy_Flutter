import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';
import 'package:rentworthy/utils/common_components/common_loader.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../indi_prof/error/error_screen.dart';
import 'onboarding_screen_controller.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(onBoardingScreenControllerProvider);
    controller() => ref.read(onBoardingScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColors.white,
        body: asyncState.when(data: (state) {
          return Padding(
            padding: EdgeInsets.only(
              top: h * 0.03,
            ),
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: SafeArea(
                child: Container(
                  height: h * 0.9,
                  color: AppColors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: h * 0.8,
                        color: AppColors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                      3,
                                      (index) => Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.02),
                                            child: Container(
                                              height: h * 0.01,
                                              width: w * 0.22,
                                              decoration: BoxDecoration(
                                                  color: controller()
                                                              .getcurrentPageIndex ==
                                                          index
                                                      ? AppColors.white
                                                      : AppColors.grey,
                                                  gradient: controller()
                                                              .getcurrentPageIndex ==
                                                          index
                                                      ? const LinearGradient(
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end: Alignment
                                                              .centerRight,
                                                          colors: <Color>[
                                                            AppColors
                                                                .colorPrimary,
                                                            AppColors
                                                                .colorSecondary
                                                          ],
                                                        )
                                                      : null,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                            ),
                                          )),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h * 0.01),
                                  child: Image.asset(
                                    AppImg.applogo,
                                    height: h * 0.07,
                                    width: w * 0.5,
                                  ),
                                ),
                              ],
                            ),
                            Container(
                                height: h * 0.7,
                                width: w,
                                color: Colors.white,
                                child: PageView.builder(
                                    controller: controller().pageController,
                                    scrollDirection: Axis.horizontal,
                                    pageSnapping: true,
                                    onPageChanged: (index) {
                                      controller().onPageChanged(index);
                                    },
                                    itemCount: 3,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.05),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              state.onBoardinglist![index].img,
                                              height: h * 0.37,
                                              width: w * 0.8,
                                              fit: BoxFit.cover,
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.05),
                                              child: CommonText(
                                                  text: state
                                                      .onBoardinglist![index]
                                                      .titletext,
                                                  textAlign: TextAlign.center,
                                                  style: ptSansTextStyle(
                                                    color: AppColors.black,
                                                    fontSize: h * 0.035,
                                                    fontWeight: FontWeight.w700,
                                                  )),
                                            ),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: w * 0.025),
                                              child: CommonText(
                                                  text: state
                                                      .onBoardinglist![index]
                                                      .subtitletext,
                                                  textAlign: TextAlign.center,
                                                  style: ptSansTextStyle(
                                                    color: AppColors.textcolor,
                                                    fontSize: h * 0.022,
                                                    fontWeight: FontWeight.w400,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      );
                                    })),
                          ],
                        ),
                      ),
                      CommonButton(
                          containerwidth: w * 0.8,
                          containerheight: h * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ])),
                          backgroundColor: AppColors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          text: state.currentpageIndex == 2
                              ? AppText.getstarted
                              : AppText.next,
                          textStyle: ptSansTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.025,
                              fontWeight: FontWeight.w700),
                          onPressed: () {
                            controller().onBtnTap();
                          })
                    ],
                  ),
                ),
              ),
            ),
          );
        }, loading: () {
          return CommonLoader();
        }, error: (e, s) {
          return ErrorScreen(
              text: e.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red);
        }));
  }
}
