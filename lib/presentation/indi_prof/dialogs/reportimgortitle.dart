import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';

class ReportImgTitleDialog extends ConsumerWidget {
  int groupValue;
  void Function(int) onChangedval;

  ReportImgTitleDialog(
      {super.key, required this.groupValue, required this.onChangedval});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      titlePadding:
          EdgeInsets.symmetric(vertical: h * 0.022, horizontal: w * 0.055),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: EdgeInsets.only(
        bottom: h * 0.3,
        top: h * 0.1,
        left: w * 0.1,
        right: w * 0.1,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonText(
              text: "Report Image or title",
              style: ptSansTextStyle(
                  color: AppColors.black.withOpacity(0.8),
                  fontSize: h * 0.022,
                  fontWeight: FontWeight.w700)),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.close,
                color: AppColors.black.withOpacity(0.8), size: h * 0.024),
          )
        ],
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content: Container(
        width: w,
        height: h * 0.32,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: CommonText(
                  text: "Violent or repulsive",
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w600)),
              leading: Radio(
                value: 1,
                groupValue: groupValue,
                onChanged: (value) {
                  onChangedval!(value!);
                },
              ),
            ),
            ListTile(
              title: CommonText(
                  text: "Hateful or abusive",
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w600)),
              leading: Radio(
                value: 2,
                groupValue: groupValue,
                onChanged: (value) {
                  onChangedval!(value!);
                },
              ),
            ),
            ListTile(
              title: CommonText(
                  text: "Harmful or dangerous",
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w600)),
              leading: Radio(
                value: 3,
                groupValue: groupValue,
                onChanged: (value) {
                  onChangedval!(value!);
                },
              ),
            ),
            ListTile(
              title: CommonText(
                  text: "Spam or misleading",
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w600)),
              leading: Radio(
                value: 4,
                groupValue: groupValue,
                onChanged: (value) {
                  onChangedval!(value!);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
