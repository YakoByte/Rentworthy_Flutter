import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class DetectOtpShimmer extends ConsumerWidget {
  const DetectOtpShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Shimmer.fromColors(
      baseColor: AppColors.shimmergrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.025),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.04,
                  width: w * 0.7,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: h * 0.01,
                ),
                Container(
                  height: h * 0.02,
                  width: w * 0.75,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: h * 0.08,
                      width: h * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                    Container(
                      height: h * 0.08,
                      width: h * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                    Container(
                      height: h * 0.08,
                      width: h * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                    Container(
                      height: h * 0.08,
                      width: h * 0.08,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: h * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: h * 0.02,
                      width: w * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
