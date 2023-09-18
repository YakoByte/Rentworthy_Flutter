import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/text.dart';
import '../account/setting/contact_us/contact_us_controller.dart';

class RentScreeningDialog extends ConsumerStatefulWidget {
// = TextEditingController(text: "0");
  RentScreeningDialog({
    super.key,
  });

  @override
  ConsumerState createState() => _RentScreeningDialogState();
}

class _RentScreeningDialogState extends ConsumerState<RentScreeningDialog> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(contactUsControllerProvider);
    controller() => ref.read(contactUsControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
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
            top: h * 0.005,
            bottom: h * 0.005,
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
                      text: AppText.prerent,
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
                    text: AppText.verifystatus,
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
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                      text: AppText.cosmeticissue,
                      style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        //  color: AppColors.red,
                        width: w * 0.3,
                        child: ListTile(
                          dense: true,
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          title: CommonText(
                              text: "Yes",
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w500)),
                          leading: Radio(
                            value: 1,
                            groupValue: controller().selectedcosmetic,
                            onChanged: (value) {
                              setState(() {
                                setState1(() {
                                  controller().oncosmeticval!(value!);
                                });
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: w * 0.2,
                        child: ListTile(
                          dense: true,
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          title: CommonText(
                              text: "No",
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w500)),
                          leading: Radio(
                            value: 2,
                            groupValue: controller().selectedcosmetic,
                            onChanged: (value) {
                              setState(() {
                                setState1(() {
                                  controller().oncosmeticval!(value!);
                                });
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextInputField(
                      hintText: AppText.aestheticprob,
                      lableText: AppText.aestheticprob,
                      maxLength: 60,
                      isCounter: true,
                      onChanged: (value) {
                        setState(() {});
                        setState1(() {});
                      },
                      counterStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.018,
                          fontWeight: FontWeight.w500),
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
                      underlinecolor: AppColors.black.withOpacity(0.6),
                      hintStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      textstyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      lableStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().cosmeticcontroller,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                  Row(
                    children: [
                      IconText(
                        title: AppText.uploadimg,
                        textStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.8),
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w600),
                        subimg: false,
                        preimg: true,
                        preimgname: AppImg.uploadimg,
                        preiconsize: h * 0.025,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                      text: AppText.itemwork,
                      style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w * 0.3,
                        child: ListTile(
                          dense: true,
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          title: CommonText(
                              text: "Yes",
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w500)),
                          leading: Radio(
                            value: 1,
                            groupValue: controller().selecteditemwork,
                            onChanged: (value) {
                              setState(() {
                                setState1(() {
                                  controller().onitemworksval!(value!);
                                });
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: w * 0.2,
                        child: ListTile(
                          dense: true,
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          title: CommonText(
                              text: "No",
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w500)),
                          leading: Radio(
                            value: 2,
                            groupValue: controller().selecteditemwork,
                            onChanged: (value) {
                              setState(() {
                                setState1(() {
                                  controller().onitemworksval!(value!);
                                });
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextInputField(
                      hintText: AppText.whatsprob,
                      lableText: AppText.whatsprob,
                      maxLength: 60,
                      isCounter: true,
                      onChanged: (value) {
                        setState(() {});
                        setState1(() {});
                      },
                      counterStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.018,
                          fontWeight: FontWeight.w500),
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
                      underlinecolor: AppColors.black.withOpacity(0.6),
                      hintStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      textstyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      lableStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().itemworkscontroller,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                  Row(
                    children: [
                      IconText(
                        title: AppText.uploadimg,
                        textStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.8),
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w600),
                        subimg: false,
                        preimg: true,
                        preimgname: AppImg.uploadimg,
                        preiconsize: h * 0.025,
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                      text: AppText.missingpart,
                      style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: w * 0.3,
                        child: ListTile(
                          dense: true,
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          title: CommonText(
                              text: "Yes",
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w500)),
                          leading: Radio(
                            value: 1,
                            groupValue: controller().selectedmssing,
                            onChanged: (value) {
                              setState(() {
                                setState1(() {
                                  controller().onmissingval!(value!);
                                });
                              });
                            },
                          ),
                        ),
                      ),
                      Container(
                        width: w * 0.2,
                        child: ListTile(
                          dense: true,
                          horizontalTitleGap: 0,
                          contentPadding: EdgeInsets.zero,
                          title: CommonText(
                              text: "No",
                              style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.8),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w500)),
                          leading: Radio(
                            value: 2,
                            groupValue: controller().selectedmssing,
                            onChanged: (value) {
                              setState(() {
                                setState1(() {
                                  controller().onmissingval!(value!);
                                });
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  TextInputField(
                      hintText: AppText.whatmissingpart,
                      lableText: AppText.whatmissingpart,
                      maxLength: 60,
                      isCounter: true,
                      onChanged: (value) {
                        setState(() {});
                        setState1(() {});
                      },
                      counterStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.018,
                          fontWeight: FontWeight.w500),
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
                      underlinecolor: AppColors.black.withOpacity(0.6),
                      hintStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      textstyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w500),
                      lableStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().missingcontroller,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                  Row(
                    children: [
                      IconText(
                        title: AppText.uploadimg,
                        textStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.8),
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w600),
                        subimg: false,
                        preimg: true,
                        preimgname: AppImg.uploadimg,
                        preiconsize: h * 0.025,
                      ),
                    ],
                  ),
                ],
              ),
              CommonButton(
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
            ],
          ),
        );
      },
    );
  }
}
