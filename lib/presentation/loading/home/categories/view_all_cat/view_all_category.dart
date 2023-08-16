import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/home/categories/view_all_cat/view_all_category_controller.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_dropdown.dart';
import '../../../../../utils/common_components/common_listview.dart';
import '../../../../../utils/common_components/common_searchbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';

class ViewAllCategory extends ConsumerWidget {
  const ViewAllCategory({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(viewAllCategoryControllerProvider);
    controller() => ref.read(viewAllCategoryControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: h,
              width: w,
              color: AppColors.white,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: w * 0.025),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CommonSearchBar(
                        containerwidth: w * 0.92,
                        containerheight: h * 0.07,
                        searchController: controller().searchController,
                        onsearchChanged: (str) {
                          controller().filterSearchResults(
                              controller().searchController.text);
                        },
                      ),

                      ///dropdowns
                      Row(
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
                                      color: AppColors.black,
                                      height: h * 0.025),
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
                              dropdownValue:
                                  controller().getselectedselectedsortby,
                              isExpanded: true,
                              itemslist: controller().getsortlist,
                              isDense: false,
                              containerwidth: w * 0.45,
                              containerheight: h * 0.06,
                              borderRadius: BorderRadius.circular(8),
                              containercolor: AppColors.white,
                              textstyle: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.4),
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

                      ///listview
                      CommonListView(
                          itemCount: controller().getsearchitems.isNotEmpty
                              ? controller().getsearchitems.length
                              : controller().getcarlist.length,
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          padding: EdgeInsets.zero,
                          width: w,
                          height: h * 0.75,
                          itemBuilder: (context, index) {
                            return Card(
                              color: AppColors.white,
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(14)),
                              child: Container(
                                height: h * 0.17,
                                width: w,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.white),
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.02, vertical: h * 0.01),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(14),
                                        child: Image.asset(
                                          AppImg.homelist,
                                          height: h * 0.14,
                                          width: h * 0.13,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          CommonText(
                                            style: TextStyle(
                                                fontSize: w * 0.04,
                                                color: AppColors.black,
                                                fontWeight: FontWeight.w700),
                                            text: controller()
                                                    .getsearchitems
                                                    .isNotEmpty
                                                ? controller()
                                                    .getsearchitems[index]
                                                : controller()
                                                    .getcarlist[index],
                                          ),
                                          IntrinsicHeight(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                CommonText(
                                                  text: AppText.price25k,
                                                  style: ptSansTextStyle(
                                                      fontSize: h * 0.018,
                                                      color: AppColors.black,
                                                      fontWeight:
                                                          FontWeight.w700),
                                                ),
                                                VerticalDivider(
                                                  color: AppColors.black
                                                      .withOpacity(0.3),
                                                  width: 1,
                                                  thickness: 1,
                                                ),
                                                Row(
                                                  children: [
                                                    ShaderMask(
                                                      shaderCallback:
                                                          (Rect bounds) {
                                                        return const LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                              AppColors
                                                                  .colorPrimary,
                                                              AppColors
                                                                  .colorSecondary
                                                            ]).createShader(
                                                            bounds);
                                                      },
                                                      child: Icon(
                                                          Icons
                                                              .location_on_outlined,
                                                          color:
                                                              AppColors.white,
                                                          size: h * 0.025),
                                                    ),
                                                    CommonText(
                                                      text: AppText.thane,
                                                      style: TextStyle(
                                                          fontSize: w * 0.04,
                                                          color: AppColors.black
                                                              .withOpacity(0.4),
                                                          fontWeight:
                                                              FontWeight.w400),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                          CommonText(
                                            text: AppText.perday,
                                            style: TextStyle(
                                                fontSize: w * 0.04,
                                                color: AppColors.black
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w400),
                                          ),
                                          CommonText(
                                            text: AppText.extendedrental,
                                            style: TextStyle(
                                                fontSize: w * 0.04,
                                                color: AppColors.black
                                                    .withOpacity(0.4),
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              controller().onFavTap(index);
                                            },
                                            child: Container(
                                              height: h * 0.04,
                                              width: h * 0.04,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: controller()
                                                                  .getfavlist[
                                                              index] ==
                                                          false
                                                      ? AppColors.starcolor
                                                      : AppColors.selectedstar),
                                              child: Center(
                                                  child: Icon(Icons.star,
                                                      size: h * 0.03,
                                                      color: AppColors.white)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
