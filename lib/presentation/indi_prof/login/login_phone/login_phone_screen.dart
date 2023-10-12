import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/shimmers/sign_in_shimmer.dart';

import '../../../../application/validate/validate.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_loader.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../error/error_screen.dart';
import 'login_phone_screen_controller.dart';

class LoginPhoneScreen extends ConsumerStatefulWidget {
  LoginPhoneScreen({Key? key, required this.loginType}) : super(key: key);
  int loginType;

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
        body: asyncState.when(
            data: (data) {
              if (controller().isLoading) {
                return const SignInShimmer();
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
                                height: h * 0.65,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400,
                                        )),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
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
                                                hintText: AppText.countrycode,
                                                titleText: AppText.country,
                                                titletextstyle: ptSansTextStyle(
                                                    color: AppColors.textcolor1,
                                                    fontSize: h * 0.018,
                                                    fontWeight:
                                                        FontWeight.w400),
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
                                                errorText: controller()
                                                            .issubmit ==
                                                        true
                                                    ? validate(controller()
                                                        .countryCodeController
                                                        .text)
                                                    : null,
                                                onChanged: (value) {
                                                  setState(() {
                                                    controller().issubmit ==
                                                            true
                                                        ? validate(controller()
                                                            .countryCodeController
                                                            .text)
                                                        : null;
                                                  });
                                                },
                                                errorStyle: ptSansTextStyle(
                                                    color: AppColors.red,
                                                    fontSize: h * 0.019,
                                                    fontWeight:
                                                        FontWeight.w400),
                                                controller: controller()
                                                    .countryCodeController,
                                                keyboardType:
                                                    TextInputType.phone,
                                                containerwidth: w * 0.15,
                                                containerheight: h * 0.06,
                                                containercolor: AppColors.white,
                                                textCapitalization:
                                                    TextCapitalization.none),
                                            if (controller().issubmit == true &&
                                                validatephone(controller()
                                                        .phoneController
                                                        .text) !=
                                                    null)
                                              SizedBox(
                                                height: h * 0.05,
                                              )
                                          ],
                                        ),
                                        TextInputField(
                                            enableunderlinecolor:
                                                AppColors.bordercolor,
                                            disableunderlinecolor:
                                                AppColors.bordercolor,
                                            focusunderlinecolor:
                                                AppColors.bordercolor,
                                            underlinecolor:
                                                AppColors.bordercolor,
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
                                                color: AppColors.textcolor1,
                                                fontSize: h * 0.019,
                                                fontWeight: FontWeight.w500),
                                            lableStyle: ptSansTextStyle(
                                                color: AppColors.textcolor1,
                                                fontSize: h * 0.021,
                                                fontWeight: FontWeight.w400),
                                            errorText: controller().issubmit ==
                                                    true
                                                ? validatephone(controller()
                                                    .phoneController
                                                    .text)
                                                : null,
                                            onChanged: (value) {
                                              setState(() {
                                                controller().issubmit == true
                                                    ? validatephone(controller()
                                                        .phoneController
                                                        .text)
                                                    : null;
                                              });
                                            },
                                            errorStyle: ptSansTextStyle(
                                                color: AppColors.red,
                                                fontSize: h * 0.017,
                                                fontWeight: FontWeight.w400),
                                            controller:
                                                controller().phoneController,
                                            keyboardType: TextInputType.phone,
                                            containerwidth: w * 0.6,
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
                                    controller().onSendOtp(index: 0);
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
            }));
  }
}
