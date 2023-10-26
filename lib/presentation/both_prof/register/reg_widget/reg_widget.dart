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
import '../../../../application/validate/validate.dart';
import '../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../../utils/import_utils.dart';
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

class RegWidget extends ConsumerStatefulWidget {
  const RegWidget({super.key});

  @override
  ConsumerState createState() => _RegWidgetState();
}

class _RegWidgetState extends ConsumerState<RegWidget> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(registerScreenControllerProvider);
    controller() => ref.read(registerScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      height: Platform.isIOS ? h * 0.56 : h * 0.5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// select register method
          Container(
            width: w * 0.9,
            height: h * 0.06,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(h * 0.05),
              border: Border.all(
                color: AppColors.borderColor,
                width: 1,
              ),
            ),
            child: TabBar(
                controller: controller().tabController,
                onTap: (val) {
                  controller().onTabTap(val: val);
                },
                unselectedLabelStyle: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.4),
                    overflow: TextOverflow.visible,
                    fontSize: w * 0.035,
                    fontWeight: FontWeight.w500),
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: ptSansTextStyle(
                    color: AppColors.white,
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.w700),
                indicator: BoxDecoration(
                    gradient: const LinearGradient(colors: [
                      AppColors.colorPrimary,
                      AppColors.colorSecondary,
                    ]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  ///Tabs for individual and business
                  Tab(
                    height: h * 0.06,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppText.regIndividual,
                        style: ptSansTextStyle(
                            color: controller().selectedTab == 0
                                ? AppColors.white
                                : AppColors.black.withOpacity(0.4),
                            overflow: TextOverflow.visible,
                            fontSize: w * 0.035,
                            fontWeight: controller().selectedTab == 0
                                ? FontWeight.w700
                                : FontWeight.w400),
                      ),
                    ),
                  ),
                  Tab(
                    height: h * 0.06,
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppText.regBusiness,
                        style: ptSansTextStyle(
                            color: controller().selectedTab == 1
                                ? AppColors.white
                                : AppColors.black.withOpacity(0.4),
                            overflow: TextOverflow.visible,
                            fontSize: w * 0.035,
                            fontWeight: controller().selectedTab == 1
                                ? FontWeight.w700
                                : FontWeight.w400),
                      ),
                    ),
                  ),
                ]),
          ),

          ///input fields
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.012),
            child: SizedBox(
              height: h * 0.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextInputField(
                      enableunderlinecolor: AppColors.borderColor,
                      disableunderlinecolor: AppColors.borderColor,
                      focusunderlinecolor: AppColors.borderColor,
                      underlinecolor: AppColors.borderColor,
                      hintText: AppText.emailOrUname,
                      lableText: AppText.enterEmailOrUname,
                      hintStyle: ptSansTextStyle(
                          color: AppColors.textColor1,
                          fontSize: h * 0.018,
                          fontWeight: FontWeight.w400),
                      textstyle: ptSansTextStyle(
                          color: AppColors.textColor1,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      lableStyle: ptSansTextStyle(
                          color: AppColors.textColor1,
                          fontSize: h * 0.021,
                          fontWeight: FontWeight.w400),
                      errorText: controller().isSubmit
                          ? validateEmail(controller().emailController.text)
                          : null,
                      onChanged: (val) {
                        setState(() {
                          validateEmail(controller().emailController.text);
                        });
                      },
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().emailController,
                      keyboardType: TextInputType.emailAddress,
                      containerwidth: w,
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                  TextInputField(
                      enableunderlinecolor: AppColors.borderColor,
                      disableunderlinecolor: AppColors.borderColor,
                      focusunderlinecolor: AppColors.borderColor,
                      underlinecolor: AppColors.borderColor,
                      hintText: AppText.password,
                      lableText: AppText.enterPassword,
                      hintStyle: ptSansTextStyle(
                          color: AppColors.textColor1,
                          fontSize: h * 0.018,
                          fontWeight: FontWeight.w400),
                      textstyle: ptSansTextStyle(
                          color: AppColors.textColor1,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      lableStyle: ptSansTextStyle(
                          color: AppColors.textColor1,
                          fontSize: h * 0.021,
                          fontWeight: FontWeight.w400),
                      errorText: controller().isSubmit
                          ? validatePassword(controller().passController.text)
                          : null,
                      onChanged: (val) {
                        setState(() {
                          validatePassword(controller().passController.text);
                        });
                      },
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().passController,
                      keyboardType: TextInputType.visiblePassword,
                      suffixicon: SizedBox(
                        width: h * 0.04,
                        height: h * 0.04,
                        child: Center(
                          child: Image.asset(
                            !controller().isEyeHide
                                ? AppImg.eyeHide
                                : AppImg.eyeView,
                            fit: BoxFit.cover,
                            color: AppColors.textColor1,
                            width: h * 0.032,
                            height: h * 0.032,
                          ),
                        ),
                      ),
                      suffixonTap: () {
                        controller().onEyeTap(
                            val: !controller().isEyeHide ? true : false);
                      },
                      maxLines: 1,
                      obscureText: !controller().isEyeHide,
                      containerwidth: w,
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                ],
              ),
            ),
          ),

          ///forgot password and reg button
          SizedBox(
            height: h * 0.2,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.03),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CommonText(
                          style: ptSansTextStyle(
                              color: AppColors.textColor1,
                              fontSize: h * 0.018,
                              fontWeight: FontWeight.w400),
                          text: AppText.forgotPassword),
                    ],
                  ),
                ),
                CommonButton(
                    containerwidth: w * 0.8,
                    containerheight: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(h * 0.05),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ])),
                    backgroundColor: AppColors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(h * 0.05),
                    ),
                    text: AppText.register,
                    textStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.019,
                        fontWeight: FontWeight.w700),
                    onPressed: () {
                      controller().onRegister();
                    }),
                Column(
                  children: [
                    CommonText(
                        style: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.4),
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w400),
                        text: AppText.or),
                    InkWell(
                      onTap: () {
                        controller().onisSignin(val: true);
                        // CommonNavigator(
                        //     context: context,
                        //     child: const LoginMethodScreen());
                      },
                      child: SizedBox(
                        width: w * 0.8,
                        height: h * 0.03,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text: AppText.alreadyHaveAcc,
                            style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.4),
                                fontSize: h * 0.018,
                                decoration: TextDecoration.underline,
                                decorationColor: AppColors.textColor1,
                                decorationThickness: 1,
                                decorationStyle: TextDecorationStyle.solid,
                                fontWeight: FontWeight.w400),
                            children: <TextSpan>[
                              TextSpan(
                                  text: AppText.signIn,
                                  style: ptSansTextStyle(
                                      foreground: Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            AppColors.colorPrimary,
                                            AppColors.colorSecondary
                                          ],
                                        ).createShader(const Rect.fromLTRB(
                                            100, 0, 300, 20)),
                                      fontSize: h * 0.018,
                                      decorationColor: AppColors.colorSecondary,
                                      decorationThickness: 1,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
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
            ),
          ),
        ],
      ).animate().fadeIn(duration: 400.ms),
    );
  }
}
