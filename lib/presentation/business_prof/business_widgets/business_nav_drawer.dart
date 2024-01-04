import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/both_prof/register/register_screen.dart';
import 'package:rentworthy/presentation/business_prof/current_status/current_status.dart';
import 'package:rentworthy/presentation/business_prof/membership_plan/membership_plan_screen.dart';
import 'package:rentworthy/presentation/business_prof/statistics_reports/statistics_reports_screen.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';

import '../../../../application/dialog/dialog_service.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../../../application/both_prof/login/login_service.dart';
import '../../../data/both_prof/shared_pref/shared_pref.dart';
import '../../indi_prof/account/setting/privacy_policy/privacy_policy.dart';
import '../admin_panel/admin_panel.dart';
import '../business_category_details/business_category_details_screen.dart';
import '../business_chat/business_chat.dart';
import '../business_info/business_info_screen.dart';
import '../post_ur_ad/business_post_ur_ad.dart';
import '../subscription/subscription_screen.dart';
import '../track_item/track_item_screen.dart';
import '../user_prof/user_prof_screen.dart';

class AdminNavDrawer extends ConsumerWidget {
  int selectedindex;

  AdminNavDrawer({super.key, required this.selectedindex});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Drawer(
      elevation: 0,
      backgroundColor: AppColors.white,
      width: w * 0.8,
      shape: LinearBorder.none,
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: h * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        AppImg.appIcon,
                        height: h * 0.05,
                        width: w * 0.12,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          AppImg.homeList,
                          height: h * 0.05,
                          width: h * 0.05,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        width: w * 0.02,
                      ),
                      CommonText(
                          text: "View Profile",
                          style: ptSansTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.022,
                              fontWeight: FontWeight.w600))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: h * 0.015, left: w * 0.055),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonText(
                          text: "Dashboards",
                          style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.4),
                              fontSize: h * 0.022,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 0) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const AdminPanel(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 0
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 0)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 0
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          size: h * 0.02,
                                        ),
                                ),
                                IconText(
                                    title: "Home",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.chartPieSlice,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 1) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const BusinessSandReport(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 1
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 1)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 1
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          size: h * 0.02,
                                        ),
                                ),
                                IconText(
                                    title: AppText.statisticsReport,
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.trendingUp,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 2) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: BusinessCategoryDetails(
                                  isfromNavDrawer: true),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 2
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 2)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 2
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          size: h * 0.02,
                                        ),
                                ),
                                IconText(
                                    title: "Item Listed",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.copy,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 3) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const MemberShipPlan(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 3
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 3)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 3
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          size: h * 0.02,
                                        ),
                                ),
                                IconText(
                                    title: "Membership",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.document,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 4) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const BusinessChatScareen(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 4
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 4)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 4
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          size: h * 0.02,
                                        ),
                                ),
                                IconText(
                                    title: "Chats",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.chats,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: h * 0.015, left: w * 0.055, top: h * 0.015),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CommonText(
                          text: "Pages",
                          style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.4),
                              fontSize: w * 0.045,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 5) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const BusinessUserProf(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 5
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 5)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                      right: selectedindex == 5 ? h * 0.01 : 0),
                                  child: selectedindex == 5
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : Icon(
                                          Icons.keyboard_arrow_down,
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          size: h * 0.035,
                                        ),
                                ),
                                IconText(
                                    title: "User Profile",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.identificationBadge,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 6) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const TrackItem(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 6
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 6)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 6
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : SizedBox(
                                          width: w * 0.065,
                                        ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                  width: w * 0.08,
                                ),
                                IconText(
                                    title: "Track item",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.trendingUp,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 7) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      commonNavigator(
                          type: PageTransitionType.rightToLeftWithFade,
                          context: context,
                          child: const PrivacyPolicy());
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 7
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 7)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 7
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : SizedBox(
                                          width: w * 0.065,
                                        ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                  width: w * 0.08,
                                ),
                                IconText(
                                    title: "Privacy policy",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.copy,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 8) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);

                      commonNavigator(
                          type: PageTransitionType.rightToLeftWithFade,
                          context: context,
                          child: const BusinessInfoScreen());
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 8
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 8)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 8
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : SizedBox(
                                          width: w * 0.065,
                                        ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                  width: w * 0.08,
                                ),
                                IconText(
                                    title: "Business Info",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.copy,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 9) {
                      Navigator.pop(context);
                    } else {
                      ref.read(dialogServiceProvider).areYouSureDialog(
                          titleText: "Are you sure?",
                          subtitleText: "Would you like to logout?",
                          onYesPressed: () {
                            Navigator.pop(context);
                            PreferenceManagerUtils.clearOnLogout();
                            ref.read(loginServiceProvider).logoutWithGoogle();
                            // ref.read(loginServiceProvider).signoutWithFacebook();
                            Navigator.pushAndRemoveUntil(
                                context,
                                PageTransition(
                                    child: const RegisterScreen(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade,
                                    duration:
                                        const Duration(milliseconds: 400)),
                                (Route<dynamic> route) => false);
                          },
                          onNoPressed: () {
                            Navigator.pop(context);
                          });
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 9
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 9)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 9
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : Icon(
                                          Icons.arrow_forward_ios_sharp,
                                          color:
                                              AppColors.black.withOpacity(0.2),
                                          size: h * 0.02,
                                        ),
                                ),
                                IconText(
                                    title: "Logout",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.identificationCard,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: true),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 10) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const SubscriptionScreen(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 10
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 10)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 10
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : SizedBox(
                                          width: w * 0.065,
                                        ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                  width: w * 0.08,
                                ),
                                IconText(
                                    title: "Subscription",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.copy,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 11) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);

                      commonNavigator(
                          type: PageTransitionType.rightToLeftWithFade,
                          context: context,
                          child: const BusinessPostUrAd());
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 11
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 11)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 11
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : SizedBox(
                                          width: w * 0.065,
                                        ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                  width: w * 0.08,
                                ),
                                IconText(
                                    title: "Post Ad",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.copy,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (selectedindex == 12) {
                      Navigator.pop(context);
                    } else {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          PageTransition(
                              child: const CurrentStatus(),
                              type: PageTransitionType.rightToLeftWithFade,
                              duration: const Duration(milliseconds: 400)),
                          (Route<dynamic> route) => false);
                    }
                  },
                  child: Container(
                    width: w,
                    height: h * 0.06,
                    margin: EdgeInsets.symmetric(vertical: h * 0.002),
                    decoration: BoxDecoration(
                      color: selectedindex == 12
                          ? AppColors.black.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.01),
                      child: Stack(
                        children: [
                          if (selectedindex == 12)
                            Positioned(
                              left: w * 0.001,
                              right: 0,
                              top: 0,
                              bottom: 0,
                              child: Row(
                                children: [
                                  Container(
                                    width: w * 0.018,
                                    height: h * 0.035,
                                    decoration: const BoxDecoration(
                                      color: AppColors.black,
                                      borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(18),
                                          bottom: Radius.circular(18)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          Positioned(
                            left: w * 0.05,
                            right: 0,
                            top: 0,
                            bottom: 0,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: h * 0.01),
                                  child: selectedindex == 12
                                      ? SizedBox(
                                          height: h * 0.02,
                                          width: h * 0.02,
                                        )
                                      : SizedBox(
                                          width: w * 0.065,
                                        ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                  width: w * 0.08,
                                ),
                                IconText(
                                    title: "Status",
                                    textStyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: w * 0.045,
                                        fontWeight: FontWeight.w500),
                                    subimg: false,
                                    preimgname: AppImg.copy,
                                    preimgcolor: AppColors.black,
                                    preiconsize: w * 0.07,
                                    preimg: false),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
