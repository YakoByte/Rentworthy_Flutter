import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/home/categories/view_all_cat/view_all_category_controller.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_dropdown.dart';
import '../../../../../utils/common_components/common_iconbutton.dart';
import '../../../../../utils/common_components/common_listview.dart';
import '../../../../../utils/common_components/common_searchbar.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/common_components/open_container_wrapper/open_container_wrapper.dart';
import '../../../../../utils/text.dart';
import '../cat_details/category_details_screen.dart';

class ViewAllCategory extends ConsumerWidget {
  String title;

  ViewAllCategory({super.key, required this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(viewAllCategoryControllerProvider);
    controller() => ref.read(viewAllCategoryControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBar(
        centerTitle: true,
        title: AppText.cat,
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
              top: h * 0.12,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                width: w,
                height: h,
                child: CommonListView(
                    itemCount: controller().getsearchitems.isNotEmpty
                        ? controller().getsearchitems.length
                        : controller().getcarlist.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    width: w,
                    height: h,
                    itemBuilder: (context, index) {
                      return OpenContainerWrapper(
                        transitionDuration: Duration(milliseconds: 800),
                        closedBuilder:
                            (BuildContext context, void Function() action) {
                          return Column(
                            children: [
                              Padding(
                                padding: index == 0
                                    ? EdgeInsets.only(top: h * 0.05)
                                    : EdgeInsets.zero,
                                child: Card(
                                  color: AppColors.white,
                                  elevation: 5,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14)),
                                  child: Container(
                                    height: h * 0.15,
                                    width: w,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: AppColors.white),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: w * 0.02,
                                          vertical: h * 0.012),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: h * 0.12,
                                            width: h * 0.12,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              child: Image.asset(
                                                AppImg.homelist,
                                                height: h * 0.12,
                                                width: h * 0.12,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: h * 0.12,
                                            width: w * 0.5,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                horizontal: w * 0.02,
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CommonText(
                                                    style: TextStyle(
                                                        fontSize: w * 0.04,
                                                        color: AppColors.black,
                                                        fontWeight:
                                                            FontWeight.w700),
                                                    text: controller()
                                                            .getsearchitems
                                                            .isNotEmpty
                                                        ? controller()
                                                                .getsearchitems[
                                                            index]
                                                        : controller()
                                                            .getcarlist[index],
                                                  ),
                                                  Container(
                                                    width: w * 0.6,
                                                    child: IntrinsicHeight(
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          CommonText(
                                                            text: AppText
                                                                .price25k,
                                                            style: ptSansTextStyle(
                                                                fontSize:
                                                                    h * 0.018,
                                                                color: AppColors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w700),
                                                          ),
                                                          VerticalDivider(
                                                            color: AppColors
                                                                .black
                                                                .withOpacity(
                                                                    0.3),
                                                            width: 1,
                                                            thickness: 1,
                                                          ),
                                                          ShaderMask(
                                                            shaderCallback:
                                                                (Rect bounds) {
                                                              return const LinearGradient(
                                                                  begin: Alignment
                                                                      .centerLeft,
                                                                  end: Alignment.centerRight,
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
                                                                color: AppColors
                                                                    .white,
                                                                size:
                                                                    h * 0.025),
                                                          ),
                                                          Expanded(
                                                            child: CommonText(
                                                              text:
                                                                  AppText.thane,
                                                              maxLines: 1,
                                                              style: ptSansTextStyle(
                                                                  fontSize:
                                                                      h * 0.015,
                                                                  color: AppColors
                                                                      .black
                                                                      .withOpacity(
                                                                          0.3),
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w400),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                  CommonText(
                                                    text: AppText.perday,
                                                    style: ptSansTextStyle(
                                                        fontSize: w * 0.04,
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  Container(
                                                    width: w * 0.5,
                                                    child: Row(
                                                      children: [
                                                        Flexible(
                                                          child: CommonText(
                                                            text: AppText
                                                                .extendedrental,
                                                            maxLines: 1,
                                                            style: ptSansTextStyle(
                                                                fontSize:
                                                                    w * 0.038,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                color: AppColors
                                                                    .black
                                                                    .withOpacity(
                                                                        0.4),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Container(
                                            height: h * 0.12,
                                            width: w * 0.12,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CommonIconButton(
                                                  containerwidth: h * 0.035,
                                                  containerheight: h * 0.035,
                                                  backgroundColor: controller()
                                                                  .getfavlist[
                                                              index] ==
                                                          false
                                                      ? AppColors.starcolor
                                                      : AppColors.selectedstar,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000)),
                                                  centericon: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.star,
                                                        color: AppColors.white,
                                                        size: h * 0.014,
                                                      ),
                                                    ],
                                                  ),
                                                  onPressed: () {
                                                    controller().onFavTap(
                                                      index,
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                                    .animate()
                                    .fadeIn(duration: ((index * 40) + 100).ms)
                                    .then(delay: ((index * 40) + 100).ms)
                                    .slideX(
                                      begin: 1,
                                      end: 0,
                                      curve: Curves.easeInOutCubic,
                                      duration: 500.ms,
                                    ),
                              ),
                            ],
                          );
                        },
                        transitionType: ContainerTransitionType.fade,
                        onClosed: (bool? data) {
                          if (data ?? false) {
                            ScaffoldMessenger.of(context)
                                .showSnackBar(const SnackBar(
                              content: Text('Marked as done!'),
                            ));
                          }
                        },
                        child: CategoryDetailsScreen(
                          title: controller().getsearchitems.isNotEmpty
                              ? controller().getsearchitems[index]
                              : controller().getcarlist[index],
                        ),
                      );
                    }),
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
