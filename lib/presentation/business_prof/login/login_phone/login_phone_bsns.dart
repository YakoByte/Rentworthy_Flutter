import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../application/validate/validate.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_loader.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../../indi_prof/error/error_screen.dart';
import '../../../indi_prof/login/login_phone/login_phone_screen_controller.dart';
import '../../../shimmers/sign_in_shimmer.dart';
import 'login_phone_bsns_controller.dart';

class BusinessLoginPhone extends ConsumerStatefulWidget {
  BusinessLoginPhone({Key? key, required this.loginType}) : super(key: key);
  int loginType;

  @override
  ConsumerState createState() => _BusinessLoginPhoneState();
}

class _BusinessLoginPhoneState extends ConsumerState<BusinessLoginPhone> {
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
            return SingleChildScrollView(
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
                              height: h * 0.6,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                          color:
                                              AppColors.black.withOpacity(0.4)),
                                      borderRadius: BorderRadius.circular(4),
                                      prefix: Padding(
                                        padding:
                                            EdgeInsets.only(left: w * 0.02),
                                        child: IntrinsicHeight(
                                          child: Row(
                                            children: [
                                              CommonText(
                                                  text: controller()
                                                      .countryCodeController
                                                      .text,
                                                  style: ptSansTextStyle(
                                                      color: AppColors.black
                                                          .withOpacity(0.5),
                                                      fontSize: h * 0.018,
                                                      fontWeight:
                                                          FontWeight.w400)),
                                              VerticalDivider(
                                                color: AppColors.black
                                                    .withOpacity(0.4),
                                                thickness: 1.5,
                                                width: h * 0.02,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      hintText: AppText.phoneNo,
                                      hintStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.5),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w400),
                                      textstyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.5),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w500),
                                      lableStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.5),
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w400),
                                      errorText: controller().issubmit == true
                                          ? validatePhone(
                                              controller().phoneController.text)
                                          : null,
                                      onChanged: (value) {
                                        setState(() {
                                          controller().issubmit == true
                                              ? validatePhone(controller()
                                                  .phoneController
                                                  .text)
                                              : null;
                                        });
                                      },
                                      errorStyle: ptSansTextStyle(
                                          color: AppColors.red,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.w400),
                                      controller: controller().phoneController,
                                      keyboardType: TextInputType.phone,
                                      containerwidth: w,
                                      containerheight: h * 0.07,
                                      containercolor: AppColors.white,
                                      textCapitalization:
                                          TextCapitalization.none),
                                  SizedBox(
                                    height: h * 0.1,
                                  ),
                                  CommonButton(
                                      containerwidth: w,
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
                                        controller().onSendOtp(index: 0);
                                      }),
                                  CommonText(
                                      text:
                                          "Your contact number is never shared with external parties nor do we use it to spam you in any way.",
                                      textAlign: TextAlign.center,
                                      maxLines: 3,
                                      style: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.4),
                                        fontSize: w * 0.04,
                                        fontWeight: FontWeight.w600,
                                      )),
                                  // Row(
                                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //   crossAxisAlignment: CrossAxisAlignment.end,
                                  //   children: [
                                  //     // Column(
                                  //     //   mainAxisAlignment: MainAxisAlignment.end,
                                  //     //   children: [
                                  //     //     TextInputField(
                                  //     //         underline: false,
                                  //     //         hintText: AppText.countrycode,
                                  //     //         hintStyle: ptSansTextStyle(
                                  //     //             color: AppColors.textColor1,
                                  //     //             fontSize: h * 0.018,
                                  //     //             fontWeight: FontWeight.w400),
                                  //     //         textstyle: ptSansTextStyle(
                                  //     //             color: AppColors.textColor1,
                                  //     //             fontSize: h * 0.019,
                                  //     //             fontWeight: FontWeight.w500),
                                  //     //         lableStyle: ptSansTextStyle(
                                  //     //             color: AppColors.textColor1,
                                  //     //             fontSize: h * 0.021,
                                  //     //             fontWeight: FontWeight.w400),
                                  //     //         errorText: controller().issubmit == true
                                  //     //             ? validate(controller()
                                  //     //                 .countryCodeController
                                  //     //                 .text)
                                  //     //             : null,
                                  //     //         onChanged: (value) {
                                  //     //           setState(() {
                                  //     //             controller().issubmit == true
                                  //     //                 ? validate(controller()
                                  //     //                     .countryCodeController
                                  //     //                     .text)
                                  //     //                 : null;
                                  //     //           });
                                  //     //         },
                                  //     //         errorStyle: ptSansTextStyle(
                                  //     //             color: AppColors.red,
                                  //     //             fontSize: h * 0.019,
                                  //     //             fontWeight: FontWeight.w400),
                                  //     //         controller:
                                  //     //             controller().countryCodeController,
                                  //     //         keyboardType: TextInputType.phone,
                                  //     //         containerwidth: w * 0.15,
                                  //     //         containerheight: h * 0.06,
                                  //     //         containercolor: AppColors.white,
                                  //     //         textCapitalization:
                                  //     //             TextCapitalization.none),
                                  //     //     if (controller().issubmit == true &&
                                  //     //         validatephone(controller()
                                  //     //                 .phoneController
                                  //     //                 .text) !=
                                  //     //             null)
                                  //     //       SizedBox(
                                  //     //         height: h * 0.05,
                                  //     //       )
                                  //     //   ],
                                  //     // ),
                                  //
                                  //   ],
                                  // ),
                                ],
                              ),
                            ),
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
