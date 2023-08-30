import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_dropdown.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/images.dart';
import '../home/categories/categories.dart';
import 'booking_screen_controller.dart';

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
            padding: EdgeInsets.symmetric(horizontal: w * 0.025),
            child: Stack(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ///listview
                Positioned(
                  top: h * 0.04,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
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
                                    isTopPadding: true,
                                    height:
                                        controller().imgList.length * h * 0.081,
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
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: CommonDropdown(
                            dropdownsuffix: Checkbox(
                              value: false,
                              activeColor: AppColors.colorPrimary,
                              side: BorderSide(
                                  color: AppColors.black.withOpacity(0.4),
                                  width: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onChanged: (_) {},
                            ),
                            dropdowntitle: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: w * 0.45,
                                      child: SfSlider(
                                        min: 0.0,
                                        max: 100.0,
                                        value: 4.0,
                                        trackShape: SfTrackShape(),
                                        showTicks: false,
                                        showLabels: false,
                                        enableTooltip: false,
                                        minorTicksPerInterval: 1,
                                        onChanged: (dynamic value) {},
                                      ),
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
                            selectedItem: controller().getselectedfilter,
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
                                ClearButtonProps(isVisible: false),
                            dropdownButtonProps: DropdownButtonProps(
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
                              controller().onValSelect(val: str!);
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
                            borderRadius: BorderRadius.circular(8),
                            containercolor: AppColors.white,
                            elevation: 5,
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: AppColors.black.withOpacity(0.2),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8)),
                          child: CommonDropdown(
                            selectedItem:
                                controller().getselectedselectedsortby,
                            items: controller().getsortlist,
                            dropdownsuffix: Checkbox(
                              value: false,
                              activeColor: AppColors.colorPrimary,
                              side: BorderSide(
                                  color: AppColors.black.withOpacity(0.4),
                                  width: 1),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4)),
                              onChanged: (_) {},
                            ),
                            dropdownDecoratorProps: DropDownDecoratorProps(
                                textAlignVertical: TextAlignVertical.bottom,
                                dropdownSearchDecoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Sort By",
                                  prefixIcon: SizedBox(
                                    height: h * 0.03,
                                    width: h * 0.03,
                                    child: Center(
                                      child: Image.asset(AppImg.sort,
                                          color: AppColors.black,
                                          height: h * 0.025),
                                    ),
                                  ),
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
                                ClearButtonProps(isVisible: false),
                            dropdownButtonProps: DropdownButtonProps(
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
                              controller().onchangesorting(
                                str,
                              );
                            },
                            enabled: true,
                            prefix: SizedBox(
                              height: h * 0.03,
                              width: h * 0.03,
                              child: Image.asset(AppImg.sort,
                                  color: AppColors.black, height: h * 0.025),
                            ),
                            isExpanded: true,
                            containerwidth: w * 0.45,
                            containerheight: h * 0.06,
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
