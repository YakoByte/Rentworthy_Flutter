import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';

import '../../../../../../utils/color.dart';
import '../../../../../../utils/common_components/common_appbar.dart';
import '../../../../../../utils/common_components/common_text.dart';
import '../../../../../../utils/common_components/text_input_field.dart';
import '../../../../../../utils/text.dart';
import 'add_address_controller.dart';

class AddAddressScreen extends ConsumerStatefulWidget {
  const AddAddressScreen({super.key});

  @override
  ConsumerState createState() => _AddAddressScreenState();
}

class _AddAddressScreenState extends ConsumerState<AddAddressScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(addAddressControllerProvider);
    controller() => ref.read(addAddressControllerProvider.notifier);

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
            text: AppText.addaddress,
          ),
        ),
      ),
      body: Container(
        height: h,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Divider(
              color: AppColors.black.withOpacity(0.1),
              height: h * 0.01,
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.035, vertical: h * 0.02),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextInputField(
                      hintText: "Full name (Required)*",
                      lableText: "Full name (Required)*",
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
                      errorText: "",
                      errorStyle: ptSansTextStyle(
                          color: AppColors.red,
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
                      controller: controller().nameController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.2)),
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
                      controller: controller().nameController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.2)),
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
                      controller: controller().nameController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.2)),
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
                          controller: controller().nameController,
                          keyboardType: TextInputType.text,
                          containerwidth: w * 0.45,
                          underline: false,
                          borderRadius: BorderRadius.circular(4),
                          containerborder: Border.all(
                              color: AppColors.black.withOpacity(0.2)),
                          containerheight: h * 0.065,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none),
                      TextInputField(
                          hintText: "City (Required)*",
                          lableText: "City (Required)*",
                          lableStyle: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              fontSize: h * 0.019,
                              fontWeight: FontWeight.w400),
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
                          controller: controller().nameController,
                          keyboardType: TextInputType.text,
                          containerwidth: w * 0.45,
                          underline: false,
                          borderRadius: BorderRadius.circular(4),
                          containerborder: Border.all(
                              color: AppColors.black.withOpacity(0.2)),
                          containerheight: h * 0.065,
                          containercolor: AppColors.white,
                          textCapitalization: TextCapitalization.none),
                    ],
                  ),
                  TextInputField(
                      hintText: "Full Address*",
                      lableText: "Full Address*",
                      lableStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.019,
                          fontWeight: FontWeight.w400),
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
                      controller: controller().nameController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.2)),
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
                      controller: controller().nameController,
                      keyboardType: TextInputType.text,
                      containerwidth: w,
                      underline: false,
                      borderRadius: BorderRadius.circular(4),
                      containerborder:
                          Border.all(color: AppColors.black.withOpacity(0.2)),
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CommonButton(
                            containerwidth: w * 0.25,
                            containerheight: h * 0.045,
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                    color: AppColors.black.withOpacity(0.2))),
                            text: "Home",
                            prefixicon: Icon(
                              Icons.home,
                              color: AppColors.black.withOpacity(0.6),
                            ),
                            textStyle: ptSansTextStyle(
                                fontSize: w * 0.035,
                                color: AppColors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w800),
                            onPressed: () {}),
                        CommonButton(
                            containerwidth: w * 0.35,
                            containerheight: h * 0.045,
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                    color: AppColors.black.withOpacity(0.2))),
                            text: "Apartments",
                            prefixicon: Icon(
                              Icons.apartment_rounded,
                              color: AppColors.black.withOpacity(0.6),
                            ),
                            textStyle: ptSansTextStyle(
                                fontSize: w * 0.035,
                                color: AppColors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w800),
                            onPressed: () {}),
                        CommonButton(
                            containerwidth: w * 0.25,
                            containerheight: h * 0.045,
                            backgroundColor: AppColors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                                side: BorderSide(
                                    color: AppColors.black.withOpacity(0.2))),
                            text: "Work",
                            prefixicon: Icon(
                              Icons.work,
                              color: AppColors.black.withOpacity(0.6),
                            ),
                            textStyle: ptSansTextStyle(
                                fontSize: w * 0.035,
                                color: AppColors.black.withOpacity(0.6),
                                fontWeight: FontWeight.w800),
                            onPressed: () {}),
                      ],
                    ),
                  ),
                ],
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
                  onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
