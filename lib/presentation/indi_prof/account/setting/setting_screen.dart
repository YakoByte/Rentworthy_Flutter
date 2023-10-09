import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/indi_prof/account/setting/statistics_reports/statistics_reports.dart';
import 'package:rentworthy/utils/text.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/common_title_subtitle.dart';
import 'create_pass/create_password.dart';
import 'notification/notification.dart';

class SettingScreen extends ConsumerWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        leadingicon: true,
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.white,
        centerTitle: false,
        centerwidget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.02,
          ),
          child: CommonText(
            style: ptSansTextStyle(
                fontSize: w * 0.06,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w700),
            text: AppText.setting,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: AppColors.black.withOpacity(0.1),
            height: h * 0.01,
            thickness: 1,
          ).animate().fadeIn(duration: 100.ms).then(delay: 100.ms).slideY(
              begin: 50,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.012),
            child: TitleSubtitle(
              isExpanded: false,
              isColExpanded: true,
              title: AppText.statisticsreport,
              subtitle: AppText.useract,
              titleStyle: ptSansTextStyle(
                  fontSize: w * 0.05,
                  color: AppColors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w700),
              subtitleStyle: ptSansTextStyle(
                  fontSize: h * 0.02,
                  color: AppColors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w400),
              onTap: () {
                commonNavigator(
                  context: context,
                  child: StatisticsReports(),
                  type: PageTransitionType.rightToLeftWithFade,
                );
              },
            ),
          ).animate().fadeIn(duration: 150.ms).then(delay: 150.ms).slideY(
              begin: 30,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          Divider(
            color: AppColors.black.withOpacity(0.1),
            height: h * 0.01,
            thickness: 1,
          ).animate().fadeIn(duration: 200.ms).then(delay: 200.ms).slideY(
              begin: 50,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.012),
            child: TitleSubtitle(
              isExpanded: false,
              isColExpanded: true,
              onTap: () {
                commonNavigator(
                  context: context,
                  child: CreatePassword(),
                  type: PageTransitionType.rightToLeftWithFade,
                );
              },
              title: AppText.privacylogout,
              subtitle: AppText.createpass,
              titleStyle: ptSansTextStyle(
                  fontSize: w * 0.05,
                  color: AppColors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w700),
              subtitleStyle: ptSansTextStyle(
                  fontSize: h * 0.02,
                  color: AppColors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w400),
            ),
          ).animate().fadeIn(duration: 250.ms).then(delay: 250.ms).slideY(
              begin: 30,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          Divider(
            color: AppColors.black.withOpacity(0.1),
            height: h * 0.01,
            thickness: 1,
          ).animate().fadeIn(duration: 300.ms).then(delay: 300.ms).slideY(
              begin: 50,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.012),
            child: TitleSubtitle(
              isColExpanded: true,
              isExpanded: false,
              onTap: () {
                commonNavigator(
                  context: context,
                  child: NotificationScreen(),
                  type: PageTransitionType.rightToLeftWithFade,
                );
              },
              title: AppText.notification,
              subtitle: AppText.recommendation,
              titleStyle: ptSansTextStyle(
                  fontSize: w * 0.05,
                  color: AppColors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w700),
              subtitleStyle: ptSansTextStyle(
                  fontSize: h * 0.02,
                  color: AppColors.black.withOpacity(0.3),
                  fontWeight: FontWeight.w400),
            ),
          ).animate().fadeIn(duration: 350.ms).then(delay: 350.ms).slideY(
              begin: 30,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          Divider(
            color: AppColors.black.withOpacity(0.1),
            height: h * 0.01,
            thickness: 1,
          ).animate().fadeIn(duration: 400.ms).then(delay: 400.ms).slideY(
              begin: 50,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.012),
                    child: CommonText(
                      text: AppText.logout,
                      style: ptSansTextStyle(
                          fontSize: w * 0.05,
                          color: AppColors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 450.ms).then(delay: 450.ms).slideY(
              begin: 30,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          Divider(
            color: AppColors.black.withOpacity(0.1),
            height: h * 0.01,
            thickness: 1,
          ).animate().fadeIn(duration: 500.ms).then(delay: 500.ms).slideY(
              begin: 50,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.012),
                    child: CommonText(
                      text: AppText.logoutall,
                      style: ptSansTextStyle(
                          fontSize: w * 0.05,
                          color: AppColors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 550.ms).then(delay: 550.ms).slideY(
              begin: 30,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 1000.ms),
          // Divider(
          //   color: AppColors.black.withOpacity(0.1),
          //   height: h * 0.01,
          //   thickness: 1,
          // ).animate().fadeIn(duration: 600.ms).then(delay: 600.ms).slideY(
          //     begin: 50,
          //     end: 0,
          //     curve: Curves.easeInOutCubic,
          //     duration: 1000.ms),
          // Padding(
          //   padding:
          //       EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.012),
          //   child: Row(
          //     children: [
          //       Expanded(
          //         child: CommonText(
          //           text: AppText.dltacc,
          //           style: ptSansTextStyle(
          //               fontSize: w * 0.05,
          //               color: AppColors.black.withOpacity(0.6),
          //               fontWeight: FontWeight.w700),
          //         ),
          //       ),
          //     ],
          //   ),
          // ).animate().fadeIn(duration: 650.ms).then(delay: 650.ms).slideY(
          //     begin: 30,
          //     end: 0,
          //     curve: Curves.easeInOutCubic,
          //     duration: 1000.ms),
        ],
      ),
    );
  }
}
