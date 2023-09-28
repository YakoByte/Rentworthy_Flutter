import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/application/dialog/dialod_service.dart';
import 'package:rentworthy/presentation/indi_prof/sell/post_add/post_ur_ad_controller.dart';
import 'package:rentworthy/utils/common_components/common_gridview.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_dropdown.dart';
import '../../../../utils/common_components/common_dropdown_multiselect.dart';
import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/dropdown/dropdown_search.dart';
import '../../../../utils/common_components/gradient_track_shape.dart';
import '../../../../utils/common_components/text_input_field.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../product_availablity/product_availablity_screen.dart';

class PostUrAds extends ConsumerStatefulWidget {
  String type;

  PostUrAds({super.key, required this.type});

  @override
  ConsumerState createState() => _PostUrAdsState();
}

class _PostUrAdsState extends ConsumerState<PostUrAds> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(postUrAdsControllerProvider);
    controller() => ref.read(postUrAdsControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        backgroundColor: AppColors.white,
        centerTitle: false,
        leadingicon: true,
        centerwidget: CommonText(
            text: AppText.posturad,
            style: ptSansTextStyle(
                color: AppColors.black,
                fontSize: h * 0.025,
                fontWeight: FontWeight.w600)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.01,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.035),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonText(
                      text: AppText.includesomedet,
                      style: ptSansTextStyle(
                          color: AppColors.black,
                          fontSize: h * 0.025,
                          fontWeight: FontWeight.w600)),
                  Container(
                    height: h * 0.175,
                    child: Stack(
                      children: [
                        TextInputField(
                            hintText: "",
                            titleText: AppText.adtitle,
                            onChanged: (value) {
                              setState(() {});
                            },
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
                            errorText: "",
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
                  ),
                  // TextInputField(
                  //     hintText: "",
                  //     titleText: AppText.itemname,
                  //     onChanged: (value) {
                  //       setState(() {});
                  //     },
                  //     enableunderlinecolor: AppColors.black.withOpacity(0.6),
                  //     disableunderlinecolor: AppColors.black.withOpacity(0.6),
                  //     focusunderlinecolor: AppColors.black.withOpacity(0.6),
                  //     underlinecolor: AppColors.black.withOpacity(0.6),
                  //     hintStyle: ptSansTextStyle(
                  //         color: AppColors.black.withOpacity(0.6),
                  //         fontSize: h * 0.019,
                  //         fontWeight: FontWeight.w400),
                  //     textstyle: ptSansTextStyle(
                  //         color: AppColors.black,
                  //         fontSize: h * 0.019,
                  //         fontWeight: FontWeight.w500),
                  //     titletextstyle: ptSansTextStyle(
                  //         color: AppColors.black.withOpacity(0.6),
                  //         fontSize: h * 0.021,
                  //         fontWeight: FontWeight.w500),
                  //     errorText: "",
                  //     errorStyle: ptSansTextStyle(
                  //         color: AppColors.red,
                  //         fontSize: h * 0.019,
                  //         fontWeight: FontWeight.w400),
                  //     controller: controller().itemnameController,
                  //     keyboardType: TextInputType.text,
                  //     containerwidth: w,
                  //     underline: false,
                  //     borderRadius: BorderRadius.circular(4),
                  //     containerborder:
                  //         Border.all(color: AppColors.black.withOpacity(0.4)),
                  //     containerheight: h * 0.06,
                  //     containercolor: AppColors.white,
                  //     textCapitalization: TextCapitalization.none),
                  TextInputField(
                      hintText: "",
                      titleText: AppText.brand,
                      onChanged: (value) {
                        setState(() {});
                      },
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
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
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().subcatController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.4)),
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
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
                          dropdowntitle: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: w * 0.85,
                                    height: h * 0.035,
                                    color: AppColors.white,
                                    child: SliderTheme(
                                        data: SliderThemeData(
                                          trackHeight: h * 0.013,
                                          thumbShape:
                                              GradientRectSliderThumbShape(
                                                  disabledThumbRadius:
                                                      h * 0.014,
                                                  enabledThumbRadius:
                                                      h * 0.014),
                                          trackShape:
                                              const GradientRectSliderTrackShape(
                                                  gradient: LinearGradient(
                                                    colors: <Color>[
                                                      AppColors.colorPrimary,
                                                      AppColors.colorSecondary
                                                    ],
                                                  ),
                                                  darkenInactive: true),
                                        ),
                                        child: Slider(
                                          min: 0,
                                          max: 100,
                                          inactiveColor:
                                              AppColors.black.withOpacity(0.2),
                                          thumbColor: AppColors.white,
                                          value: 50.0,
                                          onChanged: (double value) {},
                                        )),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    vertical: h * 0.015, horizontal: w * 0.025),
                                child: Row(
                                  children: [
                                    CommonText(
                                      text: "Price: \u{20B9}0 - \u{20B9}5,000 ",
                                      style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          items: controller().catList,
                          selectedItems: controller().selectCat,
                          dropdownDecoratorProps: DropDownDecoratorProps(
                              textAlignVertical: TextAlignVertical.bottom,
                              dropdownSearchDecoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Select Category",
                                hintStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
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
                                child: Icon(Icons.keyboard_arrow_down_sharp,
                                    color: AppColors.black, size: h * 0.025),
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
                          containerheight: h * 0.06,
                          border: Border.all(
                            color: AppColors.black.withOpacity(0.2),
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
                  ),
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
                            errorText: "",
                            maxLength: 4096,
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
                  ),
                ],
              ),
            ),
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.01,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.035),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonText(
                          text: AppText.setprice,
                          style: ptSansTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.025,
                              fontWeight: FontWeight.w600)),
                      Icon(Icons.help_outline_rounded,
                          color: AppColors.black.withOpacity(0.6),
                          size: h * 0.03)
                    ],
                  ),
                  TextInputField(
                      hintText: "",
                      titleText: AppText.price,
                      onChanged: (value) {
                        setState(() {});
                      },
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
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
                      prefix: IntrinsicHeight(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: w * 0.012),
                          child: Row(
                            children: [
                              Icon(
                                Icons.attach_money,
                                size: h * 0.03,
                                color: AppColors.black.withOpacity(0.4),
                              ),
                              VerticalDivider(
                                color: AppColors.black.withOpacity(0.4),
                                thickness: 1.3,
                                width: w * 0.02,
                              ),
                            ],
                          ),
                        ),
                      ),
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().priceController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.4)),
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                ],
              ),
            ),
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.01,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.035),
              child: Column(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: h * 0.015),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                    text: "Upload up to 12 photos",
                                    style: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.025,
                                        fontWeight: FontWeight.w600)),
                                CommonText(
                                    text: "Minimum 2 photos required",
                                    style: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.015,
                                        fontWeight: FontWeight.w500)),
                              ],
                            ),
                            Icon(Icons.help_outline_rounded,
                                color: AppColors.black.withOpacity(0.6),
                                size: h * 0.03)
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
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            ref.read(dialogServiceProvider).commonImagePicker(
                                  picker: controller().imagePicker,
                                  pickedImage: (file) {
                                    controller().onImgSelect(val: file);
                                  },
                                );
                          },
                          child: Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.05, vertical: h * 0.014),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: AppColors.white,
                                border: Border.all(
                                    color: AppColors.black.withOpacity(0.4),
                                    width: 2)),
                            child: controller().selectedImage == null
                                ? Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.add_a_photo,
                                        color: AppColors.black.withOpacity(0.4),
                                        size: h * 0.04,
                                      ),
                                      CommonText(
                                          text: "Add Photo",
                                          textAlign: TextAlign.center,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.4),
                                            fontSize: h * 0.015,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w600,
                                          )),
                                    ],
                                  )
                                : Image.file(controller().selectedImage!),
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
            ),
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.025,
              thickness: 1,
            ),
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
                      titleText: AppText.city,
                      onChanged: (value) {
                        setState(() {});
                      },
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
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
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().cityController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.4)),
                      containerheight: h * 0.06,
                      containercolor: AppColors.white,
                      textCapitalization: TextCapitalization.none),
                  TextInputField(
                      hintText: "",
                      titleText: AppText.state,
                      onChanged: (value) {
                        setState(() {});
                      },
                      enableunderlinecolor: AppColors.black.withOpacity(0.6),
                      disableunderlinecolor: AppColors.black.withOpacity(0.6),
                      focusunderlinecolor: AppColors.black.withOpacity(0.6),
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
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().stateController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.4)),
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
            ),
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.025,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.035),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          AppImg.homelist,
                          height: h * 0.085,
                          width: h * 0.085,
                          fit: BoxFit.cover,
                        ),
                      ),
                      TextInputField(
                          hintText: "",
                          titleText: AppText.adtitle,
                          onChanged: (value) {
                            setState(() {});
                          },
                          enableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                          disableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                          focusunderlinecolor: AppColors.black.withOpacity(0.6),
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
                          errorText: "",
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: h * 0.04,
                    ),
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
                          commonNavigator(
                            context: context,
                            child: ProductAvailabliity(),
                            type: PageTransitionType.rightToLeftWithFade,
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
