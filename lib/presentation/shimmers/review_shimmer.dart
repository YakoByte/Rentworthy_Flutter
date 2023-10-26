import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';
import 'hor_ver_list_shimmer.dart';

class ReviewShimmer extends ConsumerWidget {
  const ReviewShimmer({super.key});

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
          Container(
            height: h * 0.002,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.white,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
            child: Container(
              height: h * 0.2,
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
              borderRadius: BorderRadius.circular(5),
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Container(
                      height: h * 0.05,
                      width: h * 0.05,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(width: w * 0.01),
                    Container(
                      height: h * 0.05,
                      width: w * 0.3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: h * 0.05,
                  width: h * 0.05,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: h * 0.002,
            width: w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: AppColors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.05,
                  width: w * 0.2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.04,
            ),
            child: HorVerListShimmer(
              height: h * 0.5,
              isTopPadding: true,
              width: w,
              contwidth: w,
              contheight: h * 0.2,
              scrollDirection: Axis.vertical,
              imgList: const [
                "",
                "",
                "",
                "",
                "",
              ],
            ),
          )
        ],
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
