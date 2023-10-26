import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';
import 'hor_ver_list_shimmer.dart';

class ViewProfileShimmer extends ConsumerWidget {
  const ViewProfileShimmer({super.key});

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
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.02),
                          child: Container(
                            height: h * 0.08,
                            width: h * 0.08,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(1000),
                              color: AppColors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: h * 0.022,
                          width: w * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: h * 0.022,
                      width: w * 0.2,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: h * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: h * 0.025,
                        width: w * 0.6,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: h * 0.02),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: h * 0.025,
                        width: w * 0.5,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
          HorVerListShimmer(
            height: h * 0.6,
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
            ],
          )
        ],
      ),
    );
  }
}
