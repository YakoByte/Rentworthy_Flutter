import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';
import '../../../../shimmers/notification_shimmer.dart';
import '../../../error/error_screen.dart';
import 'notification_controller.dart';

class NotificationScreen extends ConsumerWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(notificationControllerProvider);
    controller() => ref.read(notificationControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        leadingicon: true,
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.white,
        centerTitle: false,
        centerwidget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.02,
          ),
          child: CommonText(
            style: ptSansTextStyle(
                fontSize: w * 0.05,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w700),
            text: AppText.notification,
          ),
        ),
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const NotificationShimmer();
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  color: AppColors.black.withOpacity(0.1),
                  height: h * 0.01,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: w * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              style: ptSansTextStyle(
                                  fontSize: w * 0.05,
                                  color: AppColors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w700),
                              text: AppText.recommendations,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CommonText(
                                    text: AppText.receiverecommendations,
                                    style: ptSansTextStyle(
                                        fontSize: h * 0.02,
                                        color: AppColors.black.withOpacity(0.3),
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                !controller().isSwitched
                                    ? AppColors.gray
                                    : AppColors.colorPrimary,
                                !controller().isSwitched
                                    ? AppColors.dotcolor
                                    : AppColors.colorSecondary
                              ])
                              .createShader(const Rect.fromLTRB(30, 0, 50, 0));
                        },
                        child: Switch(
                          activeColor: AppColors.white,
                          activeTrackColor:
                              AppColors.colorPrimarylight.withOpacity(0.3),
                          inactiveThumbColor: AppColors.white,
                          inactiveTrackColor: AppColors.black.withOpacity(0.1),
                          value: controller().isSwitched,
                          onChanged: (value) {
                            controller().onSwitchTap(val: value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.04, vertical: h * 0.02),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: w * 0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                              style: ptSansTextStyle(
                                  fontSize: w * 0.05,
                                  color: AppColors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w700),
                              text: AppText.receiveupdates,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: CommonText(
                                    text: AppText.getnotified,
                                    style: ptSansTextStyle(
                                        fontSize: h * 0.02,
                                        color: AppColors.black.withOpacity(0.3),
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                !controller().isrecSwitched
                                    ? AppColors.gray
                                    : AppColors.colorPrimary,
                                !controller().isrecSwitched
                                    ? AppColors.dotcolor
                                    : AppColors.colorSecondary
                              ])
                              .createShader(const Rect.fromLTRB(30, 0, 50, 0));
                        },
                        child: Switch(
                          activeColor: AppColors.white,
                          activeTrackColor:
                              AppColors.colorPrimarylight.withOpacity(0.3),
                          inactiveThumbColor: AppColors.white,
                          inactiveTrackColor: AppColors.black.withOpacity(0.1),
                          value: controller().isrecSwitched,
                          onChanged: (value) {
                            controller().onSwitchrecTap(val: value);
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return const NotificationShimmer();
          }),
    );
  }
}
