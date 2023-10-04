import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rentworthy/presentation/indi_prof/chat/selling/selling_chat_controller.dart';
import 'package:rentworthy/presentation/indi_prof/chat/selling/suball/selling_suball.dart';
import 'package:rentworthy/presentation/indi_prof/chat/selling/subunread/selling_subunread.dart';
import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/text.dart';
import 'meeting/selling_submeeting.dart';

class SellingChat extends ConsumerWidget {
  const SellingChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(sellingChatControllerProvider);
    controller() => ref.read(sellingChatControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
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
                  height: h * 0.06,
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
                  height: h * 0.06,
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
                        AppText.unread,
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
                  height: h * 0.06,
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
                        AppText.important,
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
        Container(
          height: h * 0.69,
          child: TabBarView(controller: controller().tabController, children: [
            SellingAll(),
            SellingMeeting(),
            SellingUnread(),
          ]),
        ),
      ],
    );
  }
}
