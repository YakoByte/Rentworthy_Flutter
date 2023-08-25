import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/text_input_field.dart';

import '../color.dart';
import 'common_text.dart';

class CommonSearchBar extends ConsumerWidget {
  TextEditingController searchController;
  void Function(String)? onsearchChanged;
  double containerwidth;
  double containerheight;

  CommonSearchBar(
      {super.key,
      required this.searchController,
      required this.containerwidth,
      required this.containerheight,
      required this.onsearchChanged});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          elevation: 1,
          color: AppColors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
          child: TextInputField(
            hintText: 'Search',
            controller: searchController,
            keyboardType: TextInputType.text,
            containerwidth: containerwidth,
            containerheight: containerheight,
            underline: false,
            containercolor: AppColors.white,
            bordercolor: AppColors.white,
            borderRadius: BorderRadius.circular(50),
            onChanged: (str) {
              onsearchChanged!(str);
            },
            suffixicon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.mic,
                    color: AppColors.gray.withOpacity(0.6), size: h * 0.03),
              ],
            ),
            textCapitalization: TextCapitalization.none,
            textstyle: ptSansTextStyle(
                fontSize: w * 0.04,
                color: AppColors.gray.withOpacity(0.4),
                fontWeight: FontWeight.w700),
            titletextstyle: ptSansTextStyle(
                fontSize: w * 0.04,
                color: AppColors.gray.withOpacity(0.4),
                fontWeight: FontWeight.w700),
            hintStyle: ptSansTextStyle(
                fontSize: w * 0.04,
                color: AppColors.gray.withOpacity(0.4),
                fontWeight: FontWeight.w700),
            errorStyle: ptSansTextStyle(
                fontSize: w * 0.04,
                color: AppColors.gray.withOpacity(0.4),
                fontWeight: FontWeight.w700),
            prefix: Padding(
              padding: EdgeInsets.all(w * 0.03),
              child: Icon(
                Icons.search,
                size: h * 0.03,
                color: AppColors.gray.withOpacity(0.6),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
