import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_dropdown.dart';
import '../../../utils/common_components/common_dropdown_multiselect.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/dropdown/dropdown_search.dart';
import '../../../utils/common_components/gradient_track_shape.dart';
import '../../../utils/images.dart';
import '../home/categories/categories.dart';
import 'booking_screen_controller.dart';
import 'my_booking/my_booking_del_status.dart';

class BookingScreen extends ConsumerWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(bookingScreenControllerProvider);
    controller() => ref.read(bookingScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: Container(
        height: h,
        color: AppColors.white,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.03),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///listview
                Positioned(
                  top: h * 0.08,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CommonText(
                              text: "My Bookings",
                              maxLines: 1,
                              style: ptSansTextStyle(
                                  fontSize: h * 0.025,
                                  overflow: TextOverflow.ellipsis,
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w600),
                            )
                                .animate()
                                .fadeIn(duration: (80).ms)
                                .then(delay: (80).ms)
                                .slideX(
                                  begin: 6,
                                  end: 0,
                                  curve: Curves.easeInOutCubic,
                                  duration: 500.ms,
                                ),
                          ],
                        ),
                        Container(
                          height: h * 0.82,
                          child: SingleChildScrollView(
                            physics: NeverScrollableScrollPhysics(),
                            child: Column(
                              children: [
                                Categories(
                                    isFavIcon: true,
                                    title: "",
                                    isextended: true,
                                    onFavPressed: (index) {
                                      controller().onFav(index);
                                    },
                                    shrinkWrap: true,
                                    lastrow: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(1000),
                                          child: Image.asset(
                                            AppImg.homelist,
                                            height: h * 0.035,
                                            width: h * 0.035,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        CommonText(
                                          text:
                                              "Rented by Stacy on 23 June 023",
                                          maxLines: 1,
                                          style: ptSansTextStyle(
                                              fontSize: w * 0.025,
                                              overflow: TextOverflow.ellipsis,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                    width: w,
                                    animatecontrollerlist:
                                        controller().animatecontrollerlist!,
                                    isTopPadding: false,
                                    onCardPressed: MyBookingDelStatus(),
                                    height:
                                        controller().imgList.length * h * 0.076,
                                    favList: controller().getfeatureadfavlist!,
                                    scrollDirection: Axis.vertical,
                                    nameList: controller().nameList,
                                    imgList: controller().imgList,
                                    isCategory: false,
                                    isFeature: false,
                                    isViewAll: false),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                ///dropdowns
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: h * 0.012),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.black.withOpacity(0.2),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: CommonMultiSelectDrop(
                            dropdownselecttitle: "Filter",
                            dropdowntitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: w * 0.44,
                                      height: h * 0.03,
                                      color: AppColors.white,
                                      child: SliderTheme(
                                          data: SliderThemeData(
                                            trackHeight: h * 0.011,
                                            thumbShape:
                                                GradientRectSliderThumbShape(
                                                    disabledThumbRadius:
                                                        h * 0.012,
                                                    enabledThumbRadius:
                                                        h * 0.012),
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
                                            inactiveColor: AppColors.black
                                                .withOpacity(0.2),
                                            thumbColor: AppColors.white,
                                            value: 50.0,
                                            onChanged: (double value) {},
                                          )),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: h * 0.015,
                                      horizontal: w * 0.025),
                                  child: Row(
                                    children: [
                                      CommonText(
                                        text:
                                            "Price: \u{20B9}0 - \u{20B9}5,000 ",
                                        style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.4),
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            items: controller().getfilterlist,
                            selectedItems: controller().getselectedfilter,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.bottom,
                                dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: SizedBox(
                                    height: h * 0.03,
                                    width: h * 0.03,
                                    child: Center(
                                      child: Image.asset(AppImg.filter,
                                          color: AppColors.black,
                                          height: h * 0.025),
                                    ),
                                  ),
                                  hintText: "Select Filter",
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
                              controller().onchangefilter(str!);
                            },
                            enabled: true,
                            isExpanded: true,
                            containerwidth: w * 0.45,
                            containerheight: h * 0.06,
                            border: Border.all(
                              color: AppColors.white.withOpacity(0.2),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            containercolor: AppColors.white,
                            elevation: 5,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.black.withOpacity(0.2),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: CommonMultiSelectDrop(
                            dropdownselecttitle: "Sort By",
                            dropdowntitle: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: w * 0.44,
                                      height: h * 0.03,
                                      color: AppColors.white,
                                      child: SliderTheme(
                                          data: SliderThemeData(
                                            trackHeight: h * 0.011,
                                            thumbShape:
                                                GradientRectSliderThumbShape(
                                                    disabledThumbRadius:
                                                        h * 0.012,
                                                    enabledThumbRadius:
                                                        h * 0.012),
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
                                            inactiveColor: AppColors.black
                                                .withOpacity(0.2),
                                            thumbColor: AppColors.white,
                                            value: 50.0,
                                            onChanged: (double value) {},
                                          )),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: h * 0.015,
                                      horizontal: w * 0.025),
                                  child: Row(
                                    children: [
                                      CommonText(
                                        text:
                                            "Price: \u{20B9}0 - \u{20B9}5,000 ",
                                        style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.4),
                                            fontSize: h * 0.02,
                                            fontWeight: FontWeight.w600),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            items: controller().getsortlist,
                            selectedItems:
                                controller().getselectedselectedsortby,
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.bottom,
                                dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: SizedBox(
                                    height: h * 0.03,
                                    width: h * 0.03,
                                    child: Center(
                                      child: Image.asset(AppImg.sort,
                                          color: AppColors.black,
                                          height: h * 0.025),
                                    ),
                                  ),
                                  hintText: "Select Filter",
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
                              controller().onchangesorting(str);
                            },
                            enabled: true,
                            prefix: SizedBox(
                              height: h * 0.03,
                              width: h * 0.03,
                              child: Center(
                                child: Image.asset(AppImg.filter,
                                    color: AppColors.black, height: h * 0.025),
                              ),
                            ),
                            isExpanded: true,
                            containerwidth: w * 0.45,
                            containerheight: h * 0.06,
                            border: Border.all(
                              color: AppColors.white.withOpacity(0.2),
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(8),
                            containercolor: AppColors.white,
                            elevation: 5,
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: (80).ms)
                      .then(delay: (80).ms)
                      .slideX(
                        begin: 1,
                        end: 0,
                        curve: Curves.easeInOutCubic,
                        duration: 500.ms,
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
