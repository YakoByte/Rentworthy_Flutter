import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/back_gradient.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/text_input_field.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/rent_lend_enjoy_icon.dart';
import '../../../utils/images.dart';
import '../../indi_prof/account/setting/privacy_policy/privacy_policy.dart';
import 'login_method/login_method_screen.dart';
import 'register_screen_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(registerScreenControllerProvider);
    controller() => ref.read(registerScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    print("tab is ${controller().tabController.index}");

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: Container(
        width: w,
        height: h,
        color: AppColors.white,
        child: Stack(
          children: [
            const Positioned(
                left: 0, right: 0, top: 0, bottom: 0, child: BackGradient()),
            Positioned(
              top: h * 0.1,
              bottom: h * 0.1,
              left: w * 0.1,
              right: w * 0.1,
              child: const RentLendEnjoyIcon()
                  .animate()
                  .then(delay: 1.seconds)
                  .slideY(
                    begin: 0.4355,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 800.ms,
                  ),
            ),
            Positioned(
              bottom: -h * 0.01,
              left: 0,
              right: 0,
              top: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: h * 0.75,
                    width: w,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(h * 0.025)),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05, vertical: h * 0.025),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          controller().issignin
                              ? const LoginMethodScreen()
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    /// select register method
                                    Container(
                                      width: w * 0.9,
                                      height: h * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(h * 0.05),
                                        border: Border.all(
                                          color: AppColors.bordercolor,
                                          width: 1,
                                        ),
                                      ),
                                      child: Container(
                                        child: TabBar(
                                            controller:
                                                controller().tabController,
                                            onTap: (val) {
                                              controller().onTabTap(val: val);
                                            },
                                            unselectedLabelStyle:
                                                ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    overflow:
                                                        TextOverflow.visible,
                                                    fontSize: w * 0.035,
                                                    fontWeight:
                                                        FontWeight.w500),
                                            dividerColor: Colors.transparent,
                                            unselectedLabelColor:
                                                AppColors.transparent,
                                            indicatorSize:
                                                TabBarIndicatorSize.tab,
                                            labelStyle: ptSansTextStyle(
                                                color: AppColors.white,
                                                fontSize: h * 0.025,
                                                fontWeight: FontWeight.w700),
                                            indicator: BoxDecoration(
                                                gradient:
                                                    LinearGradient(colors: [
                                                  AppColors.colorPrimary,
                                                  AppColors.colorSecondary,
                                                ]),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                color: Colors.redAccent),
                                            tabs: [
                                              Tab(
                                                height: h * 0.06,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    AppText.reg_individual,
                                                    style: ptSansTextStyle(
                                                        color: controller()
                                                                    .selectedtab ==
                                                                0
                                                            ? AppColors.white
                                                            : AppColors.black
                                                                .withOpacity(
                                                                    0.4),
                                                        overflow: TextOverflow
                                                            .visible,
                                                        fontSize: w * 0.035,
                                                        fontWeight: controller()
                                                                    .selectedtab ==
                                                                0
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
                                                    AppText.reg_business,
                                                    style: ptSansTextStyle(
                                                        color: controller()
                                                                    .selectedtab ==
                                                                1
                                                            ? AppColors.white
                                                            : AppColors.black
                                                                .withOpacity(
                                                                    0.4),
                                                        overflow: TextOverflow
                                                            .visible,
                                                        fontSize: w * 0.035,
                                                        fontWeight: controller()
                                                                    .selectedtab ==
                                                                1
                                                            ? FontWeight.w700
                                                            : FontWeight.w400),
                                                  ),
                                                ),
                                              ),
                                            ]),
                                      ),
                                    ),

                                    ///input fields
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: h * 0.012),
                                      child: SizedBox(
                                        height: h * 0.2,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            TextInputField(
                                                enableunderlinecolor:
                                                    AppColors.bordercolor,
                                                disableunderlinecolor:
                                                    AppColors.bordercolor,
                                                focusunderlinecolor:
                                                    AppColors.bordercolor,
                                                underlinecolor:
                                                    AppColors.bordercolor,
                                                hintText:
                                                    AppText.email_or_uname,
                                                lableText:
                                                    AppText.enteremail_or_uname,
                                                hintStyle: ptSansTextStyle(
                                                    color: AppColors.textcolor1,
                                                    fontSize: h * 0.018,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textstyle: ptSansTextStyle(
                                                    color: AppColors.textcolor1,
                                                    fontSize: h * 0.019,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                lableStyle: ptSansTextStyle(
                                                    color: AppColors.textcolor1,
                                                    fontSize: h * 0.021,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                errorText: "",
                                                errorStyle: ptSansTextStyle(
                                                    color: AppColors.red,
                                                    fontSize: h * 0.019,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                controller: controller()
                                                    .emailController,
                                                keyboardType:
                                                    TextInputType.emailAddress,
                                                containerwidth: w,
                                                containerheight: h * 0.06,
                                                containercolor: AppColors.white,
                                                textCapitalization:
                                                    TextCapitalization.none),
                                            TextInputField(
                                                enableunderlinecolor:
                                                    AppColors.bordercolor,
                                                disableunderlinecolor:
                                                    AppColors.bordercolor,
                                                focusunderlinecolor:
                                                    AppColors.bordercolor,
                                                underlinecolor:
                                                    AppColors.bordercolor,
                                                hintText: AppText.password,
                                                lableText:
                                                    AppText.enterPassword,
                                                hintStyle: ptSansTextStyle(
                                                    color: AppColors.textcolor1,
                                                    fontSize: h * 0.018,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                textstyle: ptSansTextStyle(
                                                    color: AppColors.textcolor1,
                                                    fontSize: h * 0.019,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                lableStyle: ptSansTextStyle(
                                                    color: AppColors.textcolor1,
                                                    fontSize: h * 0.021,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                errorText: "",
                                                errorStyle: ptSansTextStyle(
                                                    color: AppColors.red,
                                                    fontSize: h * 0.019,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                controller:
                                                    controller().passController,
                                                keyboardType: TextInputType
                                                    .visiblePassword,
                                                suffixicon: SizedBox(
                                                  width: h * 0.04,
                                                  height: h * 0.04,
                                                  child: Center(
                                                    child: Image.asset(
                                                      !controller().iseyehide
                                                          ? AppImg.eye_hide
                                                          : AppImg.eye_view,
                                                      fit: BoxFit.cover,
                                                      color:
                                                          AppColors.textcolor1,
                                                      width: h * 0.032,
                                                      height: h * 0.032,
                                                    ),
                                                  ),
                                                ),
                                                suffixonTap: () {
                                                  controller().onEyeTap(
                                                      val: !controller()
                                                              .iseyehide
                                                          ? true
                                                          : false);
                                                },
                                                maxLines: 1,
                                                obscureText:
                                                    !controller().iseyehide,
                                                containerwidth: w,
                                                containerheight: h * 0.06,
                                                containercolor: AppColors.white,
                                                textCapitalization:
                                                    TextCapitalization.none),
                                          ],
                                        ),
                                      ),
                                    ),

                                    ///forgot password and login button
                                    SizedBox(
                                      height: h * 0.2,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.03),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                CommonText(
                                                    style: ptSansTextStyle(
                                                        color: AppColors
                                                            .textcolor1,
                                                        fontSize: h * 0.018,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                    text:
                                                        AppText.forgotpassword),
                                              ],
                                            ),
                                          ),
                                          CommonButton(
                                              containerwidth: w * 0.8,
                                              containerheight: h * 0.06,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius
                                                      .circular(h * 0.05),
                                                  gradient:
                                                      const LinearGradient(
                                                          begin: Alignment
                                                              .centerLeft,
                                                          end:
                                                              Alignment
                                                                  .centerRight,
                                                          colors: [
                                                        AppColors.colorPrimary,
                                                        AppColors.colorSecondary
                                                      ])),
                                              backgroundColor:
                                                  AppColors.transparent,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        h * 0.05),
                                              ),
                                              text: AppText.register,
                                              textStyle: ptSansTextStyle(
                                                  color: AppColors.white,
                                                  fontSize: h * 0.019,
                                                  fontWeight: FontWeight.w700),
                                              onPressed: () {
                                                controller()
                                                    .onisSignin(val: true);
                                              }),
                                          Column(
                                            children: [
                                              CommonText(
                                                  style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.4),
                                                      fontSize: h * 0.02,
                                                      fontWeight:
                                                          FontWeight.w400),
                                                  text: AppText.or),
                                              InkWell(
                                                onTap: () {
                                                  controller()
                                                      .onisSignin(val: true);
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
                                                      text: AppText
                                                          .alreadyhaveacc,
                                                      style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          fontSize: h * 0.018,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                          decorationColor:
                                                              AppColors
                                                                  .textcolor1,
                                                          decorationThickness:
                                                              1,
                                                          decorationStyle:
                                                              TextDecorationStyle
                                                                  .solid,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                      children: <TextSpan>[
                                                        TextSpan(
                                                            text:
                                                                AppText.signin,
                                                            style:
                                                                ptSansTextStyle(
                                                                    foreground:
                                                                        Paint()
                                                                          ..shader =
                                                                              const LinearGradient(
                                                                            colors: <Color>[
                                                                              AppColors.colorPrimary,
                                                                              AppColors.colorSecondary
                                                                            ],
                                                                          ).createShader(const Rect.fromLTRB(
                                                                                  100, 0, 300, 20)),
                                                                    fontSize: h *
                                                                        0.018,
                                                                    decorationColor:
                                                                        AppColors
                                                                            .colorSecondary,
                                                                    decorationThickness:
                                                                        1,
                                                                    decorationStyle:
                                                                        TextDecorationStyle
                                                                            .solid,
                                                                    decoration:
                                                                        TextDecoration
                                                                            .underline,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400)),
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
                                    SizedBox(height: h * 0.1),
                                  ],
                                ).animate().fadeIn(duration: 400.ms),
                          Column(
                            children: [
                              CommonText(
                                text: AppText.accepting,
                                style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.w500),
                              ),
                              GestureDetector(
                                onTap: () {
                                  commonNavigator(
                                    context: context,
                                    child: PrivacyPolicy(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                  );
                                },
                                child: SizedBox(
                                  height: h * 0.025,
                                  child: ShaderMask(
                                    shaderCallback: (Rect bounds) {
                                      return const LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            AppColors.colorPrimary,
                                            AppColors.colorSecondary
                                          ]).createShader(bounds);
                                    },
                                    child: CommonText(
                                        text: AppText.privacypolicy,
                                        style: ptSansTextStyle(
                                            color: AppColors.white,
                                            fontSize: h * 0.017,
                                            decorationColor: AppColors.white,
                                            decorationThickness: 1,
                                            decorationStyle:
                                                TextDecorationStyle.solid,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w500)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .then(delay: 1.seconds)
                      .slideY(
                          begin: 3,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
