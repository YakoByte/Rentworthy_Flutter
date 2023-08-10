import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/register/register_screen.dart';
import 'package:rentworthy/utils/common_components/common_outline_button.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/back_gradient.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/rent_lend_enjoy_icon.dart';
import '../login/loginwithphone/login_phone_screen.dart';
import 'login_method_screen_controller.dart';

class LoginMethodScreen extends ConsumerWidget {
  const LoginMethodScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(loginMethodScreenControllerProvider);
    controller() => ref.read(loginMethodScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
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
                child: const RentLendEnjoyIcon()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: h * 0.25,
              child: Container(
                height: h * 0.7,
                width: w,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(h * 0.025)),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.03, vertical: h * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.3,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonButton(
                                containerwidth: w * 0.8,
                                containerheight: h * 0.06,
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
                                  borderRadius:
                                      BorderRadius.circular(h * 0.006),
                                ),
                                prefixicon: Image.asset(AppImg.mobile),
                                text: AppText.continuewith + AppText.phone,
                                textStyle: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w700),
                                onPressed: () {
                                  CommonNavigatior(child: LoginPhoneScreen());
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
                                    ).createShader(
                                        const Rect.fromLTRB(100, 0, 250, 20)),
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w700),
                              onPressed: () {},
                              side: const BorderSide(
                                  color: AppColors.colorPrimary, width: 2),
                            ),
                            CommonOutlineButton(
                                containerwidth: w * 0.8,
                                containerheight: h * 0.06,
                                side: const BorderSide(
                                    color: AppColors.black, width: 2),
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.006),
                                  side: const BorderSide(
                                      color: AppColors.black, width: 2),
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
                                onPressed: () {}),
                            CommonOutlineButton(
                                containerwidth: w * 0.8,
                                containerheight: h * 0.06,
                                side: const BorderSide(
                                    color: AppColors.fbblue, width: 2),
                                backgroundColor: AppColors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.circular(h * 0.006),
                                  side: const BorderSide(
                                      color: AppColors.fbblue, width: 2),
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
                                onPressed: () {}),
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
                              CommonNavigatior(child: const RegisterScreen());
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
                                      decorationStyle:
                                          TextDecorationStyle.solid,
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
                                                  const Rect.fromLTRB(
                                                      100, 0, 300, 20)),
                                            fontSize: h * 0.018,
                                            decorationColor:
                                                AppColors.colorSecondary,
                                            decorationThickness: 1,
                                            decorationStyle:
                                                TextDecorationStyle.solid,
                                            decoration:
                                                TextDecoration.underline,
                                            fontWeight: FontWeight.w400)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.1),
                      Column(
                        children: [
                          CommonText(
                            text: "${AppText.accepting}",
                            style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.4),
                                fontSize: h * 0.018,
                                fontWeight: FontWeight.w500),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.1),
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
                                  textAlign: TextAlign.center,
                                  style: ptSansTextStyle(
                                      color: AppColors.white,
                                      fontSize: h * 0.018,
                                      decorationColor: AppColors.white,
                                      decorationThickness: 1,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
