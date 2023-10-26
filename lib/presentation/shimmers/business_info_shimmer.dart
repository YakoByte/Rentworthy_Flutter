import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class BusinessInfoShimmer extends ConsumerWidget {
  const BusinessInfoShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Container(
              height: h * 0.16,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Container(
              height: h * 0.16,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Container(
              height: h * 0.025,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Container(
              height: h * 0.02,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Container(
              height: h * 0.02,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: h * 0.06,
                  width: w * 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
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
