import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../utils/color.dart';
import '../account/account_screen.dart';
import '../booking/booking_screen.dart';
import '../chat/chat_screen.dart';
import '../home/home_screen.dart';
import '../sell/sell_screen.dart';
import 'bottom_bar_controller.dart';

class BottomBar extends ConsumerWidget {
  const BottomBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    final asyncState = ref.watch(bottomBarControllerProvider);
    controller() => ref.read(bottomBarControllerProvider.notifier);
    return Scaffold(
      body: controller().getselectedIndex == 0
          ? const HomeScreen()
          : controller().getselectedIndex == 1
              ? const ChatScreen()
              : controller().getselectedIndex == 2
                  ? const BookingScreen()
                  : controller().getselectedIndex == 3
                      ? const AccountScreen()
                      : controller().getselectedIndex == 4
                          ? const SellScreen()
                          : null,

      //  selectedBottomNav.Page,
      bottomNavigationBar: SafeArea(
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          ...List.generate(
            controller().geticonlist.length,
            (index) => InkWell(
                onTap: () {
                  controller().onItemTapped(
                    index,
                  );
                },
                child: Padding(
                  padding: index == 1
                      ? EdgeInsets.only(right: w * 0.02)
                      : index == 2
                          ? EdgeInsets.only(left: w * 0.02)
                          : EdgeInsets.zero,
                  child: Container(
                    height: h * 0.1,
                    width: w * 0.23,
                    color: AppColors.transparent,
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
                                            ? index == 0
                                                ? AppColors.colorPrimary
                                                    .withOpacity(0.7)
                                                : AppColors.colorPrimary
                                            : index == 0
                                                ? AppColors.black
                                                    .withOpacity(0.8)
                                                : AppColors.black,
                                        index == controller().getselectedIndex
                                            ? index == 0
                                                ? AppColors.colorSecondary
                                                    .withOpacity(0.7)
                                                : AppColors.colorSecondary
                                            : index == 0
                                                ? AppColors.black
                                                    .withOpacity(0.8)
                                                : AppColors.black,
                                      ],
                                    ).createShader(bounds);
                                  },
                                  child: Image.asset(
                                    controller().geticonlist[index],
                                    height: h * 0.03,
                                    width: w * 0.05,
                                    color: index ==
                                            controller().getselectedIndex
                                        ? AppColors.white
                                        : index == 0
                                            ? AppColors.black.withOpacity(0.8)
                                            : AppColors.black,
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
                                style: TextStyle(
                                  fontSize: w * 0.023,
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
          padding: EdgeInsets.only(bottom: h * 0.02),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                height: h * 0.073,
                width: h * 0.073,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.colorPrimary,
                        AppColors.colorSecondary
                      ],
                    )),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: h * 0.06,
                      width: h * 0.06,
                      child: FloatingActionButton(
                        backgroundColor: AppColors.white,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(500)),
                        ),
                        onPressed: () async {
                          controller().onItemTapped(
                            4,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  controller().getselectedIndex == 4
                                      ? AppColors.colorPrimary
                                      : AppColors.black.withOpacity(0.7),
                                  controller().getselectedIndex == 4
                                      ? AppColors.colorSecondary
                                      : AppColors.black.withOpacity(0.7),
                                ],
                              ).createShader(bounds);
                            },
                            child: Image.asset(
                              AppImg.plus,
                              color: controller().getselectedIndex == 4
                                  ? AppColors.colorPrimary
                                  : AppColors.black,
                              height: h * 0.03,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.005),
                child: Center(
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
                      "Sell",
                      style: TextStyle(
                        fontSize: w * 0.025,
                        color: controller().getselectedIndex == 4
                            ? AppColors.colorSecondary
                            : AppColors.black.withOpacity(0.8),
                      ),
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
