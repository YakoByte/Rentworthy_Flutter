import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';
import 'common_text.dart';

class IconText extends ConsumerWidget {
  String title;
  TextStyle textStyle;

  bool preimg;
  bool? isCenter;
  bool subimg;
  double? preiconsize;
  bool? preshadermask;
  String? preimgname;
  Color? preimgcolor;
  IconData? preicon;
  double? subiconsize;
  bool? subshadermask;
  String? subimgname;
  Color? subimgcolor;
  IconData? subicon;
  TextAlign? textAlign;

  IconText(
      {super.key,
      required this.title,
      required this.textStyle,
      required this.subimg,
      required this.preimg,
      this.subimgcolor,
      this.isCenter,
      this.subshadermask,
      this.subiconsize,
      this.subicon,
      this.textAlign,
      this.subimgname,
      this.preimgcolor,
      this.preshadermask,
      this.preiconsize,
      this.preicon,
      this.preimgname});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: isCenter == false
          ? MainAxisAlignment.start
          : MainAxisAlignment.center,
      children: [
        preimg == true
            ? Padding(
                padding: EdgeInsets.only(right: w * 0.03),
                child: preshadermask == true
                    ? preimgname != null
                        ? ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary,
                                ],
                              ).createShader(bounds);
                            },
                            child: Image.asset(
                              preimgname!,
                              color: preimgcolor,
                              height: preiconsize,
                              width: preiconsize,
                            ),
                          )
                        : ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary,
                                ],
                              ).createShader(bounds);
                            },
                            child: Icon(preicon,
                                color: preimgcolor, size: preiconsize))
                    : preimgname != null
                        ? Image.asset(
                            preimgname!,
                            color: preimgcolor,
                            height: preiconsize,
                            width: preiconsize,
                          )
                        : Icon(preicon, color: preimgcolor, size: preiconsize),
              )
            : SizedBox(),
        CommonText(
            text: title, textAlign: textAlign, maxLines: 1, style: textStyle),
        subimg == true
            ? Padding(
                padding: EdgeInsets.only(left: w * 0.02),
                child: subshadermask == true
                    ? subimgname != null
                        ? ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary,
                                ],
                              ).createShader(bounds);
                            },
                            child: Image.asset(
                              subimgname!,
                              color: subimgcolor,
                              height: subiconsize,
                              width: subiconsize,
                            ),
                          )
                        : ShaderMask(
                            shaderCallback: (Rect bounds) {
                              return const LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary,
                                ],
                              ).createShader(bounds);
                            },
                            child: Icon(subicon,
                                color: subimgcolor, size: subiconsize))
                    : subimgname != null
                        ? Image.asset(
                            subimgname!,
                            color: subimgcolor,
                            height: subiconsize,
                            width: subiconsize,
                          )
                        : Icon(subicon, color: subimgcolor, size: subiconsize),
              )
            : SizedBox(),
      ],
    );
  }
}
