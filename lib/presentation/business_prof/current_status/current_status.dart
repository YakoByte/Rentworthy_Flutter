import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/indi_prof/account/setting/review/write_review/write_review.dart';

import '../../../utils/import_utils.dart';
import '../../indi_prof/error/error_screen.dart';
import '../../shimmers/hor_ver_list_shimmer.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import 'current_status_controller.dart';

class CurrentStatus extends ConsumerWidget {
  const CurrentStatus({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(currentStatusControllerProvider);
    controller() => ref.read(currentStatusControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.currentstatusKey,
      backgroundColor: AppColors.white,
      drawer: AdminNavDrawer(
        selectedindex: 12,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return HorVerListShimmer(
                height: h * 0.89,
                isTopPadding: true,
                width: w,
                contwidth: w,
                borderRadius: BorderRadius.circular(8),
                contheight: h * 0.15,
                scrollDirection: Axis.vertical,
                imgList: const [
                  "",
                  "",
                  "",
                  "",
                  "",
                ],
              );
            }
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      BusinessSearch(adminscaffoldKey: Globals.currentstatusKey)
                          .animate()
                          .fadeIn(duration: 400.ms)
                          .then(delay: 400.ms)
                          .slideX(
                            begin: 2,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 600.ms,
                          ),
                      Container(
                        height: h * 0.89,
                        width: w,
                        child: SingleChildScrollView(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              style: ptSansTextStyle(
                                  fontSize: w * 0.07,
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        AppColors.colorPrimary,
                                        AppColors.colorSecondary
                                      ],
                                    ).createShader(
                                        const Rect.fromLTRB(0, 0, 50, 10)),
                                  fontWeight: FontWeight.w500),
                              text: "Status",
                            )
                                .animate()
                                .fadeIn(duration: 600.ms)
                                .then(delay: 600.ms)
                                .slideX(
                                  begin: 12,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 600.ms,
                                ),
                            Divider(
                              color: AppColors.black.withOpacity(0.2),
                              height: h * 0.04,
                              thickness: 1,
                            )
                                .animate()
                                .fadeIn(duration: 700.ms)
                                .then(delay: 700.ms)
                                .slideX(
                                  begin: 12,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 600.ms,
                                ),
                            Card(
                              color: AppColors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                height: h * 0.15,
                                width: w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02,
                                      vertical: h * 0.012),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: h * 0.12,
                                        width: w * 0.24,
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(14),
                                          child: Stack(
                                            children: [
                                              Image.asset(
                                                AppImg.homeList,
                                                height: h * 0.12,
                                                width: w * 0.24,
                                                fit: BoxFit.cover,
                                              ),
                                              Positioned(
                                                top: h * 0.005,
                                                right: w * 0.01,
                                                child: Align(
                                                  alignment: Alignment.topRight,
                                                  child: GestureDetector(
                                                    onTap: () {},
                                                    child: CircleAvatar(
                                                      backgroundColor:
                                                          AppColors.starColor,
                                                      radius: h * 0.02,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                AppColors.white,
                                                            size: h * 0.024,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            style: ptSansTextStyle(
                                                fontSize: w * 0.04,
                                                color: AppColors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w700),
                                            text: "Xbox Series S",
                                          ),
                                          Container(
                                            width: w * 0.4,
                                            child: IntrinsicHeight(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  CommonText(
                                                    text: AppText.price25k,
                                                    style: ptSansTextStyle(
                                                        fontSize: h * 0.018,
                                                        color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                  ),
                                                  VerticalDivider(
                                                    color: AppColors.black
                                                        .withOpacity(0.3),
                                                    width: 1,
                                                    thickness: 1,
                                                  ),
                                                  ShaderMask(
                                                    shaderCallback:
                                                        (Rect bounds) {
                                                      return const LinearGradient(
                                                              begin: Alignment
                                                                  .centerLeft,
                                                              end: Alignment
                                                                  .centerRight,
                                                              colors: [
                                                            AppColors
                                                                .colorPrimary,
                                                            AppColors
                                                                .colorSecondary
                                                          ])
                                                          .createShader(bounds);
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .location_on_outlined,
                                                        color: AppColors.white,
                                                        size: h * 0.025),
                                                  ),
                                                  Expanded(
                                                    child: CommonText(
                                                      text: AppText.thane,
                                                      maxLines: 1,
                                                      style: ptSansTextStyle(
                                                          fontSize: h * 0.015,
                                                          color: AppColors.black
                                                              .withOpacity(0.3),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          CommonText(
                                            text: AppText.perDay,
                                            style: ptSansTextStyle(
                                                fontSize: w * 0.04,
                                                color: AppColors.black
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          commonNavigator(
                                            context: context,
                                            child: const WriteReviewScreen(),
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            CommonText(
                                              textAlign: TextAlign.center,
                                              style: ptSansTextStyle(
                                                  fontSize: w * 0.04,
                                                  color: AppColors.black,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w700),
                                              text: "Add \nReview",
                                            ),
                                            SizedBox(
                                              height: h * 0.01,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            )
                                .animate()
                                .fadeIn(duration: 800.ms)
                                .then(delay: 800.ms)
                                .slideX(
                                  begin: 12,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 600.ms,
                                ),
                            Divider(
                              color: AppColors.black.withOpacity(0.2),
                              height: h * 0.04,
                              thickness: 1,
                            )
                                .animate()
                                .fadeIn(duration: 900.ms)
                                .then(delay: 900.ms)
                                .slideX(
                                  begin: 12,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 600.ms,
                                ),
                          ],
                        )),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return HorVerListShimmer(
              height: h * 0.89,
              isTopPadding: true,
              width: w,
              contwidth: w,
              borderRadius: BorderRadius.circular(8),
              contheight: h * 0.15,
              scrollDirection: Axis.vertical,
              imgList: const [
                "",
                "",
                "",
                "",
                "",
              ],
            );
          }),
    );
  }
}
