import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/business_prof/admin_panel/admin_panel.dart';
import 'package:rentworthy/presentation/shimmers/post_ur_ad.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';

import '../../../application/dialog/dialog_service.dart';
import '../../../application/validate/validate.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_appbar.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_dropdown_multiselect.dart';
import '../../../utils/common_components/common_gridview.dart';
import '../../../utils/common_components/common_loader.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/dropdown/src/properties/clear_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_decorator_props.dart';
import '../../../utils/common_components/gradient_track_shape.dart';
import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../../indi_prof/error/error_screen.dart';
import '../../indi_prof/sell/product_availablity/product_availablity_screen.dart';
import '../../shimmers/category_details_shimmer.dart';
import 'business_post_ur_ad_controller.dart';

class BusinessPostUrAd extends ConsumerStatefulWidget {
  const BusinessPostUrAd({super.key});

  @override
  ConsumerState createState() => _BusinessPostUrAdState();
}

class _BusinessPostUrAdState extends ConsumerState<BusinessPostUrAd> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(businessPostAdControllerProvider);
    controller() => ref.read(businessPostAdControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        backgroundColor: AppColors.white,
        centerTitle: false,
        leadingicon: false,
        leadicon: CommonIconButton(
                containerwidth: w * 0.1,
                containerheight: h * 0.08,
                backgroundColor: AppColors.white,
                shape: LinearBorder.none,
                centericon: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.close,
                      size: h * 0.035,
                    ),
                  ],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  // commonNavigator(
                  //   context: context,
                  //   child: const AdminPanel(),
                  //   type: PageTransitionType.rightToLeftWithFade,
                  // );
                })
            .animate()
            .fadeIn(duration: 30.ms)
            .then(delay: 20.ms)
            .slideX(
                begin: 2,
                end: 0,
                curve: Curves.easeInOutCubic,
                duration: 400.ms),
        centerwidget: CommonText(
                text: AppText.postUrAd,
                style: ptSansTextStyle(
                    color: AppColors.black,
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.w600))
            .animate()
            .fadeIn(duration: 30.ms)
            .then(delay: 20.ms)
            .slideX(
                begin: 2,
                end: 0,
                curve: Curves.easeInOutCubic,
                duration: 400.ms),
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return CommonLoader();
            }
            return SingleChildScrollView(
              child: Column(
                children: [
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 1,
                  )
                      .animate()
                      .fadeIn(duration: 100.ms)
                      .then(delay: 100.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 500.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                                text: AppText.includeSomeDet,
                                style: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w600))
                            .animate()
                            .fadeIn(duration: 150.ms)
                            .then(delay: 150.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 600.ms),
                        TextInputField(
                                hintText: "",
                                titleText: "Brand*",
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                underlinecolor:
                                    AppColors.black.withOpacity(0.6),
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
                                errorText: controller().isSubmit == true
                                    ? validate(
                                        controller().itemnameController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(
                                        controller().itemnameController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().itemnameController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.4)),
                                containerheight: h * 0.06,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none)
                            .animate()
                            .fadeIn(duration: 170.ms)
                            .then(delay: 170.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 630.ms),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: h * 0.01),
                              child: CommonText(
                                  text: "Categories*",
                                  style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      fontSize: h * 0.021,
                                      fontWeight: FontWeight.w500)),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColors.black.withOpacity(0.4),
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(4)),
                              child: CommonMultiSelectDrop(
                                dropdownselecttitle: "Select Category",
                                items: controller().catList,
                                selectedItems: controller().selectCat,
                                dropdownDecoratorProps: DropDownDecoratorProps(
                                    textAlignVertical: TextAlignVertical.bottom,
                                    dropdownSearchDecoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: "Select Category",
                                      hintStyle: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    baseStyle: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.4),
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w700)),
                                clearButtonProps:
                                    const ClearButtonProps(isVisible: false),
                                dropdownButtonProps: DropdownButtonProps(
                                  focusColor: AppColors.white,
                                  color: AppColors.white,
                                  icon: SizedBox(
                                    height: h * 0.03,
                                    width: h * 0.03,
                                    child: Center(
                                      child: Icon(
                                          Icons.keyboard_arrow_down_sharp,
                                          color: AppColors.black,
                                          size: h * 0.025),
                                    ),
                                  ),
                                ),
                                onChangedsearch: (str) {
                                  print("sdfs $str");
                                  controller().onValSelect(val: str!);
                                },
                                enabled: true,
                                isExpanded: true,
                                containerwidth: w,
                                containerheight: h * 0.07,
                                border: Border.all(
                                  color: AppColors.white,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(8),
                                containercolor: AppColors.white,
                                elevation: 5,
                              ),
                              // child: CommonDropdown(
                              //   selectedItem: controller().selectCat!,
                              //   items: controller().catList,
                              //   dropdownDecoratorProps: DropDownDecoratorProps(
                              //       textAlignVertical: TextAlignVertical.bottom,
                              //       dropdownSearchDecoration: InputDecoration(
                              //         border: InputBorder.none,
                              //         hintText: "Select Category",
                              //         hintStyle: ptSansTextStyle(
                              //             color: AppColors.black.withOpacity(0.4),
                              //             fontSize: h * 0.017,
                              //             fontWeight: FontWeight.w500),
                              //       ),
                              //       baseStyle: ptSansTextStyle(
                              //           color: AppColors.black.withOpacity(0.4),
                              //           fontSize: h * 0.02,
                              //           fontWeight: FontWeight.w700)),
                              //   clearButtonProps:
                              //       const ClearButtonProps(isVisible: false),
                              //   dropdownButtonProps: DropdownButtonProps(
                              //     icon: SizedBox(
                              //       height: h * 0.03,
                              //       width: h * 0.03,
                              //       child: Center(
                              //         child: Icon(Icons.keyboard_arrow_down_sharp,
                              //             color: AppColors.black, size: h * 0.025),
                              //       ),
                              //     ),
                              //   ),
                              //   onChangedsearch: (str) {
                              //     controller().onValSelect(val: str!);
                              //   },
                              //   enabled: true,
                              //   isExpanded: true,
                              //   containerwidth: w,
                              //   containerheight: h * 0.06,
                              //   borderRadius: BorderRadius.circular(8),
                              //   containercolor: AppColors.white,
                              //   elevation: 5,
                              // ),
                            ),
                          ],
                        )
                            .animate()
                            .fadeIn(duration: 190.ms)
                            .then(delay: 190.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 660.ms),
                        Container(
                          height: h * 0.175,
                          child: Stack(
                            children: [
                              TextInputField(
                                  hintText: "",
                                  titleText: AppText.adTitle,
                                  enableunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  disableunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  focusunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  underlinecolor:
                                      AppColors.black.withOpacity(0.6),
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
                                  errorText: controller().isSubmit == true
                                      ? validate(
                                          controller().addtitleController.text)
                                      : null,
                                  onChanged: (value) {
                                    setState(() {
                                      validate(
                                          controller().addtitleController.text);
                                    });
                                  },
                                  errorStyle: ptSansTextStyle(
                                      color: AppColors.red,
                                      fontSize: h * 0.019,
                                      fontWeight: FontWeight.w400),
                                  controller: controller().addtitleController,
                                  keyboardType: TextInputType.text,
                                  isCounter: true,
                                  maxLength: 70,
                                  containerwidth: w,
                                  underline: false,
                                  borderRadius: BorderRadius.circular(4),
                                  containerborder: Border.all(
                                      color: AppColors.black.withOpacity(0.4)),
                                  containerheight: h * 0.06,
                                  containercolor: AppColors.white,
                                  textCapitalization: TextCapitalization.none),
                              Positioned(
                                bottom: 0,
                                right: w * 0.1,
                                left: 0,
                                child: CommonText(
                                    text:
                                        "Mention the key features of your item (e.g. brand, model, age, type)",
                                    maxLines: 2,
                                    style: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.6),
                                        fontSize: h * 0.017,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 210.ms)
                            .then(delay: 210.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 690.ms),
                        Container(
                          height: h * 0.25,
                          child: Stack(
                            children: [
                              TextInputField(
                                  isCounter: true,
                                  maxLines: 10,
                                  center: false,
                                  hintText: "",
                                  titleText: "${AppText.desc}*",
                                  underline: false,
                                  lableText: "",
                                  enableunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  disableunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  focusunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  underlinecolor:
                                      AppColors.black.withOpacity(0.6),
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
                                  errorText: controller().isSubmit == true
                                      ? validate(
                                          controller().descController.text)
                                      : null,
                                  onChanged: (value) {
                                    setState(() {
                                      validate(
                                          controller().descController.text);
                                    });
                                  },
                                  maxLength: 4096,
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
                                  containerheight: h * 0.16,
                                  containercolor: AppColors.white,
                                  textCapitalization: TextCapitalization.none),
                              Positioned(
                                bottom: h * 0.012,
                                right: w * 0.11,
                                left: 0,
                                child: CommonText(
                                    text:
                                        "Include condition, features and reason for renting",
                                    maxLines: 2,
                                    style: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.6),
                                        fontSize: h * 0.017,
                                        fontWeight: FontWeight.w400)),
                              )
                            ],
                          ),
                        )
                            .animate()
                            .fadeIn(duration: 230.ms)
                            .then(delay: 230.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 700.ms),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 1,
                  )
                      .animate()
                      .fadeIn(duration: 260.ms)
                      .then(delay: 260.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 700.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(
                                text: "Set A Quantity",
                                style: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                            .animate()
                            .fadeIn(duration: 290.ms)
                            .then(delay: 290.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 730.ms),
                        TextInputField(
                                hintText: "",
                                titleText: "Maximum",
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                underlinecolor:
                                    AppColors.black.withOpacity(0.6),
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
                                errorText: controller().isSubmit == true
                                    ? validate(
                                        controller().priceController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(controller().priceController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().priceController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                prefix: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.012),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.quora,
                                          size: h * 0.03,
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          thickness: 1.3,
                                          width: w * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.4)),
                                containerheight: h * 0.07,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none)
                            .animate()
                            .fadeIn(duration: 310.ms)
                            .then(delay: 310.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 760.ms),
                        TextInputField(
                                hintText: "",
                                titleText: "Maximum",
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                underlinecolor:
                                    AppColors.black.withOpacity(0.6),
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
                                errorText: controller().isSubmit == true
                                    ? validate(
                                        controller().priceController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(controller().priceController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().priceController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                prefix: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.012),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.quora,
                                          size: h * 0.03,
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          thickness: 1.3,
                                          width: w * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.4)),
                                containerheight: h * 0.07,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none)
                            .animate()
                            .fadeIn(duration: 330.ms)
                            .then(delay: 330.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 790.ms),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(
                                text: AppText.setPrice,
                                style: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w600)),
                          ],
                        )
                            .animate()
                            .fadeIn(duration: 360.ms)
                            .then(delay: 360.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 820.ms),
                        TextInputField(
                                hintText: "",
                                titleText: "Maximum",
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                underlinecolor:
                                    AppColors.black.withOpacity(0.6),
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
                                errorText: controller().isSubmit == true
                                    ? validate(
                                        controller().priceController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(controller().priceController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().priceController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                prefix: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.012),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          size: h * 0.03,
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          thickness: 1.3,
                                          width: w * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.4)),
                                containerheight: h * 0.07,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none)
                            .animate()
                            .fadeIn(duration: 390.ms)
                            .then(delay: 390.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 850.ms),
                        TextInputField(
                                hintText: "",
                                titleText: "Maximum",
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                underlinecolor:
                                    AppColors.black.withOpacity(0.6),
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
                                errorText: controller().isSubmit == true
                                    ? validate(
                                        controller().priceController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(controller().priceController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().priceController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                prefix: IntrinsicHeight(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: w * 0.012),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.attach_money,
                                          size: h * 0.03,
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          thickness: 1.3,
                                          width: w * 0.02,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.4)),
                                containerheight: h * 0.07,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none)
                            .animate()
                            .fadeIn(duration: 420.ms)
                            .then(delay: 420.ms)
                            .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 880.ms),
                      ],
                    ),
                  ),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 1,
                  )
                      .animate()
                      .fadeIn(duration: 450.ms)
                      .then(delay: 450.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 910.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: h * 0.015),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CommonText(
                                      text: "Upload Up To 12 Photos",
                                      style: ptSansTextStyle(
                                          color: AppColors.black,
                                          fontSize: h * 0.025,
                                          fontWeight: FontWeight.w600)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        CommonGridView(
                            itemCount: 6,
                            scrollDirection: Axis.vertical,
                            shrinkWrap: false,
                            padding: EdgeInsets.symmetric(horizontal: w * 0.01),
                            childAspectRatio: 0.5,
                            crossAxisSpacing: w * 0.05,
                            mainAxisSpacing: h * 0.02,
                            crossAxisCount: 2,
                            maxCrossAxisExtent: w * 0.5,
                            mainAxisExtent: h * 0.12,
                            width: w,
                            height: h * 0.42,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: () {
                                  ref
                                      .read(dialogServiceProvider)
                                      .commonImagePicker(
                                        picker: controller().imagePicker,
                                        pickedImage: (file) {
                                          controller().onImgSelect(
                                              val: file, index: index);
                                        },
                                      );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.05,
                                      vertical: h * 0.014),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: AppColors.white,
                                      border: Border.all(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          width: 2)),
                                  child: controller()
                                              .selectedImage[index]
                                              .path ==
                                          ""
                                      ? Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Icon(
                                              Icons.add_a_photo,
                                              color: AppColors.black
                                                  .withOpacity(0.4),
                                              size: h * 0.04,
                                            ),
                                            CommonText(
                                                text: "Add Photo",
                                                textAlign: TextAlign.center,
                                                style: ptSansTextStyle(
                                                  color: AppColors.black
                                                      .withOpacity(0.4),
                                                  fontSize: h * 0.015,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.w600,
                                                )),
                                          ],
                                        )
                                      : Image.file(
                                          controller().selectedImage[index]),
                                ),
                              );
                            }),
                        Row(
                          children: [
                            CommonText(
                                text: "This field is mandatory",
                                style: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.015,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 480.ms)
                      .then(delay: 480.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1100.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.025,
                    thickness: 1,
                  )
                      .animate()
                      .fadeIn(duration: 510.ms)
                      .then(delay: 510.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1200.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.035),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CommonText(
                                text: "Confirm your location",
                                style: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                        TextInputField(
                            hintText: "",
                            titleText: AppText.state,
                            enableunderlinecolor:
                                AppColors.black.withOpacity(0.6),
                            disableunderlinecolor:
                                AppColors.black.withOpacity(0.6),
                            focusunderlinecolor:
                                AppColors.black.withOpacity(0.6),
                            underlinecolor: AppColors.black.withOpacity(0.6),
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
                            errorText: controller().isSubmit == true
                                ? validate(controller().stateController.text)
                                : null,
                            onChanged: (value) {
                              setState(() {
                                validate(controller().stateController.text);
                              });
                            },
                            errorStyle: ptSansTextStyle(
                                color: AppColors.red,
                                fontSize: h * 0.019,
                                fontWeight: FontWeight.w400),
                            controller: controller().stateController,
                            keyboardType: TextInputType.text,
                            containerwidth: w,
                            underline: false,
                            borderRadius: BorderRadius.circular(4),
                            containerborder: Border.all(
                                color: AppColors.black.withOpacity(0.4)),
                            containerheight: h * 0.06,
                            containercolor: AppColors.white,
                            textCapitalization: TextCapitalization.none),
                        Row(
                          children: [
                            CommonText(
                                text: "This field is mandatory",
                                style: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.015,
                                    fontWeight: FontWeight.w500)),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 540.ms)
                      .then(delay: 540.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1300.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.025,
                    thickness: 1,
                  )
                      .animate()
                      .fadeIn(duration: 550.ms)
                      .then(delay: 550.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1400.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.035, vertical: h * 0.01),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(1000),
                              child: Image.asset(
                                AppImg.homeList,
                                height: h * 0.085,
                                width: h * 0.085,
                                fit: BoxFit.cover,
                              ),
                            ),
                            TextInputField(
                                hintText: "",
                                titleText: AppText.adTitle,
                                enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                underlinecolor:
                                    AppColors.black.withOpacity(0.6),
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
                                errorText: controller().isSubmit == true
                                    ? validate(controller()
                                        .addtitlelastController
                                        .text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(controller()
                                        .addtitlelastController
                                        .text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().addtitlelastController,
                                keyboardType: TextInputType.text,
                                containerwidth: w * 0.7,
                                underline: false,
                                isCounter: true,
                                maxLength: 30,
                                borderRadius: BorderRadius.circular(4),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.4)),
                                containerheight: h * 0.06,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                                text: "Your Phone Number",
                                style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.02,
                                    fontWeight: FontWeight.w600)),
                            CommonText(
                                text: "+910987654321",
                                style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.02,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .then(delay: 600.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1500.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.035,
                    thickness: 1,
                  )
                      .animate()
                      .fadeIn(duration: 650.ms)
                      .then(delay: 650.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1600.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: h * 0.02, horizontal: w * 0.035),
                    child: CommonButton(
                        containerwidth: w,
                        containerheight: h * 0.06,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.006),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary
                                ])),
                        backgroundColor: AppColors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(h * 0.006),
                        ),
                        text: AppText.next,
                        textStyle: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w700),
                        onPressed: () {
                          controller().onNext();
                        }),
                  )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .then(delay: 700.ms)
                      .slideX(
                          begin: 2,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 1700.ms),
                ],
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
