import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';

class SellingAll extends ConsumerWidget {
  const SellingAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.05),
      child: Column(
        children: [
          Image.asset(AppImg.noChat,
              height: h * 0.3, width: w * 0.6, fit: BoxFit.cover),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.01),
            child: CommonText(
                textAlign: TextAlign.center,
                text: AppText.noChat,
                style: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.4),
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.06),
            child: CommonText(
                text: AppText.sellMsg,
                textAlign: TextAlign.center,
                style: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.4),
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w400)),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: h * 0.015),
            child: CommonButton(
                containerwidth: w * 0.5,
                containerheight: h * 0.055,
                backgroundColor: AppColors.transparent,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        AppColors.colorPrimary,
                        AppColors.colorSecondary,
                      ],
                    )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4)),
                text: AppText.startSell,
                textStyle: ptSansTextStyle(
                    color: AppColors.white,
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w700),
                onPressed: () {}),
          ),
        ],
      ),
    );
  }
}
