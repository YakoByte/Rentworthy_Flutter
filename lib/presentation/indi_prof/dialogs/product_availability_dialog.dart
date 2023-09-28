import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rentworthy/utils/common_components/common_outline_button.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';

class ProductAvailabilityDialog extends ConsumerWidget {
  String date;

  ProductAvailabilityDialog({super.key, required this.date});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    // return SizedBox();
    return StatefulBuilder(
      builder: (context, setState1) {
        return AlertDialog(
          elevation: 15,
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          titlePadding: EdgeInsets.only(
              left: w * 0.055, right: w * 0.055, top: h * 0.02, bottom: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          insetPadding: EdgeInsets.only(
            left: w * 0.03,
            right: w * 0.03,
            top: h * 0.02,
            bottom: h * 0.02,
          ),
          contentPadding: EdgeInsets.only(
            left: w * 0.07,
            right: w * 0.07,
          ),
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          content: Container(
            height: h * 0.2,
            width: w * 0.45,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CommonText(
                        text: date,
                        style: ptSansTextStyle(
                            color: AppColors.black,
                            fontSize: h * 0.022,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                CommonButton(
                    containerwidth: w,
                    containerheight: h * 0.05,
                    backgroundColor: AppColors.transparent,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: AppColors.colorPrimary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    text: "Reserve for customer",
                    textStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w700),
                    onPressed: () {}),
                CommonButton(
                    containerwidth: w,
                    containerheight: h * 0.05,
                    backgroundColor: AppColors.transparent,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        color: AppColors.colorSecondary),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    text: "Reserve for myself",
                    textStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w700),
                    onPressed: () {}),
                CommonOutlineButton(
                    containerwidth: w,
                    containerheight: h * 0.05,
                    backgroundColor: AppColors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: const GradientBoxBorder(
                        gradient: LinearGradient(colors: [
                          AppColors.colorPrimary,
                          AppColors.colorSecondary
                        ]),
                        width: 2.5,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    text: "Available",
                    textStyle: ptSansTextStyle(
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ],
                          ).createShader(const Rect.fromLTRB(150, 0, 250, 20)),
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w700),
                    side: const BorderSide(
                        color: AppColors.transparent, width: 1),
                    onPressed: () {}),
              ],
            ),
          ),
        );
      },
    );
  }
}
