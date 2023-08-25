import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rentworthy/presentation/loading/sell/sell_screen_controller.dart';
import 'package:rentworthy/utils/common_components/common_gridview.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_appbar.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/text.dart';

class SellScreen extends ConsumerWidget {
  const SellScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final asyncState = ref.watch(sellScreenControllerProvider);
    controller() => ref.read(sellScreenControllerProvider.notifier);

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        leadingicon: false,
        padding: EdgeInsets.symmetric(
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.white,
        centerTitle: true,
        centerwidget: CommonText(
          style: ptSansTextStyle(
              fontSize: w * 0.05,
              color: AppColors.black.withOpacity(0.8),
              fontWeight: FontWeight.w700),
          text: AppText.whatareyouoffering,
        ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
            begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.01,
              thickness: 1,
            ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
                begin: -1,
                end: 0,
                curve: Curves.easeInOutCubic,
                duration: 400.ms),
            CommonGridView(
                itemCount: controller().nameList.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: false,
                padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                childAspectRatio: 0.5,
                crossAxisSpacing: w * 0.03,
                mainAxisSpacing: h * 0.02,
                crossAxisCount: 2,
                maxCrossAxisExtent: w * 0.5,
                mainAxisExtent: h * 0.1,
                width: w,
                height: h * 0.65,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller().onSelect(index);
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05, vertical: h * 0.014),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.white,
                          border: controller().getselectedIndex == index
                              ? GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ]),
                                  width: 1.5,
                                )
                              : Border.all(
                                  color: AppColors.bordercolor, width: 1)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    controller().getselectedIndex == index
                                        ? AppColors.colorPrimary
                                        : AppColors.black.withOpacity(0.8),
                                    controller().getselectedIndex == index
                                        ? AppColors.colorSecondary
                                        : AppColors.black.withOpacity(0.8),
                                  ]).createShader(bounds);
                            },
                            child: Image.asset(
                              controller().imgList[index],
                              color: AppColors.white,
                              height: h * 0.04,
                              width: h * 0.04,
                            ),
                          ),
                          CommonText(
                              text: controller().nameList[index],
                              textAlign: TextAlign.center,
                              style: ptSansTextStyle(
                                foreground: Paint()
                                  ..shader = LinearGradient(
                                    colors: <Color>[
                                      controller().getselectedIndex == index
                                          ? AppColors.colorPrimary
                                          : AppColors.black.withOpacity(0.8),
                                      controller().getselectedIndex == index
                                          ? AppColors.colorSecondary
                                          : AppColors.black.withOpacity(0.8),
                                    ],
                                  ).createShader(
                                      const Rect.fromLTRB(30, 0, 250, 20)),
                                fontSize: h * 0.015,
                                fontWeight: FontWeight.w600,
                              )),
                        ],
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: ((index * 20) + 100).ms)
                      .then(delay: ((index * 10) + 50).ms)
                      .slideX(
                          begin: index.isEven ? 1 : -1,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 400.ms);
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: w * 0.05, vertical: h * 0.02),
                  child: CommonButton(
                      containerwidth: w * 0.3,
                      containerheight: h * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ])),
                      backgroundColor: AppColors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      text: AppText.next,
                      textStyle: ptSansTextStyle(
                          color: AppColors.white,
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700),
                      onPressed: () {}),
                ),
              ],
            ).animate().fadeIn(duration: 100.ms).then(delay: 100.ms).slideX(
                begin: 1,
                end: 0,
                curve: Curves.easeInOutCubic,
                duration: 400.ms),
          ]),
    );
  }
}
