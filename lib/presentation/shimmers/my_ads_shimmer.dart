import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';
import 'hor_ver_list_shimmer.dart';

class MyAdsShimmer extends ConsumerWidget {
  const MyAdsShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.04,
        ),
        child: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: h * 0.02,
              ),
              Container(
                width: w,
                height: h * 0.06,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                ),
              ),
              HorVerListShimmer(
                height: h * 0.8,
                isTopPadding: true,
                width: w,
                contwidth: w,
                borderRadius: BorderRadius.circular(8),
                contheight: h * 0.15,
                scrollDirection: Axis.vertical,
                imgList: const [
                  "",
                  "",
                  "",
                  "",
                  "",
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
