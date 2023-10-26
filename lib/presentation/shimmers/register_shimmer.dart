import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class RegisterShimmer extends ConsumerWidget {
  const RegisterShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
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
              children: [
                Container(
                  height: h * 0.06,
                  width: w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: h * 0.035,
                ),
                Column(
                  children: [
                    Container(
                      height: h * 0.06,
                      width: w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
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
                SizedBox(
                  height: h * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
            Column(
              children: [
                Container(
                  height: h * 0.06,
                  width: w * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: h * 0.007,
                ),
                Container(
                  height: h * 0.02,
                  width: w * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: h * 0.007,
                ),
                Container(
                  height: h * 0.02,
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: h * 0.02,
                  width: w * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                  ),
                ),
                SizedBox(
                  height: h * 0.007,
                ),
                Container(
                  height: h * 0.02,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
