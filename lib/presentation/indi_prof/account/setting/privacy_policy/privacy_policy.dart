import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';

class PrivacyPolicy extends ConsumerWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final asyncState = ref.watch(editProfileControllerProvider);
    // controller() => ref.read(editProfileControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        leadingicon: true,
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.white,
        centerTitle: false,
        centerwidget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.02,
          ),
          child: CommonText(
            style: ptSansTextStyle(
                fontSize: w * 0.05,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w700),
            text: AppText.privacyPolicyShort,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04, vertical: h * 0.02),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                AppImg.privacyPolicy,
                height: h * 0.4,
                width: w,
                fit: BoxFit.contain,
              ),
              CommonText(
                text:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna lpa qui officia deserunt mollit anim id est laborum.",
                style: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.8),
                    fontSize: h * 0.018,
                    fontWeight: FontWeight.w500),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
