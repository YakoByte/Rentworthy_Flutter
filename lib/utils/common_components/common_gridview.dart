import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonGridView extends ConsumerWidget {
  int itemCount;
  Axis scrollDirection;
  bool shrinkWrap;
  double width;
  double height;
  EdgeInsetsGeometry? padding;
  int crossAxisCount;
  double mainAxisSpacing = 0.0;
  double crossAxisSpacing = 0.0;
  double childAspectRatio = 1.0;
  double? mainAxisExtent;
  Widget? Function(BuildContext, int) itemBuilder;

  CommonGridView(
      {Key? key,
      required this.itemCount,
      required this.scrollDirection,
      required this.shrinkWrap,
      required this.padding,
      required this.mainAxisExtent,
      required this.childAspectRatio,
      required this.crossAxisSpacing,
      required this.mainAxisSpacing,
      required this.crossAxisCount,
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
      child: GridView.builder(
        itemCount: itemCount,
        scrollDirection: scrollDirection,
        shrinkWrap: shrinkWrap,
        itemBuilder: itemBuilder,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: crossAxisSpacing,
          mainAxisSpacing: mainAxisSpacing,
          childAspectRatio: childAspectRatio,
          mainAxisExtent: mainAxisExtent,
        ),
      ),
    );
  }
}
