import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/application/dialog/dialog_service.dart';
import 'package:rentworthy/presentation/indi_prof/home/categories/cat_details/category_details_screen.dart';
import 'package:rentworthy/presentation/indi_prof/sell/product_availablity/product_availablity_screen_controller.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_appbar.dart';
import '../../../../utils/common_components/common_button.dart';
import '../../../../utils/common_components/common_navigator.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/text.dart';
import 'table_calendar/table_calendar.dart';

class ProductAvailabliity extends ConsumerWidget {
  const ProductAvailabliity({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(productAvailabilityControllerProvider);
    controller() => ref.read(productAvailabilityControllerProvider.notifier);
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
              text: AppText.productaval,
              style: ptSansTextStyle(
                  color: AppColors.black,
                  fontSize: h * 0.025,
                  fontWeight: FontWeight.w600)),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              children: [
                Divider(
                  color: AppColors.black.withOpacity(0.1),
                  thickness: 1.5,
                  height: h * 0.02,
                ),
                Container(
                  width: w,
                  height: h * 0.6,
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              IconText(
                                title: " Calendar",
                                textStyle: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.03,
                                    fontWeight: FontWeight.w800),
                                subimg: false,
                                preimg: true,
                                preimgname: AppImg.editnote,
                                preiconsize: h * 0.035,
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsets.only(left: w * 0.1, top: h * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IntrinsicHeight(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      IconText(
                                        title: "Calendar",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black,
                                            fontSize: h * 0.015,
                                            fontWeight: FontWeight.w800),
                                        subimg: false,
                                        preimg: true,
                                        preicon: Icons.circle,
                                        preimgcolor: AppColors.colorPrimary,
                                        preiconsize: h * 0.015,
                                      ),
                                      VerticalDivider(
                                        color: AppColors.black.withOpacity(0.2),
                                        thickness: 1,
                                        width: w * 0.05,
                                      ),
                                      IconText(
                                        title: "reserve for myself",
                                        textStyle: ptSansTextStyle(
                                            color: AppColors.black,
                                            fontSize: h * 0.015,
                                            fontWeight: FontWeight.w800),
                                        subimg: false,
                                        preimg: true,
                                        preicon: Icons.circle,
                                        preimgcolor: AppColors.colorSecondary,
                                        preiconsize: h * 0.015,
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: h * 0.01),
                                  child: CommonText(
                                    text:
                                        "you can edit product availability status by clicking on the date or pencil icon",
                                    style: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.015,
                                        fontWeight: FontWeight.w800),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: h * 0.02,
                        ),
                        child: TableCalendar(
                          onDaySelected: (selectedDay, focusedDay) {
                            controller().onDaySelected(
                                focusedDay: focusedDay,
                                selectedDay: selectedDay);
                          },
                          availableCalendarFormats: const {
                            CalendarFormat.month: 'Month',
                          },
                          headerStyle: HeaderStyle(
                            titleTextStyle: ptSansTextStyle(
                                color: AppColors.black,
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w800),
                            titleCentered: false,
                            formatButtonVisible: false,
                            leftChevronVisible: false,
                            rightChevronPadding:
                                EdgeInsets.only(right: w * 0.4),
                            rightChevronIcon: Icon(
                              Icons.keyboard_arrow_down_sharp,
                              color: AppColors.black,
                              size: h * 0.03,
                            ),
                          ),
                          selectedDayPredicate: (day) =>
                              isSameDay(controller().selectedDay, day),
                          calendarStyle: CalendarStyle(
                              defaultDecoration: BoxDecoration(),
                              weekendDecoration: BoxDecoration(),
                              outsideDaysVisible: false,
                              defaultTextStyle: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w800),
                              weekendTextStyle: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w800),
                              selectedDecoration: BoxDecoration(
                                color: AppColors.indigo,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              isTodayHighlighted: false),
                          onDayLongPressed: (selectedDay, focusedDay) {
                            ref
                                .read(dialogServiceProvider)
                                .productAvailabilityDialog(
                                  date:
                                      "${controller().selectedDay.day.toString()} "
                                      "${DateFormat('MMM').format(controller().selectedDay)} "
                                      "${controller().selectedDay.year.toString()}",
                                );
                          },
                          startingDayOfWeek: StartingDayOfWeek.sunday,
                          calendarFormat: CalendarFormat.month,
                          firstDay: DateTime.utc(2010, 10, 16),
                          lastDay: DateTime.utc(2030, 3, 14),
                          focusedDay: controller().focusedDay,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: w * 0.05, vertical: h * 0.03),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CommonButton(
                      containerwidth: w,
                      containerheight: h * 0.06,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          gradient: const LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ])),
                      backgroundColor: AppColors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      text: AppText.post,
                      textStyle: ptSansTextStyle(
                          color: AppColors.white,
                          fontSize: h * 0.025,
                          fontWeight: FontWeight.w700),
                      onPressed: () {
                        commonNavigator(
                          context: context,
                          child: CategoryDetailsScreen(
                            title: 'Subcategory',
                          ),
                          type: PageTransitionType.rightToLeftWithFade,
                        );
                      }),
                ],
              ),
            )
          ],
        ));
  }
}
