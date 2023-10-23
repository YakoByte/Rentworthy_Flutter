import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:rentworthy/application/validate/validate.dart';
import 'package:rentworthy/presentation/shimmers/add_address_shimmer.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';
import 'package:rentworthy/utils/common_components/common_loader.dart';

import '../../../../../../model/indi_prof/address/get_product.dart';
import '../../../../../../utils/color.dart';
import '../../../../../../utils/common_components/common_appbar.dart';
import '../../../../../../utils/common_components/common_text.dart';
import '../../../../../../utils/common_components/text_input_field.dart';
import '../../../../../../utils/text.dart';
import '../../../../error/error_screen.dart';
import 'add_address_controller.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  Map<String, dynamic>? productResponse;
  int? index;

  AddAddressScreen({super.key, this.productResponse, this.index});

  @override
  ConsumerState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  @override
  void initState() {
    controller() => ref.read(addAddressControllerProvider.notifier);

    if (widget.productResponse != null) {
      controller().nameController.text =
          widget.productResponse!["products"] != null
              ? widget.productResponse!["products"][widget.index]!["brand"]!
              : "";
      controller().stateController.text =
          widget.productResponse!["products"] != null
              ? widget.productResponse!["products"][widget.index]!["title"]!
              : "";
      controller().addressController.text =
          widget.productResponse!["products"] != null
              ? widget.productResponse!["products"]
                  [widget.index]!["description"]!
              : "";
      controller().cityController.text =
          widget.productResponse!["products"] != null
              ? widget.productResponse!["products"][widget.index]!["category"]!
              : "";
    }
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(addAddressControllerProvider);
    controller() => ref.read(addAddressControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: true,
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
              text: widget.productResponse != null
                  ? "Edit Address"
                  : AppText.addaddress,
            ),
          ),
        ),
        body: asyncState.when(
            data: (data) {
              if (controller().isLoading) {
                return CommonLoader();
              }
              return SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: h * 0.01,
                      thickness: 1,
                    ),
                    Container(
                      height: controller().isSubmit ? h * 0.75 : h * 0.7,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: w * 0.035, vertical: h * 0.02),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            TextInputField(
                                hintText: "Full name (Required)*",
                                lableText: "Full name (Required)*",
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
                                lableStyle: ptSansTextStyle(
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
                                errorText: controller().isSubmit
                                    ? validateUname(
                                        controller().nameController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validateUname(
                                        controller().nameController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().nameController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.2)),
                                containerheight: h * 0.065,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                            TextInputField(
                                hintText: "Phone number (Required)*",
                                lableText: "Phone number (Required)*",
                                lableStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
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
                                errorText: controller().isSubmit
                                    ? validatephone(
                                        controller().phoneController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validatephone(
                                        controller().phoneController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().phoneController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.2)),
                                containerheight: h * 0.065,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                            TextInputField(
                                hintText: "Zipcode (Required)*",
                                lableText: "Zipcode (Required)*",
                                lableStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
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
                                errorText: controller().isSubmit
                                    ? validate(
                                        controller().zipcodeController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(
                                        controller().zipcodeController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().zipcodeController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.2)),
                                containerheight: h * 0.065,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                TextInputField(
                                    hintText: "State (Required)*",
                                    lableText: "State (Required)*",
                                    lableStyle: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.6),
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
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
                                    errorText: controller().isSubmit
                                        ? validate(
                                            controller().stateController.text)
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        validate(
                                            controller().stateController.text);
                                      });
                                    },
                                    errorStyle: ptSansTextStyle(
                                        color: AppColors.red,
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
                                    controller: controller().stateController,
                                    keyboardType: TextInputType.text,
                                    containerwidth: w * 0.45,
                                    underline: false,
                                    borderRadius: BorderRadius.circular(4),
                                    containerborder: Border.all(
                                        color:
                                            AppColors.black.withOpacity(0.2)),
                                    containerheight: h * 0.065,
                                    containercolor: AppColors.white,
                                    textCapitalization:
                                        TextCapitalization.none),
                                TextInputField(
                                    hintText: "City (Required)*",
                                    lableText: "City (Required)*",
                                    lableStyle: ptSansTextStyle(
                                        color: AppColors.black.withOpacity(0.6),
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
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
                                    errorText: controller().isSubmit
                                        ? validate(
                                            controller().cityController.text)
                                        : null,
                                    onChanged: (value) {
                                      setState(() {
                                        validate(
                                            controller().cityController.text);
                                      });
                                    },
                                    errorStyle: ptSansTextStyle(
                                        color: AppColors.red,
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
                                    controller: controller().cityController,
                                    keyboardType: TextInputType.text,
                                    containerwidth: w * 0.45,
                                    underline: false,
                                    borderRadius: BorderRadius.circular(4),
                                    containerborder: Border.all(
                                        color:
                                            AppColors.black.withOpacity(0.2)),
                                    containerheight: h * 0.065,
                                    containercolor: AppColors.white,
                                    textCapitalization:
                                        TextCapitalization.none),
                              ],
                            ),
                            TextInputField(
                                hintText: "Full Address*",
                                lableText: "Full Address*",
                                lableStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
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
                                errorText: controller().isSubmit
                                    ? validate(
                                        controller().addressController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(
                                        controller().addressController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().addressController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.2)),
                                containerheight: h * 0.065,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                            TextInputField(
                                hintText: "Unit number (only for apartments)",
                                lableText: "Unit number (only for apartments)",
                                lableStyle: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
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
                                errorText: controller().isSubmit
                                    ? validate(
                                        controller().unitnoController.text)
                                    : null,
                                onChanged: (value) {
                                  setState(() {
                                    validate(
                                        controller().unitnoController.text);
                                  });
                                },
                                errorStyle: ptSansTextStyle(
                                    color: AppColors.red,
                                    fontSize: h * 0.019,
                                    fontWeight: FontWeight.w400),
                                controller: controller().unitnoController,
                                keyboardType: TextInputType.text,
                                containerwidth: w,
                                underline: false,
                                borderRadius: BorderRadius.circular(4),
                                containerborder: Border.all(
                                    color: AppColors.black.withOpacity(0.2)),
                                containerheight: h * 0.065,
                                containercolor: AppColors.white,
                                textCapitalization: TextCapitalization.none),
                            Row(
                              children: [
                                CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: w * 0.035,
                                      color: AppColors.black.withOpacity(0.5),
                                      fontWeight: FontWeight.w600),
                                  text: "Type of Address",
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: h * 0.01),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonButton(
                                      decoration: BoxDecoration(
                                          border: controller()
                                                      .selectedaddress ==
                                                  0
                                              ? const GradientBoxBorder(
                                                  gradient:
                                                      LinearGradient(colors: [
                                                    AppColors.colorPrimary,
                                                    AppColors.colorSecondary,
                                                  ]),
                                                  width: 2,
                                                )
                                              : Border.all(
                                                  color: AppColors.black
                                                      .withOpacity(0.2),
                                                  width: 2,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      containerwidth: w * 0.25,
                                      containerheight: h * 0.05,
                                      backgroundColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: const BorderSide(
                                              color: AppColors.white)),
                                      text: "Home",
                                      prefixicon: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                controller().selectedaddress ==
                                                        0
                                                    ? AppColors.colorPrimary
                                                    : AppColors.black
                                                        .withOpacity(0.6),
                                                controller().selectedaddress ==
                                                        0
                                                    ? AppColors.colorSecondary
                                                    : AppColors.black
                                                        .withOpacity(0.6)
                                              ]).createShader(bounds);
                                        },
                                        child: const Icon(
                                          Icons.home,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      textStyle: ptSansTextStyle(
                                          fontSize: w * 0.035,
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: <Color>[
                                                controller().selectedaddress ==
                                                        0
                                                    ? AppColors.colorPrimary
                                                    : AppColors.black
                                                        .withOpacity(0.6),
                                                controller().selectedaddress ==
                                                        0
                                                    ? AppColors.colorSecondary
                                                    : AppColors.black
                                                        .withOpacity(0.6)
                                              ],
                                            ).createShader(const Rect.fromLTWH(
                                                50.0, 150.0, 100.0, 70.0)),
                                          fontWeight: FontWeight.w800),
                                      onPressed: () {
                                        controller().onSelectAddress(val: 0);
                                      }),
                                  CommonButton(
                                      decoration: BoxDecoration(
                                          border: controller()
                                                      .selectedaddress ==
                                                  1
                                              ? const GradientBoxBorder(
                                                  width: 2,
                                                  gradient:
                                                      LinearGradient(colors: [
                                                    AppColors.colorPrimary,
                                                    AppColors.colorSecondary,
                                                  ]))
                                              : Border.all(
                                                  color: AppColors.black
                                                      .withOpacity(0.2),
                                                  width: 2,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      containerwidth: w * 0.35,
                                      containerheight: h * 0.05,
                                      backgroundColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: const BorderSide(
                                              color: AppColors.white)),
                                      text: "Apartments",
                                      prefixicon: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                controller().selectedaddress ==
                                                        1
                                                    ? AppColors.colorPrimary
                                                    : AppColors.black
                                                        .withOpacity(0.6),
                                                controller().selectedaddress ==
                                                        1
                                                    ? AppColors.colorSecondary
                                                    : AppColors.black
                                                        .withOpacity(0.6)
                                              ]).createShader(bounds);
                                        },
                                        child: const Icon(
                                          Icons.apartment_rounded,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      textStyle: ptSansTextStyle(
                                          fontSize: w * 0.035,
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: <Color>[
                                                controller().selectedaddress ==
                                                        1
                                                    ? AppColors.colorPrimary
                                                    : AppColors.black
                                                        .withOpacity(0.6),
                                                controller().selectedaddress ==
                                                        1
                                                    ? AppColors.colorSecondary
                                                    : AppColors.black
                                                        .withOpacity(0.6)
                                              ],
                                            ).createShader(const Rect.fromLTWH(
                                                170.0, 150.0, 100.0, 70.0)),
                                          fontWeight: FontWeight.w800),
                                      onPressed: () {
                                        controller().onSelectAddress(val: 1);
                                      }),
                                  CommonButton(
                                      decoration: BoxDecoration(
                                          border: controller()
                                                      .selectedaddress ==
                                                  2
                                              ? const GradientBoxBorder(
                                                  width: 2,
                                                  gradient:
                                                      LinearGradient(colors: [
                                                    AppColors.colorPrimary,
                                                    AppColors.colorSecondary,
                                                  ]))
                                              : Border.all(
                                                  color: AppColors.black
                                                      .withOpacity(0.2),
                                                  width: 2,
                                                ),
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      containerwidth: w * 0.25,
                                      containerheight: h * 0.05,
                                      backgroundColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4),
                                          side: const BorderSide(
                                              color: AppColors.white)),
                                      text: "Work",
                                      prefixicon: ShaderMask(
                                        shaderCallback: (Rect bounds) {
                                          return LinearGradient(
                                              begin: Alignment.centerLeft,
                                              end: Alignment.centerRight,
                                              colors: [
                                                controller().selectedaddress ==
                                                        2
                                                    ? AppColors.colorPrimary
                                                    : AppColors.black
                                                        .withOpacity(0.6),
                                                controller().selectedaddress ==
                                                        2
                                                    ? AppColors.colorSecondary
                                                    : AppColors.black
                                                        .withOpacity(0.6)
                                              ]).createShader(bounds);
                                        },
                                        child: Icon(
                                          Icons.work,
                                          color: AppColors.white,
                                        ),
                                      ),
                                      textStyle: ptSansTextStyle(
                                          fontSize: w * 0.035,
                                          foreground: Paint()
                                            ..shader = LinearGradient(
                                              colors: <Color>[
                                                controller().selectedaddress ==
                                                        2
                                                    ? AppColors.colorPrimary
                                                    : AppColors.black
                                                        .withOpacity(0.6),
                                                controller().selectedaddress ==
                                                        2
                                                    ? AppColors.colorSecondary
                                                    : AppColors.black
                                                        .withOpacity(0.6)
                                              ],
                                            ).createShader(const Rect.fromLTWH(
                                                315.0, 150.0, 100.0, 70.0)),
                                          fontWeight: FontWeight.w800),
                                      onPressed: () {
                                        controller().onSelectAddress(val: 2);
                                      }),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.035, vertical: h * 0.045),
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
                          text: AppText.saveaddress,
                          textStyle: ptSansTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w700),
                          onPressed: () {
                            controller().onSave();
                          }),
                    ),
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
            }));
  }
}
