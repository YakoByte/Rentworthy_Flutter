import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pinput/pinput.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_loader.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import '../../../indi_prof/error/error_screen.dart';
import 'account_verification_controller.dart';

class AccountVerification extends ConsumerStatefulWidget {
  String email;

  // String? verificationId;
  AccountVerification({
    super.key,
    required this.email,
    // required this.verificationId
  });

  @override
  ConsumerState createState() => _AccountVerificationState();
}

class _AccountVerificationState extends ConsumerState<AccountVerification> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(accountVerificationControllerProvider);
    controller() => ref.read(accountVerificationControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: controller().isVerify == true
          ? null
          : CommonAppBar(
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
      body: asyncState.when(data: (state) {
        if (controller().isLoading == true) {
          return CommonLoader();
        }
        return Container(
          width: w,
          height: h * 0.85,
          color: AppColors.white,
          child: controller().isVerify == false
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Divider(
                          color: AppColors.black.withOpacity(0.1),
                          height: h * 0.01,
                          thickness: 1,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                  text: AppText.welcomeRent,
                                  style: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.03,
                                    fontWeight: FontWeight.w500,
                                  )),
                              Row(
                                children: [
                                  Container(
                                    width: w * 0.85,
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: RichText(
                                            textAlign: TextAlign.start,
                                            text: TextSpan(
                                              text: AppText.sentOtp,
                                              style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.4),
                                                  fontSize: w * 0.035,
                                                  fontWeight: FontWeight.w400),
                                              children: <TextSpan>[
                                                TextSpan(
                                                    text: widget.email,
                                                    style: ptSansTextStyle(
                                                        color: AppColors.black
                                                            .withOpacity(0.6),
                                                        fontSize: w * 0.037,
                                                        fontWeight:
                                                            FontWeight.w700)),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                        height: h * 0.03,
                                        width: w * 0.05,
                                        child: Image.asset(
                                          AppImg.editOutline,
                                          height: h * 0.025,
                                          width: w * 0.045,
                                        )),
                                  )
                                ],
                              ),

                              /// otp detect
                              Padding(
                                padding: EdgeInsets.only(
                                    top: h * 0.05, bottom: h * 0.03),
                                child: Pinput(
                                  length: 6,
                                  obscureText: false,
                                  androidSmsAutofillMethod:
                                      AndroidSmsAutofillMethod.none,
                                  controller: controller().otpController,
                                  pinAnimationType: PinAnimationType.slide,
                                  animationCurve: Curves.easeInOut,
                                  defaultPinTheme: controller().isPinTheme!,
                                  disabledPinTheme: controller().isPinTheme!,
                                  errorPinTheme: controller().isPinTheme!,
                                  focusedPinTheme: controller().isPinTheme!,
                                  followingPinTheme: controller().isPinTheme!,
                                  submittedPinTheme: controller().isPinTheme!,
                                  keyboardType: TextInputType.number,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  showCursor: true,
                                  animationDuration:
                                      const Duration(milliseconds: 300),
                                  isCursorAnimationEnabled: true,
                                  onChanged: (value) {
                                    // print(value);
                                  },
                                  onCompleted: (value) {
                                    //    print(value);

                                    controller().onVerify(email: widget.email);
                                  },
                                  closeKeyboardWhenCompleted: true,
                                ),
                              ),

                              CommonText(
                                  text: AppText.reqNewCode,
                                  style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.8),
                                      fontSize: h * 0.017,
                                      decorationColor:
                                          AppColors.black.withOpacity(0.8),
                                      decorationThickness: 1.5,
                                      decorationStyle:
                                          TextDecorationStyle.solid,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.w700)),
                            ],
                          ),
                        ),
                      ],
                    ),

                    /// verify button
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                      child: CommonButton(
                          containerwidth: w,
                          containerheight: h * 0.06,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(h * 0.005),
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ])),
                          backgroundColor: AppColors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(h * 0.005),
                          ),
                          text: AppText.verify,
                          textStyle: ptSansTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w600),
                          onPressed: () {
                            controller().onVerify(email: widget.email);
                          }),
                    ),
                  ],
                )
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Center(
                            child: Image.asset(AppImg.detectOtpImg,
                                height: h * 0.35,
                                width: w * 0.5,
                                fit: BoxFit.contain),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ///LinearPercentIndicator
                              LinearPercentIndicator(
                                width: w * 0.9,
                                animation: true,
                                barRadius: const Radius.circular(4),
                                lineHeight: h * 0.045,
                                animateFromLastPercent: true,
                                animationDuration: 2000,
                                addAutomaticKeepAlive: true,
                                linearGradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      AppColors.colorPrimary,
                                      AppColors.colorSecondary
                                    ]),
                                // percent: 0.9,
                                percent: controller().timer!.isActive
                                    ? double.parse(
                                        ((controller().timer!.tick * 1) / 60)
                                            .toStringAsFixed(1))
                                    : 1.0,
                                backgroundColor:
                                    AppColors.blueIndicator.withOpacity(0.2),
                                linearStrokeCap: LinearStrokeCap.roundAll,
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: h * 0.01),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (state.start != 0)
                                  Padding(
                                    padding: EdgeInsets.all(w * 0.01),
                                    child: const Icon(
                                      Icons.watch_later,
                                      color: AppColors.yellow,
                                    ),
                                  ),
                                CommonText(
                                    text: state.start == 0
                                        ? AppText.resend
                                        : "${state.start}S",
                                    style: ptSansTextStyle(
                                      color: AppColors.black,
                                      fontSize: h * 0.025,
                                      fontWeight: FontWeight.w500,
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                      InkWell(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          // commonNavigator(
                          //     type: PageTransitionType.rightToLeftWithFade,
                          //     context: context,
                          //     child: FindLocation());
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonText(
                                text: AppText.weAreTrying,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.024,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
        );
      }, loading: () {
        return CommonLoader();
      }, error: (e, s) {
        return ErrorScreen(
            text: e.toString(),
            backgroundColor: AppColors.white,
            color: AppColors.red);
      }),
    );
  }
}
