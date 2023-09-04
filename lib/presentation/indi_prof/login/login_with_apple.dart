import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_navigator.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/common_components/text_input_field.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import '../../../../application/validate/validate.dart';
import '../bottombar/bottom_bar.dart';
import 'login_phone/login_phone_screen_controller.dart';

class LoginApple extends ConsumerStatefulWidget {
  int loginType;

  LoginApple({super.key, required this.loginType});

  @override
  ConsumerState createState() => _LoginAppleState();
}

class _LoginAppleState extends ConsumerState<LoginApple> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(loginPhoneScreenControllerProvider);
    controller() => ref.read(loginPhoneScreenControllerProvider.notifier);
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
        centerwidget: CommonText(
            text: AppText.signin,
            style: ptSansTextStyle(
                color: AppColors.black,
                fontSize: h * 0.025,
                fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.01,
              thickness: 1,
            ),
            Container(
                width: w,
                height: h * 0.85,
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.08,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: h * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              AppImg.loginimg,
                              height: h * 0.4,
                              width: w,
                              fit: BoxFit.cover,
                            ),
                            CommonText(
                                text: AppText.enterappidtosignin,
                                style: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w500,
                                )),
                            TextInputField(
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                hintText: AppText.enterappid,
                                titleText: AppText.appid,
                                titletextstyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.8),
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.w600),
                                hintStyle: ptSansTextStyle(
                                    color: AppColors.textcolor1,
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.w400),
                                textstyle: ptSansTextStyle(
                                    color: AppColors.colorSecondary,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w500),
                                lableStyle: ptSansTextStyle(
                                    color: AppColors.colorPrimary,
                                    fontSize: h * 0.021,
                                    fontWeight: FontWeight.w400),
                                errorText: controller().issubmit == true
                                    ? validateEmail(
                                        controller().emailController.text)
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
                                keyboardType: TextInputType.phone,
                                containerwidth: w,
                                containerheight: h * 0.06,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                            TextInputField(
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                titleText: AppText.password,
                                hintText: AppText.password,
                                titletextstyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.8),
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.w600),
                                hintStyle: ptSansTextStyle(
                                    color: AppColors.textcolor1,
                                    fontSize: h * 0.018,
                                    fontWeight: FontWeight.w400),
                                textstyle: ptSansTextStyle(
                                    color: AppColors.colorSecondary,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w500),
                                lableStyle: ptSansTextStyle(
                                    color: AppColors.colorPrimary,
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
                                          ? AppImg.eye_hide
                                          : AppImg.eye_view,
                                      fit: BoxFit.cover,
                                      color: AppColors.black.withOpacity(0.6),
                                      width: h * 0.032,
                                      height: h * 0.032,
                                    ),
                                  ),
                                ),
                                suffixonTap: () {
                                  controller().onEyeTap(
                                      val: !controller().iseyehide
                                          ? true
                                          : false);
                                },
                                maxLines: 1,
                                obscureText: !controller().iseyehide,
                                containerwidth: w,
                                containerheight: h * 0.06,
                                isCounter: false,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: h * 0.03),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
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
                                text: AppText.signin,
                                textStyle: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w700),
                                onPressed: () {
                                  commonNavigator(
                                    context: context,
                                    child: BottomBar(index: 0),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
