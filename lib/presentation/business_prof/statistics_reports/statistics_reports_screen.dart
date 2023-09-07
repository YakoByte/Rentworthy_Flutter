import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/business_prof/statistics_reports/statistics_reports_screen_controller.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_listview.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/common_title_subtitle.dart';
import '../../../utils/common_components/icon_text.dart';
import '../../../utils/globals.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../../indi_prof/home/categories/categories.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';

class BusinessSandReport extends ConsumerWidget {
  const BusinessSandReport({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(statReportControllerProvider);
    controller() => ref.read(statReportControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.sandRkey,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 1,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                child: BusinessSearch(adminscaffoldKey: Globals.sandRkey)
                    .animate()
                    .fadeIn(duration: 100.ms)
                    .then(delay: 100.ms)
                    .slideX(
                        begin: 1,
                        end: 0,
                        curve: Curves.easeInOutCubic,
                        duration: 400.ms),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                child: Column(
                  children: [
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
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(8),
                                  ),
                                  color: AppColors.colorSecondarydark
                                      .withOpacity(0.3),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: h * 0.015,
                              child: Image.asset(AppImg.statisticcharacter,
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
                                title: AppText.welcomeback,
                                subtitle: AppText.yourstatistics,
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
                                  subimgcolor: AppColors.black.withOpacity(0.8),
                                  title: AppText.summary,
                                  textStyle: ptSansTextStyle(
                                      fontSize: h * 0.02,
                                      color: AppColors.black.withOpacity(0.8),
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
                                        Image.asset(AppImg.accountmultiple,
                                            height: h * 0.025, width: w * 0.1),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.02,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w500),
                                            text: AppText.rental),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.03,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w800),
                                            text: "02"),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: AppColors.black.withOpacity(0.1),
                                      thickness: 1.2,
                                      width: w * 0.02,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(AppImg.accountarrow,
                                            height: h * 0.025, width: w * 0.1),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.02,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w500),
                                            text: AppText.request),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.03,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w800),
                                            text: "06"),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: AppColors.black.withOpacity(0.1),
                                      thickness: 1.2,
                                      width: w * 0.02,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(AppImg.handcoin,
                                            height: h * 0.025, width: w * 0.1),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.02,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w500),
                                            text: AppText.rented),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.03,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w800),
                                            text: "01"),
                                      ],
                                    ),
                                    VerticalDivider(
                                      color: AppColors.black.withOpacity(0.1),
                                      thickness: 1.2,
                                      width: w * 0.02,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset(AppImg.accountarrowup,
                                            height: h * 0.025, width: w * 0.1),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.02,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w500),
                                            text: AppText.requested),
                                        CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.03,
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontWeight: FontWeight.w800),
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
              ).animate().fadeIn(duration: 200.ms).then(delay: 200.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 500.ms),
              Divider(
                color: AppColors.black.withOpacity(0.2),
                height: h * 0.04,
                thickness: 1,
              ).animate().fadeIn(duration: 300.ms).then(delay: 300.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 600.ms),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: w * 0.02),
                          child: CommonText(
                              style: ptSansTextStyle(
                                  fontSize: h * 0.028,
                                  color: AppColors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w700),
                              text: "Visitors (34,032)"),
                        ),
                        Padding(
                          padding: EdgeInsets.all(w * 0.015),
                          child: CommonButton(
                              containerwidth: w * 0.22,
                              containerheight: h * 0.05,
                              backgroundColor:
                                  AppColors.starcolor.withOpacity(0.6),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(45)),
                              text: "Month",
                              suffixicon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: AppColors.black.withOpacity(0.4),
                                size: h * 0.03,
                              ),
                              textStyle: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.4),
                                  fontSize: w * 0.03,
                                  fontWeight: FontWeight.w700),
                              onPressed: () {}),
                        ),
                      ],
                    ),
                    CommonText(
                      text: AppText.comingsoon,
                      style: ptSansTextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ],
                            ).createShader(
                                const Rect.fromLTRB(100, 0, 350, 20)),
                          fontSize: h * 0.05,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 400.ms).then(delay: 400.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 700.ms),
              Divider(
                color: AppColors.black.withOpacity(0.2),
                height: h * 0.04,
                thickness: 1,
              ).animate().fadeIn(duration: 500.ms).then(delay: 500.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 800.ms),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.035),
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
                        height: h * 0.1 * controller().getTitle.length,
                        itemBuilder: (context, index) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Card(
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
                                  ),
                            ],
                          );
                        }),
                  ],
                ),
              ).animate().fadeIn(duration: 600.ms).then(delay: 600.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 900.ms),

              /// Featured Ads
              Categories(
                animatecontrollerlist: [],
                isFavIcon: true,
                isFeature: true,
                isTopPadding: false,
                onFavPressed: (index) {
                  controller().onFavTap(index, 0);
                },
                isextended: false,
                title: AppText.featuredads,
                isViewAll: false,
                isCategory: false,
                shrinkWrap: false,
                width: w,
                height: h * 0.35,
                scrollDirection: Axis.horizontal,
                nameList: controller().nameList,
                imgList: controller().imgList,
                favList: controller().getfeatureadfavlist,
                contheight: h * 0.32,
                contwidth: w * 0.45,
                type: 0,
                contColor: AppColors.white,
                borderRadius: BorderRadius.circular(14),
              ).animate().fadeIn(duration: 700.ms).then(delay: 700.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 1000.ms),
              Padding(
                padding: EdgeInsets.only(bottom: h * 0.015),
                child: Categories(
                  animatecontrollerlist: [],
                  isFavIcon: true,
                  isFeature: false,
                  onFavPressed: (index) {
                    controller().onFavTap(index, 1);
                  },
                  title: AppText.nearbyads,
                  isViewAll: true,
                  isextended: false,
                  isCategory: false,
                  isTopPadding: false,
                  favList: controller().getnearbyadfavlist,
                  shrinkWrap: false,
                  width: w,
                  type: 1,
                  height: h * 0.35,
                  scrollDirection: Axis.horizontal,
                  nameList: controller().nameList,
                  imgList: controller().imgList,
                  contheight: h * 0.32,
                  contwidth: w * 0.45,
                  contColor: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                ).animate().fadeIn(duration: 700.ms).then(delay: 700.ms).slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),
              ).animate().fadeIn(duration: 800.ms).then(delay: 800.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 1100.ms),

              /// Popular ads
              Padding(
                padding: EdgeInsets.only(top: h * 0.005, bottom: h * 0.015),
                child: Categories(
                  animatecontrollerlist: [],
                  isFavIcon: true,
                  isFeature: false,
                  isextended: false,
                  title: AppText.popularads,
                  isViewAll: true,
                  isTopPadding: false,
                  type: 2,
                  favList: controller().getpopularfavlist,
                  isCategory: false,
                  shrinkWrap: false,
                  width: w,
                  height: h * 0.35,
                  scrollDirection: Axis.horizontal,
                  nameList: controller().nameList,
                  imgList: controller().imgList,
                  contheight: h * 0.32,
                  contwidth: w * 0.45,
                  contColor: AppColors.white,
                  borderRadius: BorderRadius.circular(14),
                  onFavPressed: (index) {
                    controller().onFavTap(index, 2);
                  },
                ).animate().fadeIn(duration: 600.ms).then(delay: 600.ms).slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),
              ).animate().fadeIn(duration: 900.ms).then(delay: 900.ms).slideX(
                  begin: 1,
                  end: 0,
                  curve: Curves.easeInOutCubic,
                  duration: 1200.ms),
            ],
          ),
        ),
      ),
    );
  }
}
