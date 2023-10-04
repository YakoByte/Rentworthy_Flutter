import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/business_prof/business_chat/business_bulk_msg/bulk_msg_req.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';
import '../../../utils/text.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import 'business_all/business_all.dart';
import 'business_buying/business_buying.dart';
import 'business_chat_controller.dart';
import 'business_selling/business_selling.dart';

class BusinessChatScareen extends ConsumerWidget {
  const BusinessChatScareen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(businessChatControllerProvider);
    controller() => ref.read(businessChatControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      key: Globals.chatkey,
      backgroundColor: AppColors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(top: h * 0.75),
        child: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: CommonButton(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: AppColors.white),
            onPressed: () {
              commonNavigator(
                context: context,
                child: const BulkMsgReq(),
                type: PageTransitionType.rightToLeftWithFade,
              );
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            backgroundColor: AppColors.transparent,
            prefixicon: Image.asset(
              AppImg.addchat,
              color: AppColors.black.withOpacity(0.8),
              height: h * 0.035,
            ),
            containerwidth: w * 0.35,
            containerheight: h * 0.08,
            text: 'Bulk Message',
            textStyle: ptSansTextStyle(
                fontSize: w * 0.03,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w600),
            centericon: Center(
                child: Image.asset(AppImg.chat1,
                    color: AppColors.white, height: h * 0.035)),
          ),
        ),
      ).animate().fadeIn(duration: 150.ms).then(delay: 150.ms).slideY(
          begin: 3, end: 0, curve: Curves.easeInOutCubic, duration: 1000.ms),
      drawer: AdminNavDrawer(
        selectedindex: 4,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.035),
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                BusinessSearch(adminscaffoldKey: Globals.chatkey)
                    .animate()
                    .fadeIn(duration: 300.ms)
                    .then(delay: 300.ms)
                    .slideX(
                      begin: 1,
                      end: 0,
                      curve: Curves.easeInOutCubic,
                      duration: 600.ms,
                    ),
                SizedBox(
                  height: h * 0.89,
                  width: w,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.025),
                    child: DefaultTabController(
                      length: 3,
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            TabBar(
                                controller: controller().tabController,
                                onTap: (value) {
                                  controller().onTabTap(val: value);
                                },
                                automaticIndicatorColorAdjustment: true,
                                dragStartBehavior: DragStartBehavior.start,
                                indicatorPadding: EdgeInsets.zero,
                                dividerColor: Colors.transparent,
                                unselectedLabelColor: AppColors.transparent,
                                splashBorderRadius: BorderRadius.zero,
                                indicatorSize: TabBarIndicatorSize.tab,
                                splashFactory: NoSplash.splashFactory,
                                isScrollable: false,
                                padding: EdgeInsets.zero,
                                labelPadding: EdgeInsets.zero,
                                tabs: [
                                  Tab(
                                    height: h * 0.06,
                                    child: Container(
                                      height: h * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          AppText.all,
                                          style: ptSansTextStyle(
                                              foreground: Paint()
                                                ..shader = LinearGradient(
                                                  colors: <Color>[
                                                    controller().selectedtab ==
                                                            0
                                                        ? AppColors.colorPrimary
                                                        : AppColors.black
                                                            .withOpacity(0.5),
                                                    controller().selectedtab ==
                                                            0
                                                        ? AppColors
                                                            .colorSecondary
                                                        : AppColors.black
                                                            .withOpacity(0.5)
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTRB(
                                                        45, 0, 60, 10)),
                                              fontSize: h * 0.025,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    height: h * 0.06,
                                    child: Container(
                                      height: h * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          "Buying",
                                          style: ptSansTextStyle(
                                              foreground: Paint()
                                                ..shader = LinearGradient(
                                                  colors: <Color>[
                                                    controller().selectedtab ==
                                                            1
                                                        ? AppColors.colorPrimary
                                                        : AppColors.black
                                                            .withOpacity(0.5),
                                                    controller().selectedtab ==
                                                            1
                                                        ? AppColors
                                                            .colorSecondary
                                                        : AppColors.black
                                                            .withOpacity(0.5)
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTRB(
                                                        130, 0, 190, 10)),
                                              fontSize: h * 0.025,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Tab(
                                    height: h * 0.06,
                                    child: Container(
                                      height: h * 0.06,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: Align(
                                        alignment: Alignment.center,
                                        child: Text(
                                          AppText.selling,
                                          style: ptSansTextStyle(
                                              foreground: Paint()
                                                ..shader = LinearGradient(
                                                  colors: <Color>[
                                                    controller().selectedtab ==
                                                            2
                                                        ? AppColors.colorPrimary
                                                        : AppColors.black
                                                            .withOpacity(0.5),
                                                    controller().selectedtab ==
                                                            2
                                                        ? AppColors
                                                            .colorSecondary
                                                        : AppColors.black
                                                            .withOpacity(0.5)
                                                  ],
                                                ).createShader(
                                                    const Rect.fromLTRB(
                                                        240, 0, 300, 10)),
                                              fontSize: h * 0.025,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                ]),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.02, horizontal: w * 0.021),
                              child: CommonText(
                                  text: AppText.quickfilter,
                                  style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      fontSize: h * 0.025,
                                      fontWeight: FontWeight.w700)),
                            ),
                            SizedBox(
                              height: h * 0.85,
                              child: const TabBarView(children: [
                                BusinessAll(),
                                BusinessBuying(),
                                BusinessSelling(),
                              ]),
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
      ),
    );
  }
}
