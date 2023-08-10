import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/common_appbar.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import 'login_phone_screen_controller.dart';

class LoginPhoneScreen extends ConsumerStatefulWidget {
  const LoginPhoneScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginPhoneScreenState();
}

class _LoginPhoneScreenState extends ConsumerState<LoginPhoneScreen> {
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
        backgroundColor: AppColors.white,
        title: AppText.signin,
        leadingicon: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
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
                        height: h * 0.65,
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
                                text: AppText.enterphone,
                                style: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.03,
                                  fontWeight: FontWeight.w500,
                                )),
                            CommonText(
                                text: AppText.wesendotp,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.4),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                TextInputField(
                                    hintText: AppText.countrycode,
                                    titleText: AppText.country,
                                    titletextstyle: ptSansTextStyle(
                                        color: AppColors.textcolor1,
                                        fontSize: h * 0.018,
                                        fontWeight: FontWeight.w400),
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
                                    controller:
                                        controller().countryCodeController,
                                    keyboardType: TextInputType.phone,
                                    containerwidth: w * 0.15,
                                    containerheight: h * 0.06,
                                    containercolor: AppColors.white,
                                    textCapitalization:
                                        TextCapitalization.none),
                                TextInputField(
                                    hintText: AppText.enterphone,
                                    titleText: AppText.phoneno,
                                    titletextstyle: ptSansTextStyle(
                                        color: AppColors.textcolor1,
                                        fontSize: h * 0.018,
                                        fontWeight: FontWeight.w400),
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
                                    controller: controller().phoneController,
                                    keyboardType: TextInputType.phone,
                                    containerwidth: w * 0.65,
                                    containerheight: h * 0.06,
                                    containercolor: AppColors.white,
                                    textCapitalization:
                                        TextCapitalization.none),
                              ],
                            ),
                          ],
                        ),
                      ),
                      CommonButton(
                          containerwidth: w,
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
                          text: AppText.next,
                          textStyle: ptSansTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.025,
                              fontWeight: FontWeight.w700),
                          onPressed: () {
                            controller().onSendOtp();
                          })
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
