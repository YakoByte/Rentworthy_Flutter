import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_text.dart';

class ReceiveMessage extends ConsumerWidget {
  final List item;
  int index;

  ReceiveMessage({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    bool isSelected = false;
    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // setState(() {
        //   isSelected = !isSelected;
        //   widget.isSelected(isSelected);
        // });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .7,
                maxHeight: MediaQuery.of(context).size.height * 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.recmsg,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                  bottomRight: Radius.circular(4),
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(w * 0.03),
                child: ReadMoreText(
                  item[index],
                  trimLines: 20,
                  delimiter: ' ',
                  style: ptSansTextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: size.width * 0.035),
                  colorClickableText: Theme.of(context).primaryColor,
                  trimMode: TrimMode.Line,
                  trimCollapsedText: 'Show more',
                  trimExpandedText: 'Show less',
                  moreStyle: ptSansTextStyle(
                    fontSize: size.width * 0.025,
                    color: Theme.of(context).primaryColor,
                  ),
                  lessStyle: ptSansTextStyle(
                    fontSize: size.width * 0.025,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
