import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';
import '../images.dart';
import '../text.dart';
import 'common_text.dart';

class RentLendEnjoyIcon extends ConsumerWidget {
  const RentLendEnjoyIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Image.asset(
          AppImg.appLogoWhite,
          height: h * 0.06,
          width: w * 0.45,
        ),
        SizedBox(
          height: h * 0.05,
          width: w * 0.4,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CommonText(
                  text: AppText.rent,
                  style: ptSansTextStyle(
                    color: AppColors.white,
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.w400,
                  )),
              Container(
                height: h * 0.007,
                width: h * 0.007,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              CommonText(
                  text: AppText.lend,
                  style: ptSansTextStyle(
                    color: AppColors.white,
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.w400,
                  )),
              Container(
                height: h * 0.007,
                width: h * 0.007,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              CommonText(
                  text: AppText.enjoy,
                  style: ptSansTextStyle(
                    color: AppColors.white,
                    fontSize: w * 0.05,
                    fontWeight: FontWeight.w400,
                  )),
            ],
          ),
        )
      ],
    );
  }
}
