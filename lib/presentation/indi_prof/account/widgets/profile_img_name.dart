import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/icon_text.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';

class ProfileImgName extends ConsumerWidget {
  String name;
  void Function()? onTap;
  bool? verified;

  ProfileImgName(
      {super.key,
      required this.name,
      required this.onTap,
      required this.verified});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: w * 0.02),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Image.asset(
                  AppImg.homelist,
                  height: h * 0.075,
                  width: h * 0.075,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonText(
                    text: AppText.hamzaali,
                    maxLines: 1,
                    style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      overflow: TextOverflow.ellipsis,
                      fontSize: h * 0.027,
                      fontWeight: FontWeight.w600,
                    )),
                if (verified == true)
                  IconText(
                    preimg: true,
                    subimg: false,
                    preiconsize: h * 0.02,
                    title: AppText.hamzaali,
                    preicon: Icons.verified,
                    preimgcolor: AppColors.white,
                    textStyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      overflow: TextOverflow.ellipsis,
                      fontSize: h * 0.015,
                      fontWeight: FontWeight.w400,
                    ),
                    preshadermask: true,
                  ),
                if (verified == true)
                  IconText(
                    preimg: true,
                    subimg: false,
                    preiconsize: h * 0.02,
                    title: AppText.userverified,
                    preicon: Icons.verified,
                    preimgcolor: AppColors.white,
                    textStyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      overflow: TextOverflow.ellipsis,
                      fontSize: h * 0.015,
                      fontWeight: FontWeight.w400,
                    ),
                    preshadermask: true,
                  ),
              ],
            ),
          ],
        ),
        GestureDetector(
          onTap: onTap,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.colorPrimary,
                        AppColors.colorSecondary
                      ]).createShader(bounds);
                },
                child: Row(
                  children: [
                    CommonText(
                        text: name,
                        maxLines: 1,
                        style: ptSansTextStyle(
                          color: AppColors.white,
                          decorationColor: AppColors.colorSecondary,
                          decorationThickness: 1,
                          decorationStyle: TextDecorationStyle.solid,
                          decoration: TextDecoration.underline,
                          fontSize: h * 0.018,
                          fontWeight: FontWeight.w600,
                        )),
                    Icon(
                      Icons.arrow_forward_ios_outlined,
                      color: AppColors.white,
                      size: h * 0.017,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
