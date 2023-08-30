import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../application/onboarding/dialog/dialod_service.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/text.dart';
import '../home/categories/cat_details/category_details_screen_controller.dart';

class SelectDateDialog extends ConsumerStatefulWidget {
  SelectDateDialog({
    super.key,
  });

  @override
  ConsumerState createState() => _SelectDateDialogState();
}

class _SelectDateDialogState extends ConsumerState<SelectDateDialog> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(categoryDetailsControllerProvider);
    controller() => ref.read(categoryDetailsControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return StatefulBuilder(
      builder: (context, setState1) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.white,
          titlePadding: EdgeInsets.only(
            top: h * 0.05,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(31),
          ),
          insetPadding: EdgeInsets.only(
            top: h * 0.05,
          ),
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          title: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.07),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.close,
                          color: AppColors.black.withOpacity(0.8),
                          size: h * 0.03),
                    ),
                  ),
                  CommonText(
                      text: AppText.dates,
                      style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.026,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Divider(
                color: AppColors.bordercolor,
                height: h * 0.035,
                thickness: 1,
              )
            ],
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: w * 0.05),
          content: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CommonText(
                      text: "29 May - 31 May",
                      style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.8),
                          fontSize: h * 0.025,
                          fontWeight: FontWeight.w700)),
                ],
              ),
              Container(
                height: h * 0.6,
                width: w,
                child: SfDateRangePicker(
                  view: DateRangePickerView.month,
                  enableMultiView: true,
                  navigationDirection:
                      DateRangePickerNavigationDirection.vertical,
                  controller: controller().pickerController,
                  monthFormat: 'MMMM',
                  selectionRadius: 10.0,
                  onViewChanged: (DateRangePickerViewChangedArgs args) {},
                  selectionMode: DateRangePickerSelectionMode.range,
                  todayHighlightColor: AppColors.textBlack,
                  enablePastDates: true,
                  showNavigationArrow: false,
                  selectionShape: DateRangePickerSelectionShape.rectangle,
                  allowViewNavigation: false,
                  navigationMode: DateRangePickerNavigationMode.snap,
                  headerStyle: DateRangePickerHeaderStyle(
                      textStyle: ptSansTextStyle(
                          fontSize: h * 0.02,
                          color: AppColors.textBlack,
                          fontWeight: FontWeight.w700),
                      textAlign: TextAlign.center),
                  onCancel: () {
                    ref.read(dialogServiceProvider).showSnackBar(
                        content: 'Selection Cancelled',
                        color: AppColors.red,
                        textclr: AppColors.white);
                  },
                  showTodayButton: false,
                  selectionColor: AppColors.colorPrimary,
                  rangeSelectionColor: AppColors.colorPrimary.withOpacity(0.4),
                  startRangeSelectionColor: AppColors.colorPrimary,
                  endRangeSelectionColor: AppColors.colorPrimary,
                  onSelectionChanged:
                      (DateRangePickerSelectionChangedArgs args) {
                    // print('selectionChanged');
                    // print(args.value);
                    // controller().ondateselectionchange(args.value);
                  },
                  selectionTextStyle: ptSansTextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: h * 0.02),
                  rangeTextStyle: ptSansTextStyle(
                      color: AppColors.white,
                      fontWeight: FontWeight.w700,
                      fontSize: h * 0.02),
                  onSubmit: (Object? value) {
                    ref.read(dialogServiceProvider).showSnackBar(
                        content: 'Selection Confirmed',
                        color: AppColors.colorPrimary.withOpacity(0.5),
                        textclr: AppColors.white);
                  },
                  monthCellStyle: DateRangePickerMonthCellStyle(
                    selectionColor: AppColors.colorPrimary,
                    startRangeSelectionColor: AppColors.colorPrimary,
                    endRangeSelectionColor: AppColors.colorPrimary,
                    rangeSelectionColor: AppColors.colorPrimary,
                    textStyle: ptSansTextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.02),
                    todayTextStyle: ptSansTextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.02),
                    trailingDatesTextStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.02),
                    leadingDatesTextStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.02),
                    selectionTextStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: h * 0.02),
                    disabledDatesTextStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.02),
                    weekendTextStyle: ptSansTextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.02),
                    todayCellDecoration: const BoxDecoration(
                        color: AppColors.white, shape: BoxShape.circle),
                    rangeTextStyle: ptSansTextStyle(
                        color: AppColors.textcolor,
                        fontWeight: FontWeight.w500,
                        fontSize: h * 0.02),
                  ),
                  monthViewSettings: DateRangePickerMonthViewSettings(
                      enableSwipeSelection: true,
                      showTrailingAndLeadingDates: false,
                      dayFormat: 'EEE',
                      viewHeaderHeight: h * 0.08,
                      weekNumberStyle: DateRangePickerWeekNumberStyle(
                          textStyle: ptSansTextStyle(
                              fontSize: h * 0.02,
                              color: AppColors.black,
                              fontWeight: FontWeight.w600)),
                      viewHeaderStyle: DateRangePickerViewHeaderStyle(
                        textStyle: ptSansTextStyle(
                            fontSize: h * 0.02,
                            color: AppColors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      showWeekNumber: false),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: w * 0.05, vertical: h * 0.025),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CommonText(
                        text: "\$8,350",
                        style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.028,
                          decoration: TextDecoration.underline,
                          decorationColor: AppColors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w700,
                        )),
                    CommonButton(
                        containerwidth: w * 0.25,
                        containerheight: h * 0.05,
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
                        text: AppText.save,
                        textStyle: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w700),
                        onPressed: () {}),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
