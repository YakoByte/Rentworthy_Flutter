import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rentworthy/presentation/loading/chat/all/meeting/all_submeeting.dart';
import 'package:rentworthy/presentation/loading/chat/all/suball/all_suball.dart';
import 'package:rentworthy/presentation/loading/chat/all/subunread/all_subunread.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/text.dart';
import 'all_chat_controller.dart';

class AllChat extends ConsumerStatefulWidget {
  const AllChat({super.key});

  @override
  ConsumerState createState() => _AllChatState();
}

class _AllChatState extends ConsumerState<AllChat> {
  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(allChatControllerProvider);
    controller() => ref.read(allChatControllerProvider.notifier);
    print("tab is ${controller().tabController.index}");
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            child: TabBar(
                controller: controller().tabController,
                indicatorWeight: 0,
                onTap: (value) {
                  controller().onTabTap(val: value);
                },
                automaticIndicatorColorAdjustment: true,
                dragStartBehavior: DragStartBehavior.start,
                indicatorPadding: EdgeInsets.symmetric(
                    vertical: h * 0.005, horizontal: w * 0.02),
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.transparent,
                splashBorderRadius: BorderRadius.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                splashFactory: NoSplash.splashFactory,
                isScrollable: false,
                indicator: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.colorPrimary,
                      AppColors.colorSecondary,
                    ]),
                    border: GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                      AppColors.colorPrimary,
                      AppColors.colorSecondary,
                    ])),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: h * 0.005,
                      ),
                      decoration: BoxDecoration(
                        border: GradientBoxBorder(
                            gradient: LinearGradient(colors: [
                          controller().selectedtab == 0
                              ? AppColors.transparent
                              : AppColors.colorPrimary,
                          controller().selectedtab == 0
                              ? AppColors.transparent
                              : AppColors.colorSecondary,
                        ])),
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
                                    controller().selectedtab == 0
                                        ? AppColors.white
                                        : AppColors.colorPrimary,
                                    controller().selectedtab == 0
                                        ? AppColors.white
                                        : AppColors.colorSecondary
                                  ],
                                ).createShader(Rect.fromLTRB(30, 0, 100, 10)),
                              fontSize: w * 0.043,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: h * 0.005,
                      ),
                      decoration: BoxDecoration(
                        border: GradientBoxBorder(
                            gradient: LinearGradient(colors: [
                          controller().selectedtab == 1
                              ? AppColors.transparent
                              : AppColors.colorPrimary,
                          controller().selectedtab == 1
                              ? AppColors.transparent
                              : AppColors.colorSecondary,
                        ])),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppText.meeting,
                          style: ptSansTextStyle(
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: <Color>[
                                    controller().selectedtab == 1
                                        ? AppColors.white
                                        : AppColors.colorPrimary,
                                    controller().selectedtab == 1
                                        ? AppColors.white
                                        : AppColors.colorSecondary
                                  ],
                                ).createShader(Rect.fromLTRB(120, 0, 250, 100)),
                              fontSize: w * 0.043,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                        vertical: h * 0.005,
                      ),
                      decoration: BoxDecoration(
                        border: GradientBoxBorder(
                            gradient: LinearGradient(colors: [
                          controller().selectedtab == 2
                              ? AppColors.transparent
                              : AppColors.colorPrimary,
                          controller().selectedtab == 2
                              ? AppColors.transparent
                              : AppColors.colorSecondary,
                        ])),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          AppText.unread,
                          style: ptSansTextStyle(
                              foreground: Paint()
                                ..shader = LinearGradient(
                                  colors: <Color>[
                                    controller().selectedtab == 2
                                        ? AppColors.white
                                        : AppColors.colorPrimary,
                                    controller().selectedtab == 2
                                        ? AppColors.white
                                        : AppColors.colorSecondary
                                  ],
                                ).createShader(Rect.fromLTRB(120, 0, 450, 100)),
                              fontSize: w * 0.043,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          // .animate(
          //   onComplete: (controller1) {
          //     for (int i = 0; i < 13; i++) {
          //       controller().animatecontrollerlist![i].forward();
          //     }
          //   },
          // )
          // .fadeIn(duration: 140.ms)
          // .then(delay: 140.ms)
          // .slideX(
          //   begin: -1,
          //   end: 0,
          //   curve: Curves.easeInOutCubic,
          //   duration: 500.ms,
          // ),
          Container(
            height: h * 0.8,
            child:
                TabBarView(controller: controller().tabController, children: [
              AllSubAll(),
              AllSubMeeting(),
              AllSubUnread(),
            ]),
          ),
        ],
      ),
    );
  }
}
