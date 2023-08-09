import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';

class CommonDropdown extends ConsumerWidget {
  void Function(String?)? onChanged;
  void Function()? onTap;
  int elevation;

  final bool? messagetext;

  final String? dropdownValue;
  final String? titleText;

  bool isDense;
  double? itemHeight;
  bool isExpanded;
  bool autofocus;
  bool enableFeedback;
  FocusNode? focusNode;
  Widget? icon;

  double? iconSize;
  double? menuMaxHeight;
  Color? focusColor;
  Color? dropdownColor;
  Color? iconcolor;
  Color? icondisablecolor;

  double containerwidth;
  double? containerheight;

  Color? containercolor;

  TextStyle textstyle;
  TextStyle? titletextstyle;
  Widget? hint;
  List<String> itemslist;
  AlignmentGeometry? alignment;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;
  Widget? prefix;
  String? titlesuffix;

  CommonDropdown({
    Key? key,
    this.titlesuffix,
    required this.onChanged,
    this.onTap,
    this.hint,
    required this.elevation,
    this.itemHeight,
    this.focusNode,
    this.menuMaxHeight,
    this.enableFeedback = false,
    required this.isExpanded,
    this.autofocus = false,
    required this.itemslist,
    this.messagetext,
    this.dropdownValue,
    this.focusColor,
    this.dropdownColor,
    this.borderRadius,
    this.alignment,
    this.padding,
    this.iconcolor,
    required this.isDense,
    this.icondisablecolor,
    this.icon,
    required this.containerwidth,
    this.containerheight,
    required this.containercolor,
    this.titleText,
    required this.textstyle,
    this.titletextstyle,
    this.iconSize,
    this.prefix,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        // Padding(
        //   padding: EdgeInsets.symmetric(horizontal: width * 0.05),
        //   child: Text(
        //     titleText!,
        //     style: titletextstyle,
        //   ),
        // ),
        Container(
          width: containerwidth,
          height: containerheight ?? height * 0.06,
          decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.02,
              ),
              prefix != null ? prefix! : SizedBox.shrink(),
              Expanded(
                child: Container(
                  width: containerwidth ?? width * 0.58,
                  height: containerheight ?? height * 0.07,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                    child: DropdownButton<String>(
                      onTap: onTap,
                      elevation: elevation!,
                      style: textstyle,
                      hint: hint,
                      icon: Padding(
                        padding: EdgeInsets.only(
                          right: width * 0.023,
                          left: width * 0.023,
                        ),
                        child: icon ??
                            Icon(
                              Icons.arrow_drop_down_outlined,
                              color: AppColors.grey,
                            ),
                      ),
                      iconDisabledColor: icondisablecolor,
                      iconEnabledColor: iconcolor,
                      iconSize: iconSize != null ? iconSize! : height * 0.04,
                      isDense: isDense,
                      isExpanded: isExpanded,
                      itemHeight: itemHeight,
                      focusColor: focusColor,
                      focusNode: focusNode,
                      autofocus: autofocus,
                      dropdownColor: dropdownColor,
                      menuMaxHeight: menuMaxHeight,
                      enableFeedback: enableFeedback,
                      alignment: alignment != null
                          ? alignment!
                          : AlignmentDirectional.center,
                      borderRadius: borderRadius,
                      underline: Divider(
                        color: AppColors.grey,
                        thickness: height * 0.0011,
                      ),
                      value: dropdownValue,
                      onChanged: onChanged,
                      items: itemslist
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value, style: textstyle),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
