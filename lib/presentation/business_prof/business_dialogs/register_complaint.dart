import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/text.dart';
import '../business_category_details/business_category_details_screen_controller.dart';

class RegisterComplaintDialog extends ConsumerStatefulWidget {
// = TextEditingController(text: "0");
  RegisterComplaintDialog({
    super.key,
  });

  @override
  ConsumerState createState() => _RegisterComplaintDialogState();
}

class _RegisterComplaintDialogState
    extends ConsumerState<RegisterComplaintDialog> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(businessCatDetailsControllerProvider);
    controller() => ref.read(businessCatDetailsControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    // return SizedBox();
    return StatefulBuilder(
      builder: (context, setState1) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          titlePadding: EdgeInsets.only(
            left: w * 0.055,
            right: w * 0.055,
            top: h * 0.02,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
          insetPadding: EdgeInsets.only(
            left: w * 0.03,
            right: w * 0.03,
            top: h * 0.02,
            bottom: h * 0.2,
          ),
          contentPadding: EdgeInsets.only(
              left: w * 0.05, right: w * 0.05, bottom: h * 0.04, top: h * 0.02),
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CommonText(
                      text: "Register a complaint",
                      style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700)),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(Icons.close,
                        color: AppColors.black.withOpacity(0.8),
                        size: h * 0.024),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.01),
                child: CommonText(
                    text: "Lorem ipsum Lorem ipsumLorem ipsum",
                    style: ptSansTextStyle(
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: <Color>[
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ],
                          ).createShader(const Rect.fromLTRB(110, 0, 350, 100)),
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w700)),
              ),
            ],
          ),
          content: Container(
            height: h * 0.8,
            color: AppColors.white,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.02),
                        child: Container(
                          height: h * 0.2,
                          width: h * 0.2,
                          decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(AppImg.uploadimg,
                                  height: h * 0.04, width: h * 0.04),
                              Padding(
                                padding: EdgeInsets.only(top: h * 0.01),
                                child: CommonText(
                                    text: "Upload Image",
                                    style: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.8),
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w600)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      TextInputField(
                          isCounter: true,
                          maxLines: 14,
                          center: true,
                          hintText: "What is the problem?",
                          underline: false,
                          lableText: "",
                          hintStyle: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w400),
                          textstyle: ptSansTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w500),
                          titletextstyle: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              fontSize: h * 0.021,
                              fontWeight: FontWeight.w500),
                          errorText: "",
                          maxLength: 60,
                          onChanged: (value) {
                            setState(() {});
                          },
                          errorStyle: ptSansTextStyle(
                              color: AppColors.red,
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w400),
                          controller: controller().descController,
                          keyboardType: TextInputType.text,
                          containerwidth: w,
                          borderRadius: BorderRadius.circular(4),
                          containerborder: Border.all(
                              color: AppColors.black.withOpacity(0.4)),
                          containerheight: h * 0.25,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.02),
                    child: CommonButton(
                        containerwidth: w,
                        containerheight: h * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary
                                ])),
                        backgroundColor: AppColors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(45),
                        ),
                        text: AppText.submit,
                        textStyle: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w700),
                        onPressed: () {}),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
