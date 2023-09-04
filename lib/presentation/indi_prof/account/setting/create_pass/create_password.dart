import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/common_components/text_input_field.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import 'create_password_controller.dart';

class CreatePassword extends ConsumerWidget {
  const CreatePassword({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(createPasswordControllerProvider);
    controller() => ref.read(createPasswordControllerProvider.notifier);

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
            text: AppText.createpass,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Divider(
            color: AppColors.black.withOpacity(0.1),
            height: h * 0.01,
            thickness: 1,
          ),
          Container(
            height: h * 0.25,
            width: w,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.04),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                    style: ptSansTextStyle(
                        fontSize: h * 0.02,
                        color: AppColors.black.withOpacity(0.9),
                        fontWeight: FontWeight.w500),
                    text: AppText.enternewpass,
                  ),
                  TextInputField(
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
                      hintText: AppText.password,
                      lableText: AppText.newPassword,
                      hintStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      textstyle: ptSansTextStyle(
                          color: AppColors.black,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      lableStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.021,
                          fontWeight: FontWeight.w400),
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      suffixicon: SizedBox(
                        width: h * 0.04,
                        height: h * 0.04,
                        child: Center(
                          child: Image.asset(
                            !controller().iseyehide
                                ? AppImg.eye_hide
                                : AppImg.eye_view,
                            fit: BoxFit.cover,
                            color: AppColors.black.withOpacity(0.6),
                            width: h * 0.032,
                            height: h * 0.032,
                          ),
                        ),
                      ),
                      suffixonTap: () {
                        controller().onEyeTap(
                            val: !controller().iseyehide ? true : false);
                      },
                      maxLines: 1,
                      obscureText: !controller().iseyehide,
                      containerwidth: w,
                      containerheight: h * 0.06,
                      isCounter: false,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                  TextInputField(
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
                      isCounter: false,
                      hintText: AppText.password,
                      lableText: AppText.confirmPassword,
                      hintStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      textstyle: ptSansTextStyle(
                          color: AppColors.black,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      lableStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.021,
                          fontWeight: FontWeight.w400),
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().confirmpasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      suffixicon: SizedBox(
                        width: h * 0.04,
                        height: h * 0.04,
                        child: Center(
                          child: Image.asset(
                            !controller().isconfirmeyehide
                                ? AppImg.eye_hide
                                : AppImg.eye_view,
                            fit: BoxFit.cover,
                            color: AppColors.black.withOpacity(0.6),
                            width: h * 0.032,
                            height: h * 0.032,
                          ),
                        ),
                      ),
                      suffixonTap: () {
                        controller().onconfirmEyeTap(
                            val: !controller().isconfirmeyehide ? true : false);
                      },
                      maxLines: 1,
                      obscureText: !controller().isconfirmeyehide,
                      containerwidth: w,
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                ],
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      bottom: h * 0.06, left: w * 0.04, right: w * 0.04),
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
                      text: AppText.save,
                      textStyle: ptSansTextStyle(
                          color: AppColors.white,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w700),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
