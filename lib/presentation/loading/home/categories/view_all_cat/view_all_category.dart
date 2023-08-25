import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/home/categories/categories.dart';
import 'package:rentworthy/presentation/loading/home/categories/view_all_cat/view_all_category_controller.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_dropdown.dart';
import '../../../../../utils/common_components/common_iconbutton.dart';
import '../../../../../utils/common_components/common_searchbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';

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
                                    isFavIcon: true,
                                    isextended: false,
                                    title: "",
                                    onCardPressed: () {},
                                    shrinkWrap: true,
                                    width: w,
                                    isTopPadding: false,
                                    height:
                                        controller().imgList.length * h * 0.067,
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
                                    isFavIcon: true,
                                    isextended: false,
                                    title: "",
                                    onCardPressed: () {},
                                    shrinkWrap: true,
                                    width: w,
                                    isTopPadding: false,
                                    height:
                                        controller().imgList.length * h * 0.067,
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
                                    isFavIcon: true,
                                    isextended: false,
                                    title: "",
                                    onCardPressed: () {},
                                    shrinkWrap: true,
                                    width: w,
                                    isTopPadding: false,
                                    height:
                                        controller().imgList.length * h * 0.067,
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
                                    isFavIcon: true,
                                    isextended: false,
                                    title: "",
                                    onCardPressed: () {},
                                    shrinkWrap: true,
                                    width: w,
                                    isTopPadding: false,
                                    height:
                                        controller().imgList.length * h * 0.067,
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
                      child: CommonDropdown(
                        onChanged: (str) {
                          controller().onchangefilter(
                            str,
                          );
                        },
                        isExpanded: true,
                        itemslist: controller().getfilterlist,
                        isDense: false,
                        dropdownValue: controller().getselectedfilter,
                        containerwidth: w * 0.45,
                        containerheight: h * 0.06,
                        borderRadius: BorderRadius.circular(8),
                        textstyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.4),
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w700),
                        prefix: SizedBox(
                          height: h * 0.03,
                          width: h * 0.03,
                          child: Center(
                            child: Image.asset(AppImg.filter,
                                color: AppColors.black, height: h * 0.025),
                          ),
                        ),
                        icon: SizedBox(
                          height: h * 0.03,
                          width: h * 0.03,
                          child: Center(
                            child: Icon(Icons.keyboard_arrow_down_sharp,
                                color: AppColors.black, size: h * 0.025),
                          ),
                        ),
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
                        onChanged: (str) {
                          controller().onchangesorting(
                            str,
                          );
                        },
                        dropdownValue: controller().getselectedselectedsortby,
                        checkboxval: controller().getcheckboxitems,
                        onchange: (val) {
                          controller().onchangecheckbox(val);
                        },
                        isExpanded: true,
                        itemslist: controller().getsortlist,
                        isDense: false,
                        containerwidth: w * 0.45,
                        containerheight: h * 0.06,
                        borderRadius: BorderRadius.circular(8),
                        containercolor: AppColors.white,
                        textstyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.4),
                            overflow: TextOverflow.ellipsis,
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w700),
                        prefix: SizedBox(
                          height: h * 0.03,
                          width: h * 0.03,
                          child: Image.asset(AppImg.sort,
                              color: AppColors.black, height: h * 0.025),
                        ),
                        icon: SizedBox(
                          height: h * 0.03,
                          width: h * 0.03,
                          child: Icon(Icons.keyboard_arrow_down_sharp,
                              color: AppColors.black, size: h * 0.025),
                        ),
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
