import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';

class AdminPanel extends ConsumerWidget {
  const AdminPanel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: CommonText(
            text: AppText.comingsoon,
            style: ptSansTextStyle(
                foreground: Paint()
                  ..shader = const LinearGradient(
                    colors: <Color>[
                      AppColors.colorPrimary,
                      AppColors.colorSecondary
                    ],
                  ).createShader(const Rect.fromLTRB(150, 0, 230, 20)),
                fontSize: h * 0.03,
                fontWeight: FontWeight.w700)),
      ),
    );
  }
}
