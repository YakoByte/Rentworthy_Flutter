import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';

class ContactUsAlertDialog extends ConsumerWidget {
  const ContactUsAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return AlertDialog(
      surfaceTintColor: AppColors.white,
      backgroundColor: AppColors.white,
      titlePadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      insetPadding: EdgeInsets.only(
        bottom: h * 0.38,
        top: h * 0.1,
        left: w * 0.1,
        right: w * 0.1,
      ),
      buttonPadding: EdgeInsets.zero,
      actionsPadding: EdgeInsets.zero,
      iconPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
      content: Container(
        width: w,
        height: h * 0.45,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImg.getInTouch,
                height: h * 0.3, width: w * 0.6, fit: BoxFit.cover),
            Padding(
              padding: EdgeInsets.symmetric(vertical: h * 0.01),
              child: CommonText(
                  text: AppText.thankResponse,
                  style: ptSansTextStyle(
                      foreground: Paint()
                        ..shader = const LinearGradient(
                          colors: <Color>[
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ],
                        ).createShader(const Rect.fromLTRB(150, 0, 300, 100)),
                      fontSize: h * 0.022,
                      fontWeight: FontWeight.w600)),
            ),
            CommonText(
                text: AppText.contactUsSoon,
                style: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.8),
                    fontSize: h * 0.02,
                    fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }
}
