import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/common_outline_button.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_navigator.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/globals.dart';
import '../../../../application/both_prof/login/login_service.dart';
import '../../../../application/dialog/dialog_service.dart';
import '../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../business_prof/admin_panel/admin_panel.dart';
import '../../../business_prof/login/add_another_acc_bsns.dart';
import '../../../business_prof/login/login_phone/login_phone_bsns.dart';
import '../../../business_prof/login/login_with_apple_bsns.dart';
import '../../../business_prof/login/login_with_fb_bsns.dart';
import '../../../indi_prof/bottombar/bottom_bar.dart';
import '../../../indi_prof/login/login_phone/login_phone_screen.dart';
import '../../../indi_prof/login/login_with_apple.dart';

import '../../../indi_prof/login/add_another_acc.dart';
import '../../../indi_prof/login/login_with_fb.dart';
import '../register_screen_controller.dart';

class LoginMethodScreen extends ConsumerWidget {
  const LoginMethodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(registerScreenControllerProvider);
    controller() => ref.read(registerScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: Platform.isIOS ? h * 0.5 : h * 0.44,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: Platform.isIOS ? h * 0.28 : h * 0.21,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CommonButton(
                    containerwidth: w * 0.8,
                    containerheight: h * 0.06,
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
                    prefixicon: Image.asset(
                      AppImg.mobile,
                      color: AppColors.white,
                      height: h * 0.03,
                    ),
                    text: AppText.continuewith + AppText.phone,
                    textStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.019,
                        fontWeight: FontWeight.w700),
                    onPressed: () {
                      FocusScope.of(Globals.navigatorKey.currentContext!)
                          .requestFocus(FocusNode());
                      commonNavigator(
                          type: PageTransitionType.rightToLeftWithFade,
                          context: context,
                          child: controller().tabController.index == 0
                              ? LoginPhoneScreen(
                                  loginType: controller().tabController.index,
                                )
                              : BusinessLoginPhone(
                                  loginType: controller().tabController.index,
                                ));
                    }),
                CommonOutlineButton(
                  containerwidth: w * 0.8,
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
                  prefix: Center(
                    child: Image.asset(
                      AppImg.google,
                      height: h * 0.03,
                    ),
                  ),
                  text: AppText.continuewith + AppText.google,
                  textStyle: ptSansTextStyle(
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ],
                        ).createShader(const Rect.fromLTRB(100, 0, 250, 20)),
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w700),
                  onPressed: () async {
                    FocusScope.of(Globals.navigatorKey.currentContext!)
                        .requestFocus(FocusNode());
                    User? userCreds = await ref
                        .read(loginServiceProvider)
                        .loginWithGoogle(
                            index: controller().tabController.index);
                    // commonNavigator(
                    //     type: PageTransitionType.rightToLeftWithFade,
                    //     context: context,
                    //     child: controller().tabController.index == 0
                    //         ? AddAnotherAcc(
                    //             loginType: controller().tabController.index)
                    //         : BusinessAddAnotherAcc(
                    //             loginType: controller().tabController.index,
                    //           ));
                  },
                  side: BorderSide.none,
                ),
                if (Platform.isIOS)
                  CommonOutlineButton(
                      containerwidth: w * 0.8,
                      containerheight: h * 0.06,
                      side: const BorderSide(color: AppColors.black, width: 2),
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.006),
                        side:
                            const BorderSide(color: AppColors.black, width: 2),
                      ),
                      prefix: Center(
                        child: Image.asset(
                          AppImg.apple,
                          color: AppColors.black,
                          height: h * 0.03,
                        ),
                      ),
                      text: AppText.continuewith + AppText.apple,
                      textStyle: ptSansTextStyle(
                          color: AppColors.black,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w700),
                      onPressed: () {
                        FocusScope.of(Globals.navigatorKey.currentContext!)
                            .requestFocus(FocusNode());
                        commonNavigator(
                            type: PageTransitionType.rightToLeftWithFade,
                            context: context,
                            child: controller().tabController.index == 0
                                ? LoginApple(
                                    loginType: controller().tabController.index,
                                  )
                                : BusinessLoginApple(
                                    loginType: controller().tabController.index,
                                  ));
                      }),
                CommonOutlineButton(
                    containerwidth: w * 0.8,
                    containerheight: h * 0.06,
                    side: const BorderSide(color: AppColors.fbblue, width: 2),
                    backgroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(h * 0.006),
                      side: const BorderSide(color: AppColors.fbblue, width: 2),
                    ),
                    prefix: Center(
                      child: Image.asset(
                        AppImg.fb,
                        height: h * 0.03,
                      ),
                    ),
                    text: AppText.continuewith + AppText.facebook,
                    textStyle: ptSansTextStyle(
                        color: AppColors.fbblue,
                        fontSize: h * 0.019,
                        fontWeight: FontWeight.w700),
                    onPressed: () async {
                      FocusScope.of(Globals.navigatorKey.currentContext!)
                          .requestFocus(FocusNode());
                      UserCredential? userCreds = await ref
                          .read(loginServiceProvider)
                          .signInWithFacebook();
                      if (userCreds != null && userCreds!.user!.email != null) {
                        DialogServiceV1().showSnackBar(
                            content: "User Logged-in Successfully!!",
                            color: AppColors.colorPrimary.withOpacity(0.7),
                            textclr: AppColors.white);
                        PreferenceManagerUtils.setIsLogin(true);
                        PreferenceManagerUtils.setIsIndividual(
                            controller().tabController.index == 0 ? 1 : 2);
                        Navigator.pushAndRemoveUntil(
                            Globals.navigatorKey.currentContext!,
                            PageTransition(
                                child: controller().tabController.index == 0
                                    ? BottomBar(index: 0)
                                    : AdminPanel(),
                                type: PageTransitionType.rightToLeftWithFade,
                                duration: const Duration(milliseconds: 400)),
                            (Route<dynamic> route) => false);
                      }

                      // commonNavigator(
                      //     type: PageTransitionType.rightToLeftWithFade,
                      //     context: context,
                      //     child: controller().tabController.index == 0
                      //         ? LoginFB(
                      //             loginType: controller().tabController.index,
                      //           )
                      //         : BusinessLoginFB(
                      //             loginType: controller().tabController.index,
                      //           ));
                    }),
              ],
            ),
          ),
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.01),
                child: CommonText(
                    style: ptSansTextStyle(
                        color: AppColors.black.withOpacity(0.4),
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w400),
                    text: AppText.or),
              ),
              InkWell(
                onTap: () {
                  controller().onisSignin(val: false);
                  // CommonNavigatior(
                  //     context: context,
                  //     child: const RegisterScreen());
                },
                child: SizedBox(
                  width: w * 0.8,
                  height: h * 0.03,
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      text: AppText.donthaveacc,
                      style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.4),
                          fontSize: h * 0.018,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.textcolor1,
                          decorationThickness: 1,
                          decorationStyle: TextDecorationStyle.solid,
                          fontWeight: FontWeight.w400),
                      children: <TextSpan>[
                        TextSpan(
                            text: AppText.regnow,
                            style: ptSansTextStyle(
                                foreground: Paint()
                                  ..shader = const LinearGradient(
                                    colors: <Color>[
                                      AppColors.colorPrimary,
                                      AppColors.colorSecondary
                                    ],
                                  ).createShader(
                                      const Rect.fromLTRB(100, 0, 300, 20)),
                                fontSize: h * 0.018,
                                decorationColor: AppColors.colorSecondary,
                                decorationThickness: 1,
                                decorationStyle: TextDecorationStyle.solid,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400)),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ).animate().fadeIn(duration: 400.ms),
    );
  }
}
