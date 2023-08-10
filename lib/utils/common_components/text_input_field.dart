import 'package:flutter/material.dart';

import '../color.dart';

class TextInputField extends StatelessWidget {
  final String? hintText;
  final String? lableText;
  final TextEditingController? controller;
  final FocusNode? focusNode;

  // final VoidCallback? onTapIcon;
  final GestureTapCallback? onTap;
  final GestureTapCallback? suffixonTap;
  final TextCapitalization textCapitalization;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  // final Icon? icon;
  final bool? obscureText;
  final bool? isdescription;

  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final String? errorText;
  final String? titleText;
  final int? maxLines;
  final int? maxLength;
  final scrollPhysics;
  final enabled;
  final containerborder;
  final bool? readonly;
  final Widget? suffixicon;

  // double? iconSize;
  final Color? color;
  final String? appimge;
  final double containerwidth;
  final double? containerheight;

  // Color? iconcolor;
  final Color? containercolor;
  final Color? bordercolor;
  final TextStyle? textstyle;
  final TextStyle? titletextstyle;
  final TextStyle? hintStyle;
  final TextStyle? lableStyle;
  final TextStyle? errorStyle;
  final Widget? prefix;
  final String? titlesuffix;

  TextInputField({
    Key? key,
    required this.hintText,
    required this.controller,
    this.lableText,
    this.focusNode,
    this.titlesuffix,
    this.isdescription,

    // this.onTapIcon,
    this.onTap,
    this.onChanged,
    this.readonly = false,
    this.onSubmitted,
    // this.icon,
    this.obscureText = false,
    required this.keyboardType,
    this.textInputAction,
    this.errorText,
    this.color,
    this.appimge,
    this.suffixicon,
    required this.containerwidth,
    this.containerheight,
    // this.iconcolor,
    required this.containercolor,
    this.bordercolor,
    this.titleText,
    this.suffixonTap,
    this.textstyle,
    this.titletextstyle,
    required this.textCapitalization,
    this.hintStyle,
    this.lableStyle,
    // this.iconSize,
    this.errorStyle,
    this.maxLines,
    this.prefix,
    this.maxLength,
    this.enabled,
    this.scrollPhysics,
    this.containerborder,
  }) : super(key: key);

  Widget _buildErrorLabel(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    if (errorText == null) {
      return Container();
    }

    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: width * 0.03, vertical: height * 0.002),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            errorText!,
            style: errorStyle ??
                TextStyle(
                    fontSize: height * 0.018,
                    fontWeight: FontWeight.w400,
                    color: AppColors.red),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        if (titleText != null || titlesuffix != null)
          Container(
            width: containerwidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                titleText == '' || titleText == null
                    ? const SizedBox.shrink()
                    : Text(titleText!,
                        style: titletextstyle ??
                            TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w700,
                                color: AppColors.black)),
                // titlesuffix == '' || titlesuffix == null
                //     ? Padding(
                //         padding: EdgeInsets.symmetric(vertical: height * 0.008),
                //         child: SizedBox(
                //           height: height * 0.025,
                //         ),
                //       )
                //     : InkWell(
                //         onTap: () {},
                //         child: Padding(
                //           padding:
                //               EdgeInsets.symmetric(vertical: height * 0.008),
                //           child: Image.asset(
                //             color: AppColors.black,
                //             titlesuffix!,
                //             height: height * 0.025,
                //           ),
                //         )),
              ],
            ),
          ),
        Container(
          width: containerwidth,
          height:
              isdescription == true ? null : containerheight ?? height * 0.06,
          decoration: BoxDecoration(
            color: containercolor,
            border: containerborder,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              prefix ?? const SizedBox(),
              Expanded(
                child: SizedBox(
                  width: width * 0.54,
                  height: isdescription == true
                      ? null
                      : containerheight ?? height * 0.06,
                  child: Center(
                    child: TextFormField(
                      readOnly: readonly!,
                      enabled: enabled,
                      style: textstyle ??
                          TextStyle(
                              fontSize: height * 0.019,
                              fontWeight: FontWeight.w500,
                              color: AppColors.black),
                      onTap: onTap,
                      textCapitalization: textCapitalization,
                      textAlignVertical: TextAlignVertical.center,
                      controller: controller,
                      focusNode: focusNode,
                      onChanged: onChanged,
                      scrollPhysics:
                          scrollPhysics ?? const NeverScrollableScrollPhysics(),
                      obscureText: obscureText!,
                      keyboardType: keyboardType,
                      textInputAction: textInputAction,
                      maxLines: maxLines,
                      cursorColor: AppColors.colorPrimary,
                      maxLength: maxLength,
                      cursorHeight: height * 0.02,
                      decoration: InputDecoration(
                        labelText: lableText,
                        labelStyle: lableStyle,
                        hintText: hintText,
                        contentPadding: EdgeInsets.zero,
                        hintStyle: hintStyle ??
                            TextStyle(
                                fontSize: height * 0.018,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grey),
                        suffixIcon: suffixicon != null
                            ? InkWell(onTap: suffixonTap, child: suffixicon)
                            : suffixicon,
                        enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.bordercolor, width: 1)),
                        disabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.bordercolor, width: 1)),
                        focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.colorPrimary, width: 1)),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.bordercolor, width: 1)),
                        counterText: "",
                        isDense: true,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        _buildErrorLabel(context)
      ],
    );
  }
}
