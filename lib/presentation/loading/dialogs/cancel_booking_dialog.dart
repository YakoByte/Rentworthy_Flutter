import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/text.dart';

class CancelBookingDialog extends ConsumerWidget {
  String groupValue;
  void Function(String) onChangedval;

  CancelBookingDialog(
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
        bottom: h * 0.28,
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
              text: AppText.reasoncancel,
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
        height: h * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: CommonText(
                  text: AppText.nolongneed,
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w500)),
              leading: Radio(
                value: AppText.nolongneed,
                groupValue: groupValue,
                onChanged: (value) {
                  onChangedval!(value!);
                },
              ),
            ),
            ListTile(
              title: CommonText(
                  text: AppText.norental,
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w500)),
              leading: Radio(
                value: AppText.norental,
                groupValue: groupValue,
                onChanged: (value) {
                  onChangedval!(value!);
                },
              ),
            ),
            ListTile(
              title: CommonText(
                  text: AppText.nolongwork,
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w500)),
              leading: Radio(
                value: AppText.nolongwork,
                groupValue: groupValue,
                onChanged: (value) {
                  onChangedval!(value!);
                },
              ),
            ),
            ListTile(
              title: CommonText(
                  text: AppText.givetextbox,
                  style: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.8),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w500)),
              leading: Radio(
                value: AppText.givetextbox,
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
