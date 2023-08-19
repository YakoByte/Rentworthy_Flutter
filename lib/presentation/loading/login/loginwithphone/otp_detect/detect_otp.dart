import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_loader.dart';
import '../../../../../utils/common_components/common_navigator.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';
import '../../../error/error_screen.dart';
import '../findlocation/find_location.dart';
import 'detect_otp_controller.dart';

class DetectOtp extends ConsumerWidget {
  String phoneNo;

  DetectOtp({super.key, required this.phoneNo});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(detectOtpControllerProvider);
    controller() => ref.read(detectOtpControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        backgroundColor: AppColors.white,
        title: AppText.signin,
        leadingicon: true,
        textstyle: ptSansTextStyle(
            color: AppColors.black,
            fontSize: h * 0.025,
            fontWeight: FontWeight.w600),
      ),
      body: asyncState.when(data: (state) {
        return Container(
          width: w,
          height: h,
          color: AppColors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: Column(
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
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: AppText.sentotp,
                        style: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.4),
                            fontSize: h * 0.016,
                            fontWeight: FontWeight.w400),
                        children: <TextSpan>[
                          TextSpan(
                              text: phoneNo,
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  fontSize: h * 0.018,
                                  fontWeight: FontWeight.w700)),
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
                            AppImg.editoutline,
                            height: h * 0.025,
                            width: w * 0.045,
                          )),
                    )
                  ],
                ),
                Center(
                  child: Image.asset(AppImg.detectotpimg,
                      height: h * 0.35, width: w * 0.5, fit: BoxFit.contain),
                ),
                LinearPercentIndicator(
                  width: w * 0.9,
                  animation: true,
                  barRadius: Radius.circular(4),
                  lineHeight: h * 0.045,
                  animateFromLastPercent: true,
                  animationDuration: 2000,
                  addAutomaticKeepAlive: true,
                  linearGradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.colorPrimary,
                        AppColors.colorSecondary
                      ]),
                  // percent: 0.9,
                  percent: controller().timer!.isActive
                      ? double.parse(((controller().timer!.tick * 1) / 60)
                          .toStringAsFixed(1))
                      : 1.0,
                  backgroundColor: AppColors.blueindicator.withOpacity(0.2),
                  linearStrokeCap: LinearStrokeCap.roundAll,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (state.start != 0)
                        Padding(
                          padding: EdgeInsets.all(w * 0.01),
                          child: Icon(
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
                InkWell(
                  onTap: () {
                    FocusScope.of(context).requestFocus(FocusNode());
                    commonNavigator(
                        type: PageTransitionType.rightToLeftWithFade,
                        context: context,
                        child: FindLocation());
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                          text: AppText.wearetrying,
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
