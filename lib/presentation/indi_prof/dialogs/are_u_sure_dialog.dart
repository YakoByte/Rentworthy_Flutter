import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/import_utils.dart';

class AreYouSureDialog extends ConsumerWidget {
  String titleText;
  String subtitleText;
  void Function() onYesPressed;
  void Function() onNoPressed;

  AreYouSureDialog(
      {super.key,
      required this.titleText,
      required this.subtitleText,
      required this.onYesPressed,
      required this.onNoPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      titlePadding:
          EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      title: CommonText(
          text: titleText,
          style: ptSansTextStyle(
              foreground: Paint()
                ..shader = const LinearGradient(
                  colors: <Color>[
                    AppColors.colorPrimary,
                    AppColors.colorSecondary
                  ],
                ).createShader(const Rect.fromLTRB(100, 0, 180, 100)),
              fontSize: h * 0.025,
              fontWeight: FontWeight.w600)),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding:
          EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      buttonPadding: EdgeInsets.zero,
      actionsPadding:
          EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.02),
      iconPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content: CommonText(
          text: subtitleText,
          style: ptSansTextStyle(
              color: AppColors.black,
              fontSize: h * 0.02,
              fontWeight: FontWeight.w600)),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
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
                  text: "Yes",
                  textStyle: ptSansTextStyle(
                      color: AppColors.white,
                      fontSize: h * 0.022,
                      fontWeight: FontWeight.w700),
                  onPressed: onYesPressed),
            ),
            SizedBox(
              width: w * 0.02,
            ),
            Expanded(
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
                  text: "No",
                  textStyle: ptSansTextStyle(
                      color: AppColors.white,
                      fontSize: h * 0.022,
                      fontWeight: FontWeight.w700),
                  onPressed: onNoPressed),
            ),
          ],
        ),
      ],
    );
  }
}
