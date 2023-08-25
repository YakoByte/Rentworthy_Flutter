import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/account/setting/select_lang/select_lang_controller.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';

class SelectLangScreen extends ConsumerWidget {
  const SelectLangScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(selectLanControllerProvider);
    controller() => ref.read(selectLanControllerProvider.notifier);

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
            text: AppText.selectlang,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(
            color: AppColors.black.withOpacity(0.1),
            height: h * 0.03,
            thickness: 1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    controller().onlangTap(val: true);
                  },
                  child: Container(
                    height: h * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CommonText(
                            style: ptSansTextStyle(
                                fontSize: w * 0.05,
                                color: AppColors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                            text: AppText.eng,
                          ),
                        ),
                        if (controller().isEng == true)
                          Icon(
                            Icons.check,
                            color: AppColors.black,
                            size: w * 0.06,
                          )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.black.withOpacity(0.1),
                  height: h * 0.02,
                  thickness: 1,
                ),
                GestureDetector(
                  onTap: () {
                    controller().onlangTap(val: false);
                  },
                  child: Container(
                    height: h * 0.06,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: CommonText(
                            style: ptSansTextStyle(
                                fontSize: w * 0.05,
                                color: AppColors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w500),
                            text: AppText.hindi,
                          ),
                        ),
                        if (controller().isEng == false)
                          Icon(
                            Icons.check,
                            color: AppColors.black,
                            size: w * 0.06,
                          )
                      ],
                    ),
                  ),
                ),
                Divider(
                  color: AppColors.black.withOpacity(0.1),
                  height: h * 0.02,
                  thickness: 1,
                ),
                Padding(
                  padding: EdgeInsets.only(top: h * 0.02),
                  child: CommonButton(
                      containerwidth: w,
                      containerheight: h * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(h * 0.005),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ])),
                      backgroundColor: AppColors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.005),
                      ),
                      text: "${AppText.continueeng} / ${AppText.nexthindi}",
                      textStyle: ptSansTextStyle(
                          color: AppColors.white,
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.w600),
                      onPressed: () {}),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
