import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum SampleItem { itemOne, itemTwo, itemThree }

class CommonPopup extends ConsumerWidget {
  void Function(void)? onSelected;

  List<PopupMenuEntry<Object?>> Function(BuildContext) itemBuilder;

  CommonPopup({super.key, required this.onSelected, required this.itemBuilder});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Center(
        child: PopupMenuButton(
      onSelected: (value) {},
      itemBuilder: itemBuilder,
    )

        // PopupMenuButton<void>(
        //   initialValue: selectedMenu,
        //   // Callback that sets the selected popup menu item.
        //   onSelected: (item) {
        //     onSelected(item);
        //   },
        //   itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        //     PopupMenuItem<SampleItem>(
        //       value: SampleItem.itemOne,
        //       child: Row(
        //         children: [
        //           Icon(Icons.star_border_outlined,
        //               color: AppColors.white, size: w * 0.035),
        //           CommonText(
        //               text: AppText.addtofavorite,
        //               style: ptSansTextStyle(
        //                 color: AppColors.black.withOpacity(0.4),
        //                 fontSize: h * 0.025,
        //                 fontWeight: FontWeight.w500,
        //               )),
        //         ],
        //       ),
        //     ),
        //     PopupMenuItem<SampleItem>(
        //       value: SampleItem.itemTwo,
        //       child: Row(
        //         children: [
        //           Icon(Icons.share_outlined,
        //               color: AppColors.white, size: w * 0.035),
        //           CommonText(
        //               text: AppText.share,
        //               style: ptSansTextStyle(
        //                 color: AppColors.black.withOpacity(0.4),
        //                 fontSize: h * 0.025,
        //                 fontWeight: FontWeight.w500,
        //               )),
        //         ],
        //       ),
        //     ),
        //     PopupMenuItem<SampleItem>(
        //       value: SampleItem.itemThree,
        //       child: Row(
        //         children: [
        //           Icon(Icons.block_flipped,
        //               color: AppColors.white, size: w * 0.035),
        //           CommonText(
        //               text: AppText.reportthisad,
        //               style: ptSansTextStyle(
        //                 color: AppColors.black.withOpacity(0.4),
        //                 fontSize: h * 0.025,
        //                 fontWeight: FontWeight.w500,
        //               )),
        //         ],
        //       ),
        //     ),
        //   ],
        // ),
        );
  }
}
