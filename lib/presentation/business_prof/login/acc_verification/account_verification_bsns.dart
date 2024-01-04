import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pinput/pinput.dart';
import 'package:rentworthy/presentation/business_prof/admin_panel/admin_panel.dart';

import '../../../../application/dialog/dialog_service.dart';
import '../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../../utils/import_utils.dart';
import '../../../indi_prof/error/error_screen.dart';
import 'account_verification_bsns_controller.dart';

class BusinessAccountVerification extends ConsumerStatefulWidget {
  String email;
  String verificationId;

  BusinessAccountVerification(
      {super.key, required this.email, required this.verificationId});

  @override
  ConsumerState createState() => _BusinessAccountVerificationState();
}

class _BusinessAccountVerificationState
    extends ConsumerState<BusinessAccountVerification> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(businessAccountVerificationControllerProvider);
    controller() =>
        ref.read(businessAccountVerificationControllerProvider.notifier);
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
      body: asyncState.when(data: (state) {
        return Container(
            width: w,
            height: controller().isVerify == false ? h * 0.45 : h * 0.85,
            color: AppColors.white,
            child: Column(
              mainAxisAlignment: controller().isVerify == false
                  ? MainAxisAlignment.spaceBetween
                  : MainAxisAlignment.start,
              children: [
                Image.asset(
                  AppImg.appIcon,
                  height: h * 0.07,
                  width: w,
                  fit: BoxFit.contain,
                ),
                controller().isVerify == false
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: h * 0.35,
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(horizontal: w * 0.05),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  CommonText(
                                      text: "Enter verification code",
                                      style: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.028,
                                        fontWeight: FontWeight.w500,
                                      )),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          text: AppText.sentOtp,
                                          style: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.4),
                                              fontSize: h * 0.018,
                                              fontWeight: FontWeight.w400),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: widget.email,
                                                style: ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.6),
                                                    fontSize: h * 0.018,
                                                    fontWeight:
                                                        FontWeight.w700)),
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
                                  // PinCodeTextField(
                                  //   length: 6,
                                  //   obscureText: false,
                                  //
                                  //   animationType: AnimationType.fade,
                                  //   pinTheme: controller().isPinTheme!,
                                  //   keyboardType: TextInputType.number,
                                  //   mainAxisAlignment:
                                  //       MainAxisAlignment.spaceBetween,
                                  //   showCursor: true,
                                  //   cursorColor: AppColors.black,
                                  //
                                  //   animationDuration:
                                  //       const Duration(milliseconds: 300),
                                  //   enablePinAutofill: true,
                                  //   backgroundColor: AppColors.white,
                                  //   enableActiveFill: false,
                                  //   controller: controller().otpController,
                                  //   // controller:
                                  //   //     controller().otpController,
                                  //   onCompleted: (v) {
                                  //     controller().onVerify();
                                  //   },
                                  //   onChanged: (value) {},
                                  //   beforeTextPaste: (text) {
                                  //     print("Allowing to paste $text");
                                  //     return true;
                                  //   },
                                  //
                                  //   appContext: context,
                                  // ),
                                  Pinput(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    showCursor: true,
                                    animationDuration:
                                        const Duration(milliseconds: 300),
                                    isCursorAnimationEnabled: true,
                                    onChanged: (value) {
                                      // print(value);
                                    },
                                    onCompleted: (value) {
                                      controller().onVerify(
                                          verificationId:
                                              widget.verificationId!);
                                      // print(value);
                                    },
                                    closeKeyboardWhenCompleted: true,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          text: "Resend code by sms",
                                          style: ptSansTextStyle(
                                              foreground: Paint()
                                                ..shader = const LinearGradient(
                                                  colors: <Color>[
                                                    AppColors.colorPrimary,
                                                    AppColors.colorSecondary
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTRB(
                                                        30, 0, 130, 20)),
                                              fontSize: h * 0.018,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          text: "Resend code by call",
                                          style: ptSansTextStyle(
                                              foreground: Paint()
                                                ..shader = const LinearGradient(
                                                  colors: <Color>[
                                                    AppColors.colorPrimary,
                                                    AppColors.colorSecondary
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTRB(
                                                        30, 0, 130, 20)),
                                              fontSize: h * 0.018,
                                              fontWeight: FontWeight.w700)),
                                    ],
                                  ),

                                  /// verify button
                                  CommonButton(
                                      containerwidth: w,
                                      containerheight: h * 0.06,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(h * 0.005),
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
                                            BorderRadius.circular(h * 0.005),
                                      ),
                                      text: AppText.verify,
                                      textStyle: ptSansTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w600),
                                      onPressed: () {
                                        controller().onVerify(
                                            verificationId:
                                                widget.verificationId!);
                                      }),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.04, vertical: h * 0.06),
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
                                      height: h * 0.3,
                                      width: w * 0.4,
                                      fit: BoxFit.contain),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
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
                                              ((controller().timer!.tick * 1) /
                                                      60)
                                                  .toStringAsFixed(1))
                                          : 1.0,
                                      backgroundColor: AppColors.blueIndicator
                                          .withOpacity(0.2),
                                      linearStrokeCap: LinearStrokeCap.roundAll,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.01),
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
                                FocusScope.of(context)
                                    .requestFocus(FocusNode());
                                DialogServiceV1().showSnackBar(
                                    content: "User Logged-in Successfully!!",
                                    color:
                                        AppColors.colorPrimary.withOpacity(0.7),
                                    textclr: AppColors.white);
                                PreferenceManagerUtils.setIsLogin(true);
                                PreferenceManagerUtils.setIsIndividual(2);
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    PageTransition(
                                        child: const AdminPanel(),
                                        type: PageTransitionType
                                            .rightToLeftWithFade,
                                        duration:
                                            const Duration(milliseconds: 400)),
                                    (Route<dynamic> route) => false);
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
              ],
            ));
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
