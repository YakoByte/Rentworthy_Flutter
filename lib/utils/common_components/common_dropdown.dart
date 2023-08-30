import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';
import 'common_text.dart';

class CommonDropdown extends ConsumerWidget {
  void Function(String?)? onChanged;
  void Function()? onTap;
  int elevation;

  final bool? messagetext;

  final String? dropdownValue;
  final String? titleText;

  bool? isDense;
  double? itemHeight;
  bool isExpanded;
  bool autofocus;
  bool enableFeedback;
  FocusNode? focusNode;
  Widget? dropdownicon;
  Widget? dropdownsuffix;

  double? iconSize;
  double? menuMaxHeight;
  Color? focusColor;
  Color? dropdownColor;
  Color? iconcolor;
  Color? icondisablecolor;

  double containerwidth;
  double containerheight;

  Color? containercolor;

  TextStyle? textstyle;
  TextStyle? titletextstyle;
  Widget? dropdowntitle;
  List<String>? itemslist;
  AlignmentGeometry? alignment;
  BorderRadius? borderRadius;
  EdgeInsetsGeometry? padding;
  Widget? prefix;
  String? titlesuffix;
  BoxBorder? border;
  bool? checkboxval;
  void Function(bool)? onchange;

  ///
  void Function(String?)? onSaved;
  String? Function(String?)? validator;
  AutovalidateMode? autoValidateMode = AutovalidateMode.disabled;
  void Function(String?) onChangedsearch;
  List<String> items;

  String? selectedItem;
  Future<List<String>> Function(String)? asyncItems;
  Widget Function(BuildContext, String?)? dropdownBuilder;
  DropDownDecoratorProps dropdownDecoratorProps = DropDownDecoratorProps();
  ClearButtonProps clearButtonProps = ClearButtonProps();
  DropdownButtonProps dropdownButtonProps = DropdownButtonProps();
  bool enabled = true;
  bool Function(String, String)? filterFn;
  String Function(String)? itemAsString;
  bool Function(String, String)? compareFn;
  Future<bool?> Function(String?, String?)? onBeforeChange;
  Future<bool?> Function(String?)? onBeforePopupOpening;
  PopupProps<String>? popupProps;

  CommonDropdown({
    Key? key,
    this.onSaved,
    this.validator,
    this.autoValidateMode,
    required this.onChangedsearch,
    required this.items,
    this.selectedItem,
    this.asyncItems,
    this.dropdownBuilder,
    required this.dropdownDecoratorProps,
    required this.clearButtonProps,
    required this.dropdownButtonProps,
    required this.enabled,
    this.filterFn,
    this.dropdownsuffix,
    this.itemAsString,
    this.compareFn,
    this.onBeforeChange,
    this.onBeforePopupOpening,
    this.popupProps,
    this.titlesuffix,
    this.onChanged,
    this.onTap,
    this.dropdowntitle,
    this.border,
    this.checkboxval,
    required this.elevation,
    this.itemHeight,
    this.focusNode,
    this.onchange,
    this.menuMaxHeight,
    this.enableFeedback = false,
    required this.isExpanded,
    this.autofocus = false,
    this.itemslist,
    this.messagetext,
    this.dropdownValue,
    this.focusColor,
    this.dropdownColor,
    this.borderRadius,
    this.alignment,
    this.padding,
    this.iconcolor,
    this.isDense,
    this.icondisablecolor,
    this.dropdownicon,
    required this.containerwidth,
    required this.containerheight,
    required this.containercolor,
    this.titleText,
    this.textstyle,
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
        Container(
          width: containerwidth,
          height: containerheight ?? height * 0.06,
          decoration: BoxDecoration(
            color: containercolor,
            border: border,
            borderRadius: borderRadius,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  width: containerwidth,
                  height: containerheight,
                  child: DropdownSearch<String>(
                    onSaved: onSaved,
                    validator: validator,
                    autoValidateMode: autoValidateMode,
                    onChanged: onChangedsearch,
                    items: items,
                    selectedItem: selectedItem ?? dropdownValue,
                    asyncItems: asyncItems,
                    dropdownBuilder: _style,
                    dropdownDecoratorProps: dropdownDecoratorProps,
                    clearButtonProps: clearButtonProps,
                    dropdownButtonProps: dropdownButtonProps,
                    enabled: enabled,
                    filterFn: filterFn,
                    itemAsString: itemAsString,
                    compareFn: compareFn,
                    onBeforeChange: onBeforeChange,
                    onBeforePopupOpening: onBeforePopupOpening,
                    popupProps: PopupProps.menu(
                      fit: FlexFit.loose,
                      title: dropdowntitle,

                      //comment this if you want that the items do not takes all available height
                      itemBuilder: (context, item, isSelected) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: height * 0.006,
                              horizontal: width * 0.025),
                          child: Container(
                            height: height * 0.025,
                            child: Row(
                              children: [
                                dropdownicon != null
                                    ? dropdownicon!
                                    : const SizedBox.shrink(),
                                dropdownsuffix != null
                                    ? Expanded(
                                        child: Text(
                                          item!,
                                          style: ptSansTextStyle(
                                              color: AppColors.black
                                                  .withOpacity(0.8),
                                              fontSize: height * 0.02,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      )
                                    : Text(
                                        item!,
                                        style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.8),
                                            fontSize: height * 0.02,
                                            fontWeight: FontWeight.w600),
                                      ),
                                dropdownsuffix != null
                                    ? dropdownsuffix!
                                    : const SizedBox.shrink(),
                              ],
                            ),
                          ),
                        );
                      },
                      constraints: BoxConstraints.tightFor(),
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

  Widget _style(BuildContext context, String? selectedItem) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.only(left: width * 0.02),
      child: Text(
        selectedItem!,
        style: ptSansTextStyle(
            color: AppColors.black.withOpacity(0.8),
            fontSize: height * 0.02,
            fontWeight: FontWeight.w700),
      ),
    );
  }

  Widget _style1(BuildContext context, String? item, bool isSelected) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      height: height * 0.025,
      child: Row(
        children: [
          Icon(Icons.location_on),
          Text(
            selectedItem!,
            style: ptSansTextStyle(
                color: AppColors.black.withOpacity(0.8),
                fontSize: height * 0.02,
                fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
