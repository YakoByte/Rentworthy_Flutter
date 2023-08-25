import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/application/onboarding/dialog/dialod_service.dart';
import 'package:rentworthy/utils/common_components/cont_textInput.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import 'contact_us_controller.dart';

class ContactUsScreen extends ConsumerWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(contactUsControllerProvider);
    controller() => ref.read(contactUsControllerProvider.notifier);

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
            text: AppText.contactus,
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
                AppImg.contactus,
                height: h * 0.4,
                width: w,
                fit: BoxFit.contain,
              ),
              CommonText(
                text:
                    "Hello if you are experiencing any problems or would like further information, please fill out the following below and we will get back to you as soon as possible.",
                textAlign: TextAlign.center,
                style: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.8),
                    fontSize: h * 0.017,
                    fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: ContTextInputField(
                  center: true,
                  containerwidth: w * 0.9,
                  containerheight: h * 0.075,
                  titletextstyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w400),
                  hintStyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w400),
                  textstyle: ptSansTextStyle(
                      color: AppColors.black,
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w500),
                  errorStyle: ptSansTextStyle(
                      color: AppColors.red,
                      fontSize: h * 0.021,
                      fontWeight: FontWeight.w400),
                  prefix: const SizedBox.shrink(),
                  textCapitalization: TextCapitalization.none,
                  hintText: AppText.entername,
                  controller: controller().nameController,
                  keyboardType: TextInputType.text,
                  containercolor: AppColors.white,
                  onTap: () {},
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: ContTextInputField(
                  center: true,
                  containerwidth: w * 0.9,
                  containerheight: h * 0.075,
                  titletextstyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w400),
                  hintStyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w400),
                  textstyle: ptSansTextStyle(
                      color: AppColors.black,
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w500),
                  errorStyle: ptSansTextStyle(
                      color: AppColors.red,
                      fontSize: h * 0.021,
                      fontWeight: FontWeight.w400),
                  prefix: const SizedBox.shrink(),
                  textCapitalization: TextCapitalization.none,
                  hintText: AppText.enterphone,
                  controller: controller().phoneController,
                  keyboardType: TextInputType.phone,
                  containercolor: AppColors.white,
                  onTap: () {},
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
                child: ContTextInputField(
                  center: false,
                  containerwidth: w * 0.9,
                  containerheight: h * 0.5,
                  titletextstyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w400),
                  hintStyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.6),
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w400),
                  textstyle: ptSansTextStyle(
                      color: AppColors.black,
                      fontSize: h * 0.019,
                      fontWeight: FontWeight.w500),
                  errorStyle: ptSansTextStyle(
                      color: AppColors.red,
                      fontSize: h * 0.021,
                      fontWeight: FontWeight.w400),
                  prefix: const SizedBox.shrink(),
                  textCapitalization: TextCapitalization.none,
                  hintText: AppText.knowus,
                  controller: controller().descController,
                  keyboardType: TextInputType.text,
                  containercolor: AppColors.white,
                  onTap: () {},
                  onChanged: (val) {},
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: h * 0.01),
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
                    text: AppText.submit,
                    textStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.019,
                        fontWeight: FontWeight.w700),
                    onPressed: () {
                      ref.read(dialogServiceProvider).alertdialog();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
