import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';

class AllSubMeeting extends ConsumerWidget {
  const AllSubMeeting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: h * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(AppImg.nochat,
              height: h * 0.3, width: w * 0.6, fit: BoxFit.cover),
          CommonText(
              text: AppText.nochat,
              style: ptSansTextStyle(
                  color: AppColors.black.withOpacity(0.4),
                  fontSize: h * 0.02,
                  fontWeight: FontWeight.w400))
        ],
      ),
    );
  }
}
