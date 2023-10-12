import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';
import 'hor_ver_list_shimmer.dart';

class MyAddressShimmer extends ConsumerWidget {
  const MyAddressShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmergrey,
      highlightColor: AppColors.white,
      enabled: true,

      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: h * 0.06,
            width: w,
            decoration: BoxDecoration(
              color: AppColors.white,
            ),
          ),
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.01),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: h * 0.02,
                  width: w * 0.45,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          HorVerListShimmer(
            height: h * 0.8,
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
