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
import '../../indi_prof/error/error_screen.dart';
import '../../indi_prof/login/login_phone/login_phone_screen_controller.dart';
import '../../shimmers/sign_in_shimmer.dart';
import 'acc_verification/account_verification_bsns.dart';
import 'login_phone/login_phone_bsns_controller.dart';

class BusinessAddAnotherAcc extends ConsumerStatefulWidget {
  int loginType;

  BusinessAddAnotherAcc({super.key, required this.loginType});

  @override
  ConsumerState createState() => _BusinessAddAnotherAccState();
}

class _BusinessAddAnotherAccState extends ConsumerState<BusinessAddAnotherAcc> {
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
            return Container(
                width: w,
                height: h * 0.55,
                color: AppColors.white,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: w * 0.08,
                  ),
                  child: SizedBox(
                    height: h * 0.55,
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
                            text: AppText.enterPhone,
                            style: ptSansTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.028,
                              fontWeight: FontWeight.w500,
                            )),
                        CommonText(
                            text: AppText.weSendOtp,
                            textAlign: TextAlign.center,
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.4),
                              fontSize: h * 0.018,
                              fontWeight: FontWeight.w400,
                            )),
                        TextInputField(
                            underline: false,
                            containerborder: Border.all(
                                color: AppColors.black.withOpacity(0.4)),
                            borderRadius: BorderRadius.circular(4),
                            hintText: AppText.email,
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
                            keyboardType: TextInputType.emailAddress,
                            containerwidth: w,
                            containerheight: h * 0.07,
                            containercolor: AppColors.white,
                            textCapitalization: TextCapitalization.none),
                        SizedBox(
                          height: h * 0.1,
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
                            text: AppText.next,
                            textStyle: ptSansTextStyle(
                                color: AppColors.white,
                                fontSize: h * 0.019,
                                fontWeight: FontWeight.w700),
                            onPressed: () {
                              controller().onSendOtp(index: 1);
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
                ));
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
