import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/indi_prof/home/categories/view_all_cat/view_all_category_controller.dart';
import 'package:rentworthy/presentation/shimmers/view_all_cat_shimmer.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_dropdown_multiselect.dart';
import '../../../../../utils/common_components/common_iconbutton.dart';
import '../../../../../utils/common_components/common_searchbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/common_components/dropdown/dropdown_search.dart';
import '../../../../../utils/common_components/gradient_track_shape.dart';
import '../../../../../utils/text.dart';
import '../../../error/error_screen.dart';
import '../categories.dart';
import '../curve_wave.dart';
import '../home_search.dart';

class ViewAllCategory extends ConsumerWidget {
  const ViewAllCategory({
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
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const ViewAllCatShimmer();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: w * 0.025),
              child: Stack(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ///listview
                  Positioned(
                    top: h * 0.17,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          ///Cat Tabs
                          DefaultTabController(
                            length: 4,
                            child: SingleChildScrollView(
                              physics: const NeverScrollableScrollPhysics(),
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
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w700),
                                        unselectedLabelStyle: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.5),
                                            fontSize: h * 0.019,
                                            fontWeight: FontWeight.w500),
                                        tabs: [
                                          Tab(
                                            height: h * 0.06,
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
                                            height: h * 0.06,
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
                                            height: h * 0.06,
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
                                            height: h * 0.06,
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
                                  SizedBox(
                                    height: h * 0.67,
                                    child: TabBarView(children: [
                                      /// Listview
                                      SizedBox(
                                        width: w,
                                        height: h,
                                        child: Categories(
                                            animatecontrollerlist: controller()
                                                .animatecontrollerlist!,
                                            isFavIcon: true,
                                            isextended: false,
                                            title: "",
                                            onFavPressed: (index) {
                                              controller().onFavTap(index);
                                            },
                                            shrinkWrap: true,
                                            width: w,
                                            isTopPadding: false,
                                            height:
                                                controller().imgList.length *
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
                                      SizedBox(
                                        width: w,
                                        height: h,
                                        child: Categories(
                                            animatecontrollerlist: controller()
                                                .animatecontrollerlist!,
                                            isFavIcon: true,
                                            isextended: false,
                                            title: "",
                                            onFavPressed: (index) {
                                              controller().onFavTap(index);
                                            },
                                            shrinkWrap: true,
                                            width: w,
                                            isTopPadding: false,
                                            height:
                                                controller().imgList.length *
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
                                      SizedBox(
                                        width: w,
                                        height: h,
                                        child: Categories(
                                            animatecontrollerlist: controller()
                                                .animatecontrollerlist!,
                                            isFavIcon: true,
                                            isextended: false,
                                            title: "",
                                            onFavPressed: (index) {
                                              controller().onFavTap(index);
                                            },
                                            shrinkWrap: true,
                                            width: w,
                                            isTopPadding: false,
                                            height:
                                                controller().imgList.length *
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
                                      SizedBox(
                                        width: w,
                                        height: h,
                                        child: Categories(
                                            animatecontrollerlist: controller()
                                                .animatecontrollerlist!,
                                            isFavIcon: true,
                                            isextended: false,
                                            title: "",
                                            onFavPressed: (index) {
                                              controller().onFavTap(index);
                                            },
                                            shrinkWrap: true,
                                            width: w,
                                            isTopPadding: false,
                                            height:
                                                controller().imgList.length *
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
                          )
                              .animate()
                              .fadeIn(duration: (100).ms)
                              .then(delay: (100).ms)
                              .slideX(
                                begin: 1,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 550.ms,
                              ),
                        ],
                      ),
                    ),
                  ),

                  ///Search Bar
                  Positioned(
                    top: h * 0.01,
                    child: Card(
                            elevation: 3,
                            color: AppColors.transparent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50)),
                            child: CommonSearchBar(
                              containerwidth: w * 0.92,
                              containerheight: h * 0.07,
                              searchController: controller().searchController,
                              suffixicon: (controller()
                                              .speechRecognitionAvailable ==
                                          false ||
                                      controller().isListening == false)
                                  ? CommonIconButton(
                                      containerwidth: h * 0.07,
                                      containerheight: h * 0.07,
                                      backgroundColor: AppColors.white,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      centericon: Icon(Icons.mic,
                                          color:
                                              AppColors.gray.withOpacity(0.6),
                                          size: h * 0.03),
                                      onPressed: () {
                                        if (controller()
                                                .speechRecognitionAvailable &&
                                            !controller().isListening) {
                                          // debugPrint(
                                          //     "ssdsdpeechRecognitionAvailable ${controller().speechRecognitionAvailable}");
                                          // debugPrint(
                                          //     "isListeningisListening ${controller().isListening}");
                                          controller().start();
                                        }
                                      })
                                  : GestureDetector(
                                      onTap: () {
                                        controller().stop();
                                      },
                                      child: CustomPaint(
                                        painter: CirclePainter(
                                          controller().animationController!,
                                          color: AppColors.colorSecondary,
                                        ),
                                        child: SizedBox(
                                          width: h * 0.07,
                                          height: h * 0.07,
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(1000),
                                            child: ScaleTransition(
                                                scale:
                                                    Tween(begin: 0.95, end: 1.0)
                                                        .animate(
                                                  CurvedAnimation(
                                                    parent: controller()
                                                        .animationController!,
                                                    curve: CurveWave(),
                                                  ),
                                                ),
                                                child: Icon(Icons.mic,
                                                    color: AppColors.white
                                                        .withOpacity(0.8),
                                                    size: h * 0.03)),
                                          ),
                                        ),
                                      ),
                                    ),
                              onsearchChanged: (str) {},
                            ))
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

                  ///dropdowns
                  Positioned(
                    top: h * 0.09,
                    left: 0,
                    right: 0,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: h * 0.012),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ///Filter
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
                                                          AppColors
                                                              .colorPrimary,
                                                          AppColors
                                                              .colorSecondary
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
                                        color: AppColors.black,
                                        size: h * 0.025),
                                  ),
                                ),
                              ),
                              onChangedsearch: (str) {
                                //  debugPrint("sdfs $str");
                                controller().onchangefilter(str!);
                              },
                              enabled: true,
                              isExpanded: true,
                              containerwidth: w * 0.45,
                              containerheight: h * 0.06,
                              border: Border.all(
                                color: AppColors.white,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                              containercolor: AppColors.white,
                              elevation: 5,
                            ),
                          ),

                          ///Sort
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.black.withOpacity(0.2),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.circular(8)),
                            child: CommonMultiSelectDrop(
                              dropdownselecttitle: "Sort By",
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
                                        color: AppColors.black,
                                        size: h * 0.025),
                                  ),
                                ),
                              ),
                              onChangedsearch: (str) {
                                //    debugPrint("sdfs $str");
                                controller().onchangesorting(str);
                              },
                              enabled: true,
                              prefix: SizedBox(
                                height: h * 0.03,
                                width: h * 0.03,
                                child: Center(
                                  child: Image.asset(AppImg.filter,
                                      color: AppColors.black,
                                      height: h * 0.025),
                                ),
                              ),
                              isExpanded: true,
                              containerwidth: w * 0.45,
                              containerheight: h * 0.06,
                              border: Border.all(
                                color: AppColors.white,
                                width: 1,
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
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return const ViewAllCatShimmer();
          }),
    );
  }
}
