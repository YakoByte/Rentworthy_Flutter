import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';
import 'hor_ver_list_shimmer.dart';

class StatisticsReportShimmer extends ConsumerWidget {
  const StatisticsReportShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
            ),
            child: Container(
              height: h * 0.2,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
            ),
            child: Container(
              height: h * 0.15,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
            ),
          ),
          Container(
            height: h * 0.002,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: h * 0.05,
                      width: h * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      height: h * 0.05,
                      width: w * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      height: h * 0.05,
                      width: w * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                HorVerListShimmer(
                  height: h * 0.4,
                  isTopPadding: true,
                  width: w,
                  contwidth: w,
                  borderRadius: BorderRadius.circular(8),
                  contheight: h * 0.1,
                  scrollDirection: Axis.vertical,
                  imgList: const [
                    "",
                    "",
                    "",
                    "",
                    "",
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
