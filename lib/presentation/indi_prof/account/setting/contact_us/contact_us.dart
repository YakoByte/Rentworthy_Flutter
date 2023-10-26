import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../application/dialog/dialog_service.dart';
import '../../../../../application/validate/validate.dart';
import '../../../../../utils/import_utils.dart';
import '../../../../shimmers/contact_us_shimmer.dart';
import '../../../error/error_screen.dart';
import 'contact_us_controller.dart';

class ContactUsScreen extends ConsumerStatefulWidget {
  const ContactUsScreen({super.key});

  @override
  ConsumerState createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends ConsumerState<ContactUsScreen> {
  @override
  Widget build(BuildContext context) {
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
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return CommonLoader();
            }
            return Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.04, vertical: h * 0.02),
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

                    /// Name
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
                        hintText: AppText.enterName,
                        controller: controller().nameController,
                        keyboardType: TextInputType.text,
                        containercolor: AppColors.white,
                        onTap: () {},
                        errorText: controller().issubmit == true
                            ? validate(controller().nameController.text)
                            : null,
                        onChanged: (value) {
                          setState(() {
                            validate(controller().nameController.text);
                          });
                        },
                      ),
                    ),

                    /// Phone
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
                        hintText: AppText.enterPhone,
                        controller: controller().phoneController,
                        keyboardType: TextInputType.phone,
                        containercolor: AppColors.white,
                        onTap: () {},
                        errorText: controller().issubmit == true
                            ? validate(controller().phoneController.text)
                            : null,
                        onChanged: (value) {
                          setState(() {
                            validate(controller().phoneController.text);
                          });
                        },
                      ),
                    ),

                    /// Description
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
                        hintText: AppText.knowUs,
                        controller: controller().descController,
                        keyboardType: TextInputType.text,
                        containercolor: AppColors.white,
                        onTap: () {},
                        errorText: controller().issubmit == true
                            ? validate(controller().descController.text)
                            : null,
                        onChanged: (value) {
                          setState(() {
                            validate(controller().descController.text);
                          });
                        },
                      ),
                    ),

                    /// Submit
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
                            controller().onSubmit();
                          }),
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return CommonLoader();
          }),
    );
  }
}
