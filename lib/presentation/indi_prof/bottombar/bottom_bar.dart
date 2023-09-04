import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/images.dart';
import '../account/account_screen.dart';
import '../booking/booking_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../sell/sell_screen.dart';
import 'bottom_bar_controller.dart';

class BottomBar extends ConsumerWidget {
  BottomBar({Key? key, required this.index}) : super(key: key);
  int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    print("index is=-=-= $index");
    final asyncState = ref.watch(bottomBarControllerProvider(index: index));
    controller() =>
        ref.read(bottomBarControllerProvider(index: index).notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      body: SizedBox.expand(
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: controller().pageController,
          onPageChanged: (index) {
            // controller().pageController!.animateToPage(index,
            //     duration: Duration(milliseconds: 600), curve: Curves.ease);
            // controller().onItemTapped(index);
          },
          children: [
            HomeScreen(),
            ChatScreen(
              frombottom: true,
            ),
            BookingScreen(),
            AccountScreen(),
            SellScreen(),
          ],
        ),
      ),

      //selectedBottomNav.Page,
      bottomNavigationBar: SafeArea(
        top: false,
        right: false,
        left: false,
        bottom: true,
        maintainBottomViewPadding: true,
        minimum: EdgeInsets.only(bottom: h * 0.005),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ...List.generate(
            controller().geticonlist.length,
            (index) => GestureDetector(
                onTap: () {
                  print(controller().getselectedIndex);
                  print(index);
                  if (controller().getselectedIndex > index) {
                    print("33");
                    controller().pageController!.jumpToPage(index);
                  } else {
                    print("44");
                    controller().pageController!.animateToPage(index,
                        duration: Duration(milliseconds: 400),
                        curve: Curves.ease);
                  }
                  controller().onItemTapped(index);
                },
                child: Padding(
                  padding: index == 1
                      ? EdgeInsets.only(right: w * 0.02)
                      : index == 2
                          ? EdgeInsets.only(left: w * 0.02)
                          : EdgeInsets.zero,
                  child: Container(
                    height: h * 0.08,
                    width: w * 0.23,
                    color: AppColors.white,
                    child: Padding(
                      padding: index == 1
                          ? EdgeInsets.only(right: w * 0.05)
                          : index == 2
                              ? EdgeInsets.only(left: w * 0.05)
                              : EdgeInsets.zero,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                              height: h * 0.025,
                              width: h * 0.025,
                              child: Center(
                                child: ShaderMask(
                                  shaderCallback: (Rect bounds) {
                                    return LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        index == controller().getselectedIndex
                                            ? AppColors.colorPrimary
                                            : AppColors.black.withOpacity(0.8),
                                        index == controller().getselectedIndex
                                            ? AppColors.colorSecondary
                                            : AppColors.black.withOpacity(0.8),
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: Image.asset(
                                    controller().geticonlist[index],
                                    height: h * 0.03,
                                    width: h * 0.03,
                                    color:
                                        index == controller().getselectedIndex
                                            ? AppColors.white
                                            : AppColors.black.withOpacity(0.8),
                                  ),
                                ),
                              )),
                          Center(
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    index == controller().getselectedIndex
                                        ? AppColors.colorPrimary
                                        : AppColors.black.withOpacity(0.8),
                                    index == controller().getselectedIndex
                                        ? AppColors.colorSecondary
                                        : AppColors.black.withOpacity(0.8),
                                  ],
                                ).createShader(bounds);
                              },
                              child: Text(
                                controller().gettablist[index],
                                style: ptSansTextStyle(
                                  fontSize: w * 0.025,
                                  fontWeight:
                                      index == controller().getselectedIndex
                                          ? FontWeight.w600
                                          : FontWeight.w500,
                                  color: index == controller().getselectedIndex
                                      ? AppColors.colorSecondary
                                      : AppColors.black.withOpacity(0.8),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )),
          ),
        ]),
      ),

      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Visibility(
        visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
        child: Padding(
          padding: EdgeInsets.only(bottom: h * 0.025),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: h * 0.065,
                width: h * 0.065,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                    border: GradientBoxBorder(
                      gradient: LinearGradient(colors: [
                        AppColors.colorPrimary,
                        AppColors.colorSecondary
                      ]),
                      width: 4,
                    )),
                child: FloatingActionButton(
                  backgroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(500)),
                  ),
                  onPressed: () async {
                    if (controller().getselectedIndex > index) {
                      print("22");
                      controller().pageController!.jumpToPage(4);
                    } else {
                      print("11");
                      controller().pageController!.animateToPage(4,
                          duration: Duration(milliseconds: 400),
                          curve: Curves.ease);
                    }
                    controller().onItemTapped(4);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              controller().getselectedIndex == 4
                                  ? AppColors.colorPrimary
                                  : AppColors.black.withOpacity(0.7),
                              controller().getselectedIndex == 4
                                  ? AppColors.colorSecondary
                                  : AppColors.black.withOpacity(0.7),
                            ]).createShader(const Rect.fromLTRB(5, 0, 20, 300));
                      },
                      child: Image.asset(
                        AppImg.plus,
                        color: AppColors.white,
                        height: h * 0.03,
                        width: h * 0.03,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.01),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        controller().getselectedIndex == 4
                            ? AppColors.colorPrimary
                            : AppColors.black.withOpacity(0.8),
                        controller().getselectedIndex == 4
                            ? AppColors.colorSecondary
                            : AppColors.black.withOpacity(0.8),
                      ],
                    ).createShader(bounds);
                  },
                  child: Text(
                    "List",
                    style: ptSansTextStyle(
                      fontSize: w * 0.025,
                      fontWeight: 4 == controller().getselectedIndex
                          ? FontWeight.w600
                          : FontWeight.w500,
                      color: controller().getselectedIndex == 4
                          ? AppColors.colorSecondary
                          : AppColors.black.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
