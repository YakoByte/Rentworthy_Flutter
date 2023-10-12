import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/import_utils.dart';
import 'hor_ver_list_shimmer.dart';

class ChatShimmer extends ConsumerWidget {
  const ChatShimmer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Shimmer.fromColors(
      baseColor: AppColors.shimmergrey,
      highlightColor: AppColors.white,
      enabled: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.02, vertical: h * 0.02),
        child: HorVerListShimmer(
          height: h * 0.6,
          isTopPadding: true,
          width: w,
          contwidth: w,
          borderRadius: BorderRadius.circular(2),
          contheight: h * 0.11,
          scrollDirection: Axis.vertical,
          imgList: const [
            "",
            "",
            "",
            "",
            "",
            "",
            "",
            "",
          ],
        ),
      ),
    );
  }
}
