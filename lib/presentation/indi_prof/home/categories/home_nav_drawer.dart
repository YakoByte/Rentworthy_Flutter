import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/indi_prof/booking/booking_screen.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';

import '../../../../application/dialog/dialod_service.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/common_title_subtitle.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../account/setting/contact_us/contact_us.dart';
import '../../account/setting/my_address/my_address.dart';
import '../../account/setting/my_ads/my_ads.dart';
import '../../account/setting/privacy_policy/privacy_policy.dart';
import '../../account/setting/review/write_review/write_review.dart';
import '../../account/setting/setting_screen.dart';
import '../../account/setting/terms_service/terms_service.dart';
import '../../account/view_profile/view_profile.dart';

class HomeNavDrawer extends ConsumerWidget {
  const HomeNavDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.white,
      width: w * 0.7,
      shape: LinearBorder.none,
      child: SingleChildScrollView(
        physics: NeverScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///gradient container
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                commonNavigator(
                  context: context,
                  child: ViewProfile(),
                  type: PageTransitionType.rightToLeftWithFade,
                );
              },
              child: Padding(
                padding: EdgeInsets.only(top: h * 0.06, bottom: h * 0.02),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: h * 0.1,
                        padding: EdgeInsets.symmetric(horizontal: w * 0.025),
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ]),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: w * 0.02),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: Image.asset(
                                      AppImg.homelist,
                                      height: h * 0.075,
                                      width: h * 0.075,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: w * 0.4,
                                  height: h * 0.07,
                                  child: TitleSubtitle(
                                      isColExpanded: true,
                                      isExpanded: false,
                                      title: AppText.hamzaali,
                                      subtitle: AppText.myaccunt,
                                      onTap: () {
                                        Navigator.pop(context);
                                        commonNavigator(
                                          context: context,
                                          child: ViewProfile(),
                                          type: PageTransitionType
                                              .rightToLeftWithFade,
                                        );
                                      },
                                      titleStyle: ptSansTextStyle(
                                        color: AppColors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: h * 0.023,
                                        fontWeight: FontWeight.w600,
                                      ),
                                      subtitleStyle: ptSansTextStyle(
                                        color: AppColors.white,
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: h * 0.017,
                                        fontWeight: FontWeight.w500,
                                      )),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: AppColors.white, size: h * 0.025)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 100.ms).then(delay: 100.ms).slideX(
                    begin: 1,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 500.ms,
                  ),
            ),
            Container(
              height: h * 0.7,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ///categories
                    GestureDetector(
                      onTap: () {
                        ref.read(dialogServiceProvider).rentScreeningDialog();
                        // commonNavigator(
                        //   context: context,
                        //   child: ViewProfile(),
                        //   type: PageTransitionType.rightToLeftWithFade,
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.032,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: w * 0.03),
                                    child: Icon(Icons.category,
                                        color: AppColors.black.withOpacity(0.6),
                                        size: h * 0.03),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    height: h * 0.06,
                                    child: TitleSubtitle(
                                        isExpanded: true,
                                        isColExpanded: true,
                                        title: AppText.categories,
                                        subtitle: AppText.eleccarbike,
                                        onTap: () {
                                          ref
                                              .read(dialogServiceProvider)
                                              .rentScreeningDialog();
                                          // commonNavigator(
                                          //   context: context,
                                          //   child: ViewProfile(),
                                          //   type: PageTransitionType
                                          //       .rightToLeftWithFade,
                                          // );
                                        },
                                        titleStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.8),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        subtitleStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.015,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                            Icon(Icons.arrow_forward_ios,
                                color: AppColors.black.withOpacity(0.6),
                                size: h * 0.025)
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 110.ms)
                          .then(delay: 110.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///my activities
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: h * 0.01,
                        horizontal: w * 0.032,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          CommonText(
                              text: AppText.myact,
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.4),
                                overflow: TextOverflow.ellipsis,
                                fontSize: h * 0.021,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(duration: 120.ms)
                        .then(delay: 120.ms)
                        .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms,
                        ),
                    Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: h * 0.01,
                      thickness: 1,
                    )
                        .animate()
                        .fadeIn(duration: 120.ms)
                        .then(delay: 120.ms)
                        .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms,
                        ),

                    ///my orders
                    GestureDetector(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: BookingScreen(
                            fromNav: false,
                          ),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: w * 0.032, vertical: h * 0.011),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: w * 0.03),
                                    child: Image.asset(
                                      AppImg.gift,
                                      height: h * 0.03,
                                      width: h * 0.03,
                                    ),
                                  ),
                                  CommonText(
                                      text: AppText.orders,
                                      style: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                        overflow: TextOverflow.ellipsis,
                                        fontSize: h * 0.021,
                                        fontWeight: FontWeight.w600,
                                      )),
                                ],
                              ))
                          .animate()
                          .fadeIn(duration: 130.ms)
                          .then(delay: 130.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///my ads
                    GestureDetector(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: MyAds(),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: w * 0.032,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: w * 0.03),
                                    child: Image.asset(
                                      AppImg.advertisements,
                                      height: h * 0.03,
                                      width: h * 0.03,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.4,
                                    height: h * 0.06,
                                    child: TitleSubtitle(
                                        isExpanded: true,
                                        isColExpanded: true,
                                        title: AppText.myads,
                                        subtitle: AppText.adspostedbyyou,
                                        onTap: () {
                                          commonNavigator(
                                            context: context,
                                            child: MyAds(),
                                            type: PageTransitionType
                                                .rightToLeftWithFade,
                                          );
                                        },
                                        titleStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.8),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        subtitleStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.015,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ],
                              ),
                            ),
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
                            duration: 500.ms,
                          ),
                    ),

                    ///messages and notifications
                    GestureDetector(
                      onTap: () {
                        // commonNavigator(
                        //   context: context,
                        //   child: ViewProfile(),
                        //   type: PageTransitionType.rightToLeftWithFade,
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: w * 0.03),
                                    child: Image.asset(
                                      AppImg.bullhorn,
                                      height: h * 0.03,
                                      width: h * 0.03,
                                    ),
                                  ),
                                  Container(
                                    width: w * 0.5,
                                    height: h * 0.06,
                                    child: TitleSubtitle(
                                        isExpanded: true,
                                        isColExpanded: true,
                                        title: AppText.msgandnotification,
                                        subtitle: AppText.chatalert,
                                        onTap: () {
                                          // commonNavigator(
                                          //   context: context,
                                          //   child: ViewProfile(),
                                          //   type: PageTransitionType
                                          //       .rightToLeftWithFade,
                                          // );
                                        },
                                        titleStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.8),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.021,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        subtitleStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.6),
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: h * 0.015,
                                          fontWeight: FontWeight.w500,
                                        )),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 150.ms)
                          .then(delay: 150.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///others
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: h * 0.005,
                            horizontal: w * 0.032,
                          ),
                          child: CommonText(
                              text: AppText.others,
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.4),
                                overflow: TextOverflow.ellipsis,
                                fontSize: h * 0.021,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ],
                    )
                        .animate()
                        .fadeIn(duration: 160.ms)
                        .then(delay: 160.ms)
                        .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms,
                        ),
                    Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: h * 0.02,
                      thickness: 1,
                    )
                        .animate()
                        .fadeIn(duration: 170.ms)
                        .then(delay: 170.ms)
                        .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms,
                        ),

                    ///how it works
                    GestureDetector(
                      onTap: () {
                        // commonNavigator(
                        //   context: context,
                        //   child: ViewProfile(),
                        //   type: PageTransitionType.rightToLeftWithFade,
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Image.asset(
                                AppImg.slideshow,
                                height: h * 0.03,
                                width: h * 0.03,
                              ),
                            ),
                            CommonText(
                                text: AppText.howitworks,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 180.ms)
                          .then(delay: 180.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///for business
                    GestureDetector(
                      onTap: () {
                        // commonNavigator(
                        //   context: context,
                        //   child: ViewProfile(),
                        //   type: PageTransitionType.rightToLeftWithFade,
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Image.asset(
                                AppImg.rs,
                                height: h * 0.03,
                                width: h * 0.03,
                              ),
                            ),
                            CommonText(
                                text: AppText.forbusiness,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 190.ms)
                          .then(delay: 190.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///rate us
                    GestureDetector(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: WriteReviewScreen(),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Icon(
                                Icons.star,
                                color: AppColors.black.withOpacity(0.6),
                                size: h * 0.03,
                              ),
                            ),
                            CommonText(
                                text: AppText.rateus,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 200.ms)
                          .then(delay: 200.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///my address
                    GestureDetector(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: MyAddressesScreen(),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Icon(
                                Icons.location_on,
                                size: h * 0.03,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                            ),
                            CommonText(
                                text: AppText.myaddress,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 210.ms)
                          .then(delay: 210.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///blog
                    GestureDetector(
                      onTap: () {
                        // commonNavigator(
                        //   context: context,
                        //   child: ViewProfile(),
                        //   type: PageTransitionType.rightToLeftWithFade,
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Image.asset(
                                AppImg.blog,
                                height: h * 0.03,
                                width: h * 0.03,
                              ),
                            ),
                            CommonText(
                                text: AppText.blogs,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 220.ms)
                          .then(delay: 220.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///faqs
                    GestureDetector(
                      onTap: () {
                        // commonNavigator(
                        //   context: context,
                        //   child: ViewProfile(),
                        //   type: PageTransitionType.rightToLeftWithFade,
                        // );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Icon(
                                Icons.help,
                                size: h * 0.03,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                            ),
                            CommonText(
                                text: AppText.faqs,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 230.ms)
                          .then(delay: 230.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///settings
                    GestureDetector(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: SettingScreen(),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Icon(
                                Icons.settings,
                                size: h * 0.03,
                                color: AppColors.black.withOpacity(0.6),
                              ),
                            ),
                            CommonText(
                                text: AppText.setting,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 240.ms)
                          .then(delay: 240.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///terms and service
                    GestureDetector(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: TermsService(),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Image.asset(
                                AppImg.notes,
                                height: h * 0.03,
                                width: h * 0.03,
                              ),
                            ),
                            CommonText(
                                text: AppText.tns,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 250.ms)
                          .then(delay: 250.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///privacy policy
                    GestureDetector(
                      onTap: () {
                        commonNavigator(
                          context: context,
                          child: PrivacyPolicy(),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.032, vertical: h * 0.014),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: w * 0.03),
                              child: Image.asset(
                                AppImg.notes,
                                height: h * 0.03,
                                width: h * 0.03,
                              ),
                            ),
                            CommonText(
                                text: AppText.privacypolcy,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w600,
                                )),
                          ],
                        ),
                      )
                          .animate()
                          .fadeIn(duration: 260.ms)
                          .then(delay: 260.ms)
                          .slideX(
                            begin: 1,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 500.ms,
                          ),
                    ),

                    ///contact us
                    CommonButton(
                            containerwidth: w * 0.45,
                            containerheight: h * 0.06,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(11),
                                gradient: const LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      AppColors.colorPrimary,
                                      AppColors.colorSecondary
                                    ])),
                            backgroundColor: AppColors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(11),
                            ),
                            prefixicon: Icon(
                              Icons.call,
                              color: AppColors.white,
                              size: h * 0.028,
                            ),
                            text: AppText.contactus,
                            textStyle: ptSansTextStyle(
                                color: AppColors.white,
                                fontSize: h * 0.019,
                                fontWeight: FontWeight.w700),
                            onPressed: () {
                              commonNavigator(
                                context: context,
                                child: ContactUsScreen(),
                                type: PageTransitionType.rightToLeftWithFade,
                              );
                            })
                        .animate()
                        .fadeIn(duration: 270.ms)
                        .then(delay: 270.ms)
                        .slideX(
                          begin: 1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms,
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
