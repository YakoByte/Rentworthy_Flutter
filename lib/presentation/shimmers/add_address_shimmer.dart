import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class AddAddressShimmer extends ConsumerWidget {
  const AddAddressShimmer({super.key});

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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
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
              horizontal: w * 0.05,
            ),
            child: Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: h * 0.06,
                  width: w * 0.43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
                Container(
                  height: h * 0.06,
                  width: w * 0.43,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: h * 0.02,
                      width: w * 0.3,
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
                  children: [
                    Container(
                      height: h * 0.045,
                      width: w * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      height: h * 0.045,
                      width: w * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(
                      width: w * 0.02,
                    ),
                    Container(
                      height: h * 0.045,
                      width: w * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: w * 0.05,
            ),
            child: Container(
              height: h * 0.06,
              width: w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
            ),
          ),
          SizedBox(
            height: h * 0.05,
          ),
        ],
      ),
    );
  }
}
