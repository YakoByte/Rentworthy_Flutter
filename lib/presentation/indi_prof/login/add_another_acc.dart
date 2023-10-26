import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../../application/validate/validate.dart';
import '../../../utils/common_components/common_loader.dart';
import '../../shimmers/sign_in_shimmer.dart';
import '../error/error_screen.dart';
import 'acc_verification/account_verification.dart';
import 'login_phone/login_phone_screen_controller.dart';

class AddAnotherAcc extends ConsumerStatefulWidget {
  int loginType;

  AddAnotherAcc({super.key, required this.loginType});

  @override
  ConsumerState createState() => _AddAnotherAccState();
}

class _AddAnotherAccState extends ConsumerState<AddAnotherAcc> {
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
            text: AppText.signIn,
            style: ptSansTextStyle(
                color: AppColors.black,
                fontSize: h * 0.025,
                fontWeight: FontWeight.w600)),
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return CommonLoader();
            }
            return SingleChildScrollView(
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
                              height: h * 0.55,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    AppImg.loginImg,
                                    height: h * 0.4,
                                    width: w,
                                    fit: BoxFit.cover,
                                  ),
                                  CommonText(
                                      text: AppText.enterEmailToSignIn,
                                      style: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.025,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  TextInputField(
                                      hintText: AppText.enterEmail,
                                      titleText: AppText.email,
                                      titletextstyle: ptSansTextStyle(
                                          color: AppColors.textColor1,
                                          fontSize: h * 0.018,
                                          fontWeight: FontWeight.w400),
                                      hintStyle: ptSansTextStyle(
                                          color: AppColors.textColor1,
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
                                      errorText: controller().isSubmit == true
                                          ? validateEmail(
                                              controller().emailController.text)
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          controller().isSubmit == true
                                              ? validateEmail(controller()
                                                  .emailController
                                                  .text)
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
                                      containerheight: h * 0.06,
                                      containercolor: AppColors.white,
                                      textCapitalization:
                                          TextCapitalization.none),
                                ],
                              ),
                            ),
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
                                text: AppText.next,
                                textStyle: ptSansTextStyle(
                                    color: AppColors.white,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w700),
                                onPressed: () {
                                  controller().onSendOtp(index: 1);
                                }),
                          ],
                        ),
                      )),
                ],
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
