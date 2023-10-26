import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:readmore/readmore.dart';
import 'package:rentworthy/utils/common_components/common_text.dart';

import '../../../../utils/color.dart';
import '../../../../utils/images.dart';

class SendMessage extends ConsumerWidget {
  final List item;
  int index;

  SendMessage({Key? key, required this.item, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    bool isSelected = false;

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    final size = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        // isSelected = !isSelected;
        // widget.isSelected(isSelected);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * .7,
                maxHeight: MediaQuery.of(context).size.height * 5,
              ),
              decoration: BoxDecoration(
                color: AppColors.sendMsg,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(4),
                  topLeft: Radius.circular(4),
                  bottomLeft: Radius.circular(4),
                ),
              ),
              child: Stack(
                children: [
                  Padding(
                    padding: EdgeInsets.only(right: w * 0.02),
                    child: Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width * .7,
                        maxHeight: MediaQuery.of(context).size.height * 5,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4),
                          topLeft: Radius.circular(4),
                          bottomLeft: Radius.circular(4),
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: w * 0.21,
                            top: h * 0.01,
                            bottom: h * 0.02,
                            left: w * 0.021),
                        child: ReadMoreText(
                          item[index],
                          trimLines: 20,
                          delimiter: ' ',
                          style: ptSansTextStyle(
                              fontWeight: FontWeight.normal,
                              color: AppColors.black.withOpacity(0.8),
                              overflow: TextOverflow.ellipsis,
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
                  ),
                  Positioned(
                    bottom: h * 0.005,
                    right: w * 0.02,
                    child: Container(
                      width: w * 0.19,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CommonText(
                              text: "02:00 PM",
                              textAlign: TextAlign.end,
                              style: ptSansTextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: size.width * 0.035)),
                          Image.asset(
                            AppImg.checkAll,
                            height: w * 0.04,
                            width: w * 0.04,
                            color: AppColors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
