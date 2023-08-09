import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonListView extends ConsumerWidget {
  int itemCount;
  Axis scrollDirection;
  bool shrinkWrap;
  double width;
  double height;
  EdgeInsetsGeometry? padding;
  Widget? Function(BuildContext, int) itemBuilder;

  CommonListView(
      {Key? key,
      required this.itemCount,
      required this.scrollDirection,
      required this.shrinkWrap,
      required this.padding,
      required this.width,
      required this.height,
      required this.itemBuilder})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      child: ListView.builder(
          itemCount: itemCount,
          scrollDirection: scrollDirection,
          shrinkWrap: shrinkWrap,
          itemBuilder: itemBuilder),
    );
  }
}
