import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/indi_prof/home/categories/view_all_cat/view_all_category_controller.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_dropdown.dart';
import '../../../../../utils/common_components/common_dropdown_multiselect.dart';
import '../../../../../utils/common_components/common_iconbutton.dart';
import '../../../../../utils/common_components/common_searchbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/common_components/dropdown/dropdown_search.dart';
import '../../../../../utils/common_components/dropdown/src/properties/dropdown_decorator_props.dart';
import '../../../../../utils/common_components/gradient_track_shape.dart';
import '../../../../../utils/text.dart';
import '../categories.dart';

class ViewAllCategory extends ConsumerWidget {
  ViewAllCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(viewAllCategoryControllerProvider);
    controller() => ref.read(viewAllCategoryControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBar(
        leadingicon: false,
        centerTitle: true,
        title: AppText.cat,
        suffixicon: SizedBox(
          height: h * 0.06,
          width: h * 0.06,
        ),
        leadicon: Card(
          elevation: 2,
          color: AppColors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(h * 0.01)),
          child: CommonIconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            centericon: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.colorPrimary,
                    AppColors.colorSecondary,
                  ],
                ).createShader(bounds);
              },
              child: Center(
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: AppColors.white, size: h * 0.026),
              ),
            ),
            containerwidth: h * 0.06,
            containerheight: h * 0.06,
            backgroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(h * 0.01)),
          ),
        ),
        textstyle: ptSansTextStyle(
            foreground: Paint()
              ..shader = const LinearGradient(
                colors: <Color>[
                  AppColors.colorPrimary,
                  AppColors.colorSecondary
                ],
              ).createShader(const Rect.fromLTRB(150, 0, 250, 20)),
            fontSize: h * 0.025,
            fontWeight: FontWeight.w600),
        padding: EdgeInsets.symmetric(horizontal: w * 0.025),
        backgroundColor: AppColors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.025),
        child: Stack(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ///listview
            Positioned(
              top: h * 0.155,
              left: 0,
              right: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    DefaultTabController(
                      length: 4,
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              color: AppColors.white,
                              child: TabBar(
                                  isScrollable: true,
                                  indicatorSize: TabBarIndicatorSize.tab,
                                  dividerColor: AppColors.transparent,
                                  labelStyle: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.5),
                                      fontSize: h * 0.019,
                                      fontWeight: FontWeight.w700),
                                  unselectedLabelStyle: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.5),
                                      fontSize: h * 0.019,
                                      fontWeight: FontWeight.w500),
                                  tabs: [
                                    Tab(
                                      child: Row(
                                        children: [
                                          Image.asset(AppImg.all,
                                              height: h * 0.021),
                                          CommonText(
                                              text: "All",
                                              style: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        children: [
                                          Image.asset(AppImg.fridge,
                                              height: h * 0.023),
                                          CommonText(
                                              text: "Electronics",
                                              style: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        children: [
                                          Image.asset(AppImg.car,
                                              height: h * 0.023),
                                          CommonText(
                                              text: "Cars",
                                              style: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Tab(
                                      child: Row(
                                        children: [
                                          Image.asset(AppImg.bicycle,
                                              height: h * 0.023),
                                          CommonText(
                                              text: "Bikes",
                                              style: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.5),
                                                fontSize: h * 0.019,
                                              ))
                                        ],
                                      ),
                                    ),
                                  ]),
                            ),
                            Container(
                              height: h * 0.67,
                              child: TabBarView(children: [
                                Container(
                                  width: w,
                                  height: h,
                                  child: Categories(
                                      animatecontrollerlist:
                                          controller().animatecontrollerlist!,
                                      isFavIcon: true,
                                      isextended: false,
                                      title: "",
                                      onFavPressed: (index) {
                                        controller().onFavTap(index);
                                      },
                                      shrinkWrap: true,
                                      width: w,
                                      isTopPadding: false,
                                      height: controller().imgList.length *
                                          h *
                                          0.067,
                                      favList: controller().getfavlist,
                                      scrollDirection: Axis.vertical,
                                      nameList: controller().nameList,
                                      imgList: controller().imgList,
                                      isCategory: false,
                                      isFeature: false,
                                      isViewAll: false),
                                ),
                                Container(
                                  width: w,
                                  height: h,
                                  child: Categories(
                                      animatecontrollerlist:
                                          controller().animatecontrollerlist!,
                                      isFavIcon: true,
                                      isextended: false,
                                      title: "",
                                      onFavPressed: (index) {
                                        controller().onFavTap(index);
                                      },
                                      shrinkWrap: true,
                                      width: w,
                                      isTopPadding: false,
                                      height: controller().imgList.length *
                                          h *
                                          0.067,
                                      favList: controller().getfavlist,
                                      scrollDirection: Axis.vertical,
                                      nameList: controller().nameList,
                                      imgList: controller().imgList,
                                      isCategory: false,
                                      isFeature: false,
                                      isViewAll: false),
                                ),
                                Container(
                                  width: w,
                                  height: h,
                                  child: Categories(
                                      animatecontrollerlist:
                                          controller().animatecontrollerlist!,
                                      isFavIcon: true,
                                      isextended: false,
                                      title: "",
                                      onFavPressed: (index) {
                                        controller().onFavTap(index);
                                      },
                                      shrinkWrap: true,
                                      width: w,
                                      isTopPadding: false,
                                      height: controller().imgList.length *
                                          h *
                                          0.067,
                                      favList: controller().getfavlist,
                                      scrollDirection: Axis.vertical,
                                      nameList: controller().nameList,
                                      imgList: controller().imgList,
                                      isCategory: false,
                                      isFeature: false,
                                      isViewAll: false),
                                ),
                                Container(
                                  width: w,
                                  height: h,
                                  child: Categories(
                                      animatecontrollerlist:
                                          controller().animatecontrollerlist!,
                                      isFavIcon: true,
                                      isextended: false,
                                      title: "",
                                      onFavPressed: (index) {
                                        controller().onFavTap(index);
                                      },
                                      shrinkWrap: true,
                                      width: w,
                                      isTopPadding: false,
                                      height: controller().imgList.length *
                                          h *
                                          0.067,
                                      favList: controller().getfavlist,
                                      scrollDirection: Axis.vertical,
                                      nameList: controller().nameList,
                                      imgList: controller().imgList,
                                      isCategory: false,
                                      isFeature: false,
                                      isViewAll: false),
                                ),
                              ]),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Positioned(
              top: h * 0.01,
              child: CommonSearchBar(
                containerwidth: w * 0.92,
                containerheight: h * 0.07,
                searchController: controller().searchController,
                onsearchChanged: (str) {
                  controller()
                      .filterSearchResults(controller().searchController.text);
                },
              ).animate().fadeIn(duration: (80).ms).then(delay: (80).ms).slideX(
                    begin: 1,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 500.ms,
                  ),
            ),

            ///dropdowns
            Positioned(
              top: h * 0.08,
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
                      // child: CommonDropdown(
                      //   dropdownsuffix: Checkbox(
                      //     value: false,
                      //     activeColor: AppColors.colorPrimary,
                      //     side: BorderSide(
                      //         color: AppColors.black.withOpacity(0.4),
                      //         width: 1),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(4)),
                      //     onChanged: (_) {},
                      //   ),
                      //   dropdowntitle: Column(
                      //     children: [
                      //       Row(
                      //         children: [
                      //           Container(
                      //             width: w * 0.85,
                      //             height: h * 0.035,
                      //             color: AppColors.white,
                      //             child: SliderTheme(
                      //                 data: SliderThemeData(
                      //                   trackHeight: h * 0.013,
                      //                   thumbShape:
                      //                       GradientRectSliderThumbShape(
                      //                           disabledThumbRadius: h * 0.014,
                      //                           enabledThumbRadius: h * 0.014),
                      //                   trackShape:
                      //                       const GradientRectSliderTrackShape(
                      //                           gradient: LinearGradient(
                      //                             colors: <Color>[
                      //                               AppColors.colorPrimary,
                      //                               AppColors.colorSecondary
                      //                             ],
                      //                           ),
                      //                           darkenInactive: true),
                      //                 ),
                      //                 child: Slider(
                      //                   min: 0,
                      //                   max: 100,
                      //                   inactiveColor:
                      //                       AppColors.black.withOpacity(0.2),
                      //                   thumbColor: AppColors.white,
                      //                   value: 50.0,
                      //                   onChanged: (double value) {},
                      //                 )),
                      //           ),
                      //         ],
                      //       ),
                      //       Padding(
                      //         padding: EdgeInsets.symmetric(
                      //             vertical: h * 0.015, horizontal: w * 0.025),
                      //         child: Row(
                      //           children: [
                      //             CommonText(
                      //               text: "Price: \u{20B9}0 - \u{20B9}5,000 ",
                      //               style: ptSansTextStyle(
                      //                   color: AppColors.black.withOpacity(0.4),
                      //                   fontSize: h * 0.02,
                      //                   fontWeight: FontWeight.w600),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      //   items: controller().getfilterlist,
                      //   selectedItem: controller().getselectedfilter,
                      //   dropdownDecoratorProps: DropDownDecoratorProps(
                      //       textAlignVertical: TextAlignVertical.bottom,
                      //       dropdownSearchDecoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         prefixIcon: SizedBox(
                      //           height: h * 0.03,
                      //           width: h * 0.03,
                      //           child: Center(
                      //             child: Image.asset(AppImg.filter,
                      //                 color: AppColors.black,
                      //                 height: h * 0.025),
                      //           ),
                      //         ),
                      //         hintText: "Select Filter",
                      //         hintStyle: ptSansTextStyle(
                      //             color: AppColors.black.withOpacity(0.4),
                      //             fontSize: h * 0.017,
                      //             fontWeight: FontWeight.w500),
                      //       ),
                      //       baseStyle: ptSansTextStyle(
                      //           color: AppColors.black.withOpacity(0.4),
                      //           fontSize: h * 0.02,
                      //           fontWeight: FontWeight.w700)),
                      //   clearButtonProps: ClearButtonProps(isVisible: false),
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
                      //   prefix: SizedBox(
                      //     height: h * 0.03,
                      //     width: h * 0.03,
                      //     child: Center(
                      //       child: Image.asset(AppImg.filter,
                      //           color: AppColors.black, height: h * 0.025),
                      //     ),
                      //   ),
                      //   isExpanded: true,
                      //   containerwidth: w * 0.45,
                      //   containerheight: h * 0.06,
                      //   borderRadius: BorderRadius.circular(8),
                      //   containercolor: AppColors.white,
                      //   elevation: 5,
                      // ),
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
                                                disabledThumbRadius: h * 0.012,
                                                enabledThumbRadius: h * 0.012),
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
                                        color: AppColors.black.withOpacity(0.4),
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
                          color: AppColors.black.withOpacity(0.2),
                          width: 1,
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
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(8)),
                      // child: CommonDropdown(
                      //   selectedItem: controller().getselectedsortby,
                      //   items: controller().getsortlist,
                      //   dropdownsuffix: Checkbox(
                      //     value: false,
                      //     activeColor: AppColors.colorPrimary,
                      //     side: BorderSide(
                      //         color: AppColors.black.withOpacity(0.4),
                      //         width: 1),
                      //     shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(4)),
                      //     onChanged: (_) {},
                      //   ),
                      //   dropdownDecoratorProps: DropDownDecoratorProps(
                      //       textAlignVertical: TextAlignVertical.bottom,
                      //       dropdownSearchDecoration: InputDecoration(
                      //         border: InputBorder.none,
                      //         hintText: "Sort By",
                      //         prefixIcon: SizedBox(
                      //           height: h * 0.03,
                      //           width: h * 0.03,
                      //           child: Center(
                      //             child: Image.asset(AppImg.sort,
                      //                 color: AppColors.black,
                      //                 height: h * 0.025),
                      //           ),
                      //         ),
                      //         hintStyle: ptSansTextStyle(
                      //             color: AppColors.black.withOpacity(0.4),
                      //             fontSize: h * 0.017,
                      //             fontWeight: FontWeight.w500),
                      //       ),
                      //       baseStyle: ptSansTextStyle(
                      //           color: AppColors.black.withOpacity(0.4),
                      //           fontSize: h * 0.02,
                      //           fontWeight: FontWeight.w700)),
                      //   clearButtonProps: ClearButtonProps(isVisible: false),
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
                      //     controller().onchangesorting(
                      //       str,
                      //     );
                      //   },
                      //   enabled: true,
                      //   prefix: SizedBox(
                      //     height: h * 0.03,
                      //     width: h * 0.03,
                      //     child: Image.asset(AppImg.sort,
                      //         color: AppColors.black, height: h * 0.025),
                      //   ),
                      //   isExpanded: true,
                      //   containerwidth: w * 0.45,
                      //   containerheight: h * 0.06,
                      //   borderRadius: BorderRadius.circular(8),
                      //   containercolor: AppColors.white,
                      //   elevation: 5,
                      // ),
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
                                                disabledThumbRadius: h * 0.012,
                                                enabledThumbRadius: h * 0.012),
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
                                        color: AppColors.black.withOpacity(0.4),
                                        fontSize: h * 0.02,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        items: controller().getsortlist,
                        selectedItems: controller().getselectedsortby,
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
                          color: AppColors.black.withOpacity(0.2),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(8),
                        containercolor: AppColors.white,
                        elevation: 5,
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: (80).ms).then(delay: (80).ms).slideX(
                    begin: 1,
                    end: 0,
                    curve: Curves.easeInOutCubic,
                    duration: 500.ms,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
