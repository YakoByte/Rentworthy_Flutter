import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonOutlineButton extends ConsumerWidget {
  CommonOutlineButton({
    Key? key,
    required this.containerwidth,
    required this.containerheight,
    required this.backgroundColor,
    required this.shape,
    required this.text,
    required this.textStyle,
    this.prefix,
    this.suffix,
    required this.side,
    required this.onPressed,
  }) : super(key: key);
  double containerwidth;
  double containerheight;
  Color backgroundColor;
  OutlinedBorder shape;
  Widget? prefix;
  Widget? suffix;
  String text;
  BorderSide? side;
  TextStyle textStyle;
  void Function() onPressed;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return SizedBox(
      width: containerwidth,
      height: containerheight,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            backgroundColor: backgroundColor, shape: shape, side: side),
        onPressed: onPressed,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              prefix != null
                  ? Container(
                      width: w * 0.1, height: containerheight, child: prefix!)
                  : const SizedBox.shrink(),
              Container(
                width: prefix != null
                    ? containerwidth > w * 0.4
                        ? containerwidth / 1.5
                        : null
                    : null,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      text,
                      textAlign: TextAlign.center,
                      style: textStyle,
                    ),
                  ],
                ),
              ),
              suffix != null
                  ? Container(height: containerheight, child: suffix!)
                  : const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}
