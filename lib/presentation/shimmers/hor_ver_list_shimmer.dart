import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';

class HorVerListShimmer extends ConsumerWidget {
  Axis scrollDirection;
  double height;
  double width;
  double contwidth;
  bool isTopPadding;
  double contheight;
  BorderRadiusGeometry? borderRadius;
  List imgList;
  EdgeInsetsGeometry? padding;

  HorVerListShimmer({
    super.key,
    required this.height,
    required this.contheight,
    required this.contwidth,
    required this.isTopPadding,
    this.borderRadius,
    required this.width,
    required this.scrollDirection,
    this.padding,
    required this.imgList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmerGrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: CommonListView(
          itemCount: imgList.length,
          scrollDirection: scrollDirection,
          shrinkWrap: true,
          padding: padding,
          width: width,
          physics: NeverScrollableScrollPhysics(),
          height: height,
          itemBuilder: (context, index) {
            return scrollDirection == Axis.horizontal
                ? Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? w * 0.05 : w * 0.02,
                    ),
                    child: Container(
                      width: contwidth,
                      height: contheight,
                      margin: EdgeInsets.all(
                        w * 0.02,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: borderRadius,
                      ),
                    ),
                  )
                : Padding(
                    padding: EdgeInsets.only(top: h * 0.012),
                    child: Container(
                      width: contwidth,
                      height: contheight,
                      decoration: BoxDecoration(
                          borderRadius: borderRadius, color: AppColors.white),
                    ));
          }),
    );
  }
}
