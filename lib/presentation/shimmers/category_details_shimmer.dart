import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class CategoryDetailsShimmer extends ConsumerWidget {
  const CategoryDetailsShimmer({super.key});

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
              height: h * 0.4,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: h * 0.05,
                  width: w * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  height: h * 0.05,
                  width: w * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
            Container(
              height: h * 0.1,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: AppColors.white,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.012),
              child: Container(
                height: h * 0.11,
                width: w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.008),
              child: Container(
                height: h * 0.1,
                width: w,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ],
        ),
      ),
      // ListView.builder(
      //   itemBuilder: (_, __) => Padding(
      //     padding: const EdgeInsets.only(bottom: 8.0),
      //     child: Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Container(
      //           width: 48.0,
      //           height: 48.0,
      //           color: Colors.white,
      //         ),
      //         const Padding(
      //           padding: EdgeInsets.symmetric(horizontal: 8.0),
      //         ),
      //         Expanded(
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Container(
      //                 width: double.infinity,
      //                 height: 8.0,
      //                 color: Colors.white,
      //               ),
      //               const Padding(
      //                 padding: EdgeInsets.symmetric(vertical: 2.0),
      //               ),
      //               Container(
      //                 width: double.infinity,
      //                 height: 8.0,
      //                 color: Colors.white,
      //               ),
      //               const Padding(
      //                 padding: EdgeInsets.symmetric(vertical: 2.0),
      //               ),
      //               Container(
      //                 width: 40.0,
      //                 height: 8.0,
      //                 color: Colors.white,
      //               ),
      //             ],
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      //   itemCount: 6,
      // )
    );
  }
}
