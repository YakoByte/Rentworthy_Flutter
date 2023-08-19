import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';

class ChatList extends ConsumerWidget {
  int itemCount;
  double width;
  double height;
  Widget? Function(BuildContext, int) itemBuilder;

  ChatList(
      {super.key,
      required this.itemCount,
      required this.width,
      required this.height,
      required this.itemBuilder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return CommonListView(
        itemCount: itemCount,
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: h * 0.02, horizontal: w * 0.02),
        width: width,
        height: height,
        itemBuilder: itemBuilder);
  }
}
