import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/loading/account/setting/id_verification/id_verification.dart';
import 'package:rentworthy/presentation/loading/account/setting/select_lang/select_lang.dart';
import 'package:rentworthy/presentation/loading/account/setting/setting_screen.dart';
import 'package:rentworthy/presentation/loading/account/view_profile/view_profile.dart';
import 'package:rentworthy/presentation/loading/account/widgets/profile_img_name.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.03),
          child: Container(
            height: h,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      bottom: h * 0.025,
                    ),
                    child: ProfileImgName(
                        verified: false,
                        name: AppText.viewandeditprof,
                        onTap: () {
                          commonNavigator(
                            context: context,
                            child: ViewProfile(),
                            type: PageTransitionType.rightToLeftWithFade,
                          );
                        }),
                  ),
                  SettingContainer(
                    onTap: () {
                      commonNavigator(
                        context: context,
                        child: SettingScreen(),
                        type: PageTransitionType.rightToLeftWithFade,
                      );
                    },
                    imgName: Icons.settings,
                    title: AppText.setting,
                    isDivider: true,
                    subTitle: AppText.privacylogout,
                  ),
                  SettingContainer(
                    onTap: () {
                      commonNavigator(
                        context: context,
                        child: IdVerification(),
                        type: PageTransitionType.rightToLeftWithFade,
                      );
                    },
                    imgName: Icons.help,
                    title: AppText.helpsupport,
                    isDivider: true,
                    subTitle: AppText.helplegalterms,
                  ),
                  SettingContainer(
                    onTap: () {
                      commonNavigator(
                        context: context,
                        child: SelectLangScreen(),
                        type: PageTransitionType.rightToLeftWithFade,
                      );
                    },
                    imgName: Icons.translate,
                    title: AppText.selectlang,
                    isDivider: false,
                    subTitle: AppText.eng,
                  ),
                  Container(
                    height: h * 0.31,
                    width: w,
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ]),
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: w * 0.37,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: "${AppText.plantrip}\n",
                                      style: ptSansTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.022,
                                          fontWeight: FontWeight.w700),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: AppText.wehavecovered,
                                          style: ptSansTextStyle(
                                              color: AppColors.white,
                                              fontSize: h * 0.016,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CommonButton(
                                    containerwidth: w * 0.37,
                                    containerheight: h * 0.05,
                                    backgroundColor: AppColors.white,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    text: AppText.startrent,
                                    textStyle: ptSansTextStyle(
                                        foreground: Paint()
                                          ..shader = const LinearGradient(
                                            colors: <Color>[
                                              AppColors.colorPrimary,
                                              AppColors.colorSecondary
                                            ],
                                          ).createShader(const Rect.fromLTRB(
                                              20, 0, 300, 20)),
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w600),
                                    onPressed: () {}),
                              ],
                            ),
                            Image.asset(AppImg.accoutimg,
                                height: h * 0.3, width: w * 0.45)
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SettingContainer extends ConsumerWidget {
  IconData imgName;
  String title;
  String subTitle;
  bool isDivider;
  void Function() onTap;

  SettingContainer(
      {super.key,
      required this.imgName,
      required this.title,
      required this.onTap,
      required this.isDivider,
      required this.subTitle});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Container(
            height: h * 0.08,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: w * 0.03, top: h * 0.008),
                      child: Column(
                        children: [
                          Icon(
                            imgName,
                            size: h * 0.035,
                            color: AppColors.black.withOpacity(0.6),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                            text: title,
                            maxLines: 1,
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              overflow: TextOverflow.ellipsis,
                              fontSize: h * 0.025,
                              fontWeight: FontWeight.w500,
                            )),
                        CommonText(
                            text: subTitle,
                            maxLines: 1,
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.3),
                              overflow: TextOverflow.ellipsis,
                              fontSize: h * 0.018,
                              fontWeight: FontWeight.w500,
                            )),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.008),
                  child: Icon(Icons.arrow_forward_ios_sharp,
                      color: AppColors.black.withOpacity(0.6), size: h * 0.025),
                )
              ],
            ),
          ),
        ),
        if (isDivider == true)
          Divider(
            color: AppColors.black.withOpacity(0.1),
            thickness: 1.5,
            height: h * 0.02,
          )
      ],
    );
  }
}
