import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/back_gradient.dart';
import 'package:rentworthy/utils/common_components/rent_lend_enjoy_icon.dart';

import '../../../utils/color.dart';

import 'loading_screen_controller.dart';

class LoadingScreen extends ConsumerWidget {
  const LoadingScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(loadingScreenControllerProvider);
    controller() => ref.read(loadingScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.colorPrimary,
      body: Container(
        width: w,
        height: h,
        color: AppColors.white,
        child: Stack(
          children: [
            const Positioned(
                left: 0, right: 0, top: 0, bottom: 0, child: BackGradient()),
            Positioned(
                top: h * 0.45,
                bottom: h * 0.4,
                left: w * 0.1,
                right: w * 0.1,
                child: const RentLendEnjoyIcon()),
          ],
        ),
      ),
    );
  }
}
