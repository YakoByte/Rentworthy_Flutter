import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';
import '../text.dart';
import 'common_text.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class CommonPopup extends ConsumerWidget {
  const CommonPopup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    SampleItem? selectedMenu;
    return Center(
      child: PopupMenuButton<SampleItem>(
        initialValue: selectedMenu,
        // Callback that sets the selected popup menu item.
        onSelected: (SampleItem item) {
          selectedMenu = item;
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemOne,
            child: Row(
              children: [
                Icon(Icons.star_border_outlined,
                    color: AppColors.white, size: w * 0.035),
                CommonText(
                    text: AppText.addtofavorite,
                    style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.4),
                      fontSize: h * 0.025,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemTwo,
            child: Row(
              children: [
                Icon(Icons.share_outlined,
                    color: AppColors.white, size: w * 0.035),
                CommonText(
                    text: AppText.share,
                    style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.4),
                      fontSize: h * 0.025,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
          PopupMenuItem<SampleItem>(
            value: SampleItem.itemThree,
            child: Row(
              children: [
                Icon(Icons.block_flipped,
                    color: AppColors.white, size: w * 0.035),
                CommonText(
                    text: AppText.reportthisad,
                    style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.4),
                      fontSize: h * 0.025,
                      fontWeight: FontWeight.w500,
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
