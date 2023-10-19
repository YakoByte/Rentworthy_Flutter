import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../../application/dialog/dialog_service.dart';
import '../../../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_navigator.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';
import '../../../../indi_prof/bottombar/bottom_bar.dart';
import 'find_location_controller.dart';

class FindLocation extends ConsumerWidget {
  const FindLocation({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(findLocationControllerProvider);
    controller() => ref.read(findLocationControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: h * 0.22),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                            AppColors.colorPrimary.withOpacity(0.2),
                            AppColors.colorSecondary.withOpacity(0.2)
                          ]),
                          width: 15,
                        ),
                        borderRadius: BorderRadius.circular(200),
                      ),
                      height: h * 0.2,
                      width: h * 0.2,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ]).createShader(bounds);
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.location_on,
                                color: AppColors.white, size: h * 0.1),
                          ],
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        CommonText(
                            text: AppText.wheresurloc,
                            textAlign: TextAlign.center,
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.8),
                              fontSize: h * 0.028,
                              fontWeight: FontWeight.w700,
                            )),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: w * 0.1, vertical: h * 0.01),
                          child: CommonText(
                              text: AppText.shareloc,
                              textAlign: TextAlign.center,
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: h * 0.016,
                                fontWeight: FontWeight.w400,
                              )),
                        ),
                      ],
                    ),
                    CommonButton(
                        containerwidth: w * 0.7,
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
                        prefixicon: Icon(
                          Icons.location_on_outlined,
                          color: AppColors.white,
                          size: h * 0.03,
                        ),
                        text: AppText.findloc,
                        textStyle: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w700),
                        onPressed: () {
                          ref
                              .read(dialogServiceProvider)
                              .handleLocationPermission();
                          PreferenceManagerUtils.setIsLogin(true);
                          PreferenceManagerUtils.setIsIndividual(1);
                          // ref.read(dialogServiceProvider).requestLocationPermission();
                          Navigator.pushAndRemoveUntil(
                              context,
                              PageTransition(
                                  child: BottomBar(index: 0),
                                  type: PageTransitionType.rightToLeftWithFade,
                                  duration: const Duration(milliseconds: 400)),
                              (Route<dynamic> route) => false);
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
