import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../../application/validate/validate.dart';
import '../../../utils/common_components/common_loader.dart';
import '../../indi_prof/bottombar/bottom_bar.dart';
import '../../indi_prof/error/error_screen.dart';
import '../../indi_prof/login/login_phone/login_phone_screen_controller.dart';
import '../../shimmers/sign_in_shimmer.dart';
import '../admin_panel/admin_panel.dart';
import 'login_phone/login_phone_bsns_controller.dart';

class BusinessLoginFB extends ConsumerStatefulWidget {
  BusinessLoginFB({super.key, required this.loginType});

  int loginType;

  @override
  ConsumerState createState() => _BusinessLoginFBState();
}

class _BusinessLoginFBState extends ConsumerState<BusinessLoginFB> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(businessLoginPhoneControllerProvider);
    controller() => ref.read(businessLoginPhoneControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        backgroundColor: AppColors.white,
        centerTitle: false,
        leadingicon: true,
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return CommonLoader();
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                horizontal: w * 0.08,
              ),
              child: SizedBox(
                height: h * 0.58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      AppImg.appIcon,
                      height: h * 0.07,
                      width: w,
                      fit: BoxFit.contain,
                    ),
                    CommonText(
                        text: AppText.enterEmailToSignIn,
                        style: ptSansTextStyle(
                          color: AppColors.black,
                          fontSize: h * 0.023,
                          fontWeight: FontWeight.w500,
                        )),
                    TextInputField(
                        underline: false,
                        containerborder:
                            Border.all(color: AppColors.black.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(4),
                        hintText: AppText.emailOrUname,
                        hintStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: h * 0.021,
                            fontWeight: FontWeight.w400),
                        textstyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: h * 0.021,
                            fontWeight: FontWeight.w500),
                        lableStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: h * 0.021,
                            fontWeight: FontWeight.w400),
                        errorText: controller().issubmit == true
                            ? validateEmail(controller().emailController.text)
                            : null,
                        onChanged: (value) {
                          setState(() {
                            controller().issubmit == true
                                ? validateEmail(
                                    controller().emailController.text)
                                : null;
                          });
                        },
                        errorStyle: ptSansTextStyle(
                            color: AppColors.red,
                            fontSize: h * 0.017,
                            fontWeight: FontWeight.w400),
                        controller: controller().emailController,
                        keyboardType: TextInputType.emailAddress,
                        containerwidth: w,
                        containerheight: h * 0.07,
                        containercolor: AppColors.white,
                        textCapitalization: TextCapitalization.none),
                    TextInputField(
                        underline: false,
                        containerborder:
                            Border.all(color: AppColors.black.withOpacity(0.4)),
                        borderRadius: BorderRadius.circular(4),
                        hintText: AppText.password,
                        hintStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: h * 0.021,
                            fontWeight: FontWeight.w400),
                        textstyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: h * 0.021,
                            fontWeight: FontWeight.w500),
                        lableStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.5),
                            fontSize: h * 0.021,
                            fontWeight: FontWeight.w400),
                        errorText: "",
                        errorStyle: ptSansTextStyle(
                            color: AppColors.red,
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w400),
                        controller: controller().passwordController,
                        keyboardType: TextInputType.visiblePassword,
                        suffixicon: SizedBox(
                          width: h * 0.04,
                          height: h * 0.04,
                          child: Center(
                            child: Image.asset(
                              !controller().iseyehide
                                  ? AppImg.eyeHide
                                  : AppImg.eyeView,
                              fit: BoxFit.cover,
                              color: AppColors.black.withOpacity(0.6),
                              width: h * 0.032,
                              height: h * 0.032,
                            ),
                          ),
                        ),
                        suffixonTap: () {
                          controller().onEyeTap(
                              val: !controller().iseyehide ? true : false);
                        },
                        maxLines: 1,
                        obscureText: !controller().iseyehide,
                        containerwidth: w,
                        containerheight: h * 0.07,
                        isCounter: false,
                        containercolor: AppColors.white,
                        textCapitalization: TextCapitalization.none),
                    SizedBox(
                      height: h * 0.05,
                    ),
                    CommonButton(
                        containerwidth: w,
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
                        text: AppText.signIn,
                        textStyle: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w700),
                        onPressed: () {
                          controller().onSendOtp(index: 3);
                        }),
                    CommonText(
                        text:
                            "Your email is never shared with external parties nor do we use it to spam you in any way.",
                        textAlign: TextAlign.center,
                        maxLines: 3,
                        style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.4),
                          fontSize: w * 0.04,
                          fontWeight: FontWeight.w600,
                        )),
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
            return CommonLoader();
          }),
    );
  }
}
