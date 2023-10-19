import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../color.dart';

class CommonLoader extends ConsumerWidget {
  double? height;
  double? width;
  Color? color;
  Color? loadercolor;

  CommonLoader(
      {Key? key, this.height, this.width, this.color, this.loadercolor})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Center(
      child: Container(
        height: height ?? h,
        width: width ?? w,
        color: color ?? AppColors.white,
        child: ShaderMask(
          shaderCallback: (Rect bounds) {
            return const LinearGradient(
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                    colors: [AppColors.colorPrimary, AppColors.colorSecondary])
                .createShader(const Rect.fromLTRB(150, 50, 250, 100));
          },
          child: Center(
              child: SpinKitSpinningLines(
            color: AppColors.white,
            size: height ?? h * 0.1,
            lineWidth: w * 0.015,
            duration: const Duration(seconds: 2),
            itemCount: 5,
          )),
        ),
      ),
    );
  }
}
