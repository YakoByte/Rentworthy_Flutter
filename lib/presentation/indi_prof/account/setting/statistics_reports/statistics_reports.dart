import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/indi_prof/account/setting/statistics_reports/statistics_reports_controller.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';
import 'package:rentworthy/utils/common_components/common_title_subtitle.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import '../../../../shimmers/statistics_report_shimmer.dart';
import '../../../error/error_screen.dart';

class StatisticsReports extends ConsumerWidget {
  const StatisticsReports({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(statisticsReportsControllerProvider);
    controller() => ref.read(statisticsReportsControllerProvider.notifier);

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
                fontSize: w * 0.05,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w700),
            text: AppText.statisticsReport,
          ),
        ).animate().fade(duration: 1000.ms).then(delay: 1000.ms).slideX(
            begin: 0, end: 0, curve: Curves.decelerate, duration: 800.ms),
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const StatisticsReportShimmer();
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 1,
                  )
                      .animate()
                      .fade(duration: 1000.ms)
                      .then(delay: 1000.ms)
                      .slideX(
                          begin: 0,
                          end: 0,
                          curve: Curves.decelerate,
                          duration: 800.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    child: Column(
                      children: [
                        /// Your Statistics
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: h * 0.2,
                            width: w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 0,
                                  left: h * 0.02,
                                  child: Container(
                                    height: h * 0.17,
                                    width: w * 0.2,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.vertical(
                                        top: Radius.circular(8),
                                      ),
                                      color: AppColors.colorSecondaryDark
                                          .withOpacity(0.3),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 0,
                                  left: h * 0.015,
                                  child: Image.asset(AppImg.statisticCharacter,
                                      height: h * 0.19, width: w * 0.4),
                                ),
                                Positioned(
                                  right: 0,
                                  bottom: h * 0.06,
                                  top: h * 0.06,
                                  left: w * 0.48,
                                  child: TitleSubtitle(
                                    isColExpanded: false,
                                    isExpanded: false,
                                    onTap: () {},
                                    title: AppText.welcomeBack,
                                    subtitle: AppText.yourStatistics,
                                    subtitleStyle: ptSansTextStyle(
                                        fontSize: w * 0.05,
                                        color: AppColors.black.withOpacity(0.8),
                                        fontWeight: FontWeight.w700),
                                    titleStyle: ptSansTextStyle(
                                        fontSize: h * 0.02,
                                        color: AppColors.black.withOpacity(0.8),
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),

                        /// Summary
                        Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Container(
                            height: h * 0.18,
                            width: w,
                            padding: EdgeInsets.all(w * 0.045),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    IconText(
                                      preimg: false,
                                      subimg: true,
                                      subicon: Icons.help_outline,
                                      subiconsize: h * 0.02,
                                      subimgcolor:
                                          AppColors.black.withOpacity(0.8),
                                      title: AppText.summary,
                                      textStyle: ptSansTextStyle(
                                          fontSize: h * 0.02,
                                          color:
                                              AppColors.black.withOpacity(0.8),
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: h * 0.1,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.stretch,
                                      children: [
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(AppImg.accountMultiple,
                                                height: h * 0.025,
                                                width: w * 0.1),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.02,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w500),
                                                text: AppText.rental),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.03,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w800),
                                                text: "02"),
                                          ],
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.1),
                                          thickness: 1.2,
                                          width: w * 0.02,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(AppImg.accountArrow,
                                                height: h * 0.025,
                                                width: w * 0.1),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.02,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w500),
                                                text: AppText.request),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.03,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w800),
                                                text: "06"),
                                          ],
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.1),
                                          thickness: 1.2,
                                          width: w * 0.02,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(AppImg.handCoin,
                                                height: h * 0.025,
                                                width: w * 0.1),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.02,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w500),
                                                text: AppText.rented),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.03,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w800),
                                                text: "01"),
                                          ],
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.1),
                                          thickness: 1.2,
                                          width: w * 0.02,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Image.asset(AppImg.accountArrowUp,
                                                height: h * 0.025,
                                                width: w * 0.1),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.02,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w500),
                                                text: AppText.requested),
                                            CommonText(
                                                style: ptSansTextStyle(
                                                    fontSize: h * 0.03,
                                                    color: AppColors.black
                                                        .withOpacity(0.8),
                                                    fontWeight:
                                                        FontWeight.w800),
                                                text: "08"),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 100.ms)
                      .then(delay: 100.ms)
                      .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 400.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.2),
                    height: h * 0.04,
                    thickness: 1,
                  )
                      .animate()
                      .fadeIn(duration: 120.ms)
                      .then(delay: 120.ms)
                      .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 450.ms),

                  /// Report
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                              child: Icon(
                                Icons.insert_chart_outlined_rounded,
                                size: h * 0.04,
                                color: AppColors.black.withOpacity(0.8),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.02),
                              child: CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: h * 0.028,
                                      color: AppColors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.w700),
                                  text: AppText.report),
                            ),
                            Container(
                              height: h * 0.035,
                              width: w * 0.25,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      AppColors.colorPrimary,
                                      AppColors.colorSecondary
                                    ]),
                              ),
                              child: Center(
                                child: CommonText(
                                    style: ptSansTextStyle(
                                        fontSize: h * 0.017,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.w400),
                                    text: "Last 30 Days"),
                              ),
                            )
                          ],
                        ),
                        CommonListView(
                            itemCount: controller().getTitle.length,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            width: w,
                            height: h * 0.14 * controller().getTitle.length,
                            itemBuilder: (context, index) {
                              return Card(
                                elevation: 2,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  height: h * 0.1,
                                  width: w,
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.04,
                                      vertical: h * 0.015),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.white,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                          style: ptSansTextStyle(
                                              foreground: Paint()
                                                ..shader = const LinearGradient(
                                                  colors: <Color>[
                                                    AppColors.colorPrimary,
                                                    AppColors.colorSecondary
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTRB(
                                                        10, 0, 150, 20)),
                                              fontSize: h * 0.022,
                                              fontWeight: FontWeight.w500),
                                          text: controller().getTitle[index]),
                                      Row(
                                        children: [
                                          CommonText(
                                              style: ptSansTextStyle(
                                                  foreground: Paint()
                                                    ..shader =
                                                        const LinearGradient(
                                                      colors: <Color>[
                                                        AppColors.colorPrimary,
                                                        AppColors.colorSecondary
                                                      ],
                                                    ).createShader(
                                                            const Rect.fromLTRB(
                                                                30,
                                                                0,
                                                                150,
                                                                10)),
                                                  fontSize: h * 0.022,
                                                  fontWeight: FontWeight.w700),
                                              text: controller()
                                                  .getsubtitle[index]),
                                          CommonText(
                                              style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.8),
                                                  fontSize: h * 0.020,
                                                  fontWeight: FontWeight.w500),
                                              text: "+0% vs Previous period"),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              )
                                  .animate(
                                      controller: controller()
                                          .animatecontrollerlist![index],
                                      autoPlay: false)
                                  .fadeIn(duration: ((index * 40) + 100).ms)
                                  .then(delay: ((index * 40) + 100).ms)
                                  .slideX(
                                    begin: 1,
                                    end: 0,
                                    curve: Curves.easeInOutCubic,
                                    duration: 500.ms,
                                  );
                            }),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 140.ms)
                      .then(delay: 140.ms)
                      .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms),
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return const StatisticsReportShimmer();
          }),
    );
  }
}
