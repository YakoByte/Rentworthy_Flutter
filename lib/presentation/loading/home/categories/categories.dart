import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/loading/home/categories/cat_details/category_details_screen.dart';
import 'package:rentworthy/presentation/loading/home/categories/view_all_cat/view_all_category.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_gridview.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/open_container_wrapper/open_container_wrapper.dart';
import '../../../../utils/globals.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../home_screen_controller.dart';

class Categories extends ConsumerWidget {
  String title;
  bool isViewAll;
  bool isCategory;
  bool isFeature;
  bool shrinkWrap;
  List imgList;
  List nameList;
  List favList;
  Axis scrollDirection;
  double width;
  int? type;
  double height;
  double? contwidth;
  double? contheight;
  Color? contColor;
  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? padding;

  Categories(
      {super.key,
      required this.title,
      required this.shrinkWrap,
      required this.width,
      this.type,
      this.contwidth,
      this.borderRadius,
      required this.height,
      this.contheight,
      required this.favList,
      this.contColor,
      required this.scrollDirection,
      required this.imgList,
      required this.nameList,
      required this.isCategory,
      required this.isFeature,
      this.padding,
      required this.isViewAll});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeScreenControllerProvider);
    controller() => ref.read(homeScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding:
              EdgeInsets.symmetric(horizontal: w * 0.05, vertical: h * 0.015),
          child: Row(
            mainAxisAlignment: isViewAll == true
                ? MainAxisAlignment.spaceBetween
                : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CommonText(
                  text: title,
                  style: ptSansTextStyle(
                    color: AppColors.black.withOpacity(0.8),
                    fontSize: h * 0.022,
                    fontWeight: FontWeight.w700,
                  )),
              if (isViewAll == true)
                InkWell(
                  onTap: () {
                    FocusScope.of(Globals.navigatorKey.currentContext!)
                        .requestFocus(FocusNode());
                    commonNavigator(
                        context: context,
                        duration: Duration(milliseconds: 400),
                        type: PageTransitionType.rightToLeftWithFade,
                        child: ViewAllCategory(
                          title: title,
                        ));
                  },
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ]).createShader(bounds);
                    },
                    child: CommonText(
                        text: AppText.viewall,
                        style: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.017,
                            decorationColor: AppColors.white,
                            decorationThickness: 1.5,
                            decorationStyle: TextDecorationStyle.solid,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500)),
                  ),
                ),
            ],
          ),
        ),
        if (isCategory)
          CommonGridView(
            itemCount: imgList.length,
            scrollDirection: scrollDirection,
            shrinkWrap: shrinkWrap,
            padding: padding,
            width: width,
            height: height,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: w * 0.25,
                    height: h * 0.12,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        // Padding(
                        //   padding: EdgeInsets.symmetric(vertical: h * 0.005),
                        //   child: Container(
                        //     height: h * 0.055,
                        //     width: h * 0.055,
                        //     decoration: BoxDecoration(
                        //       color: AppColors.colorPrimary,
                        //       borderRadius: BorderRadius.circular(100),
                        //     ),
                        //     child: Center(
                        //       child: Image.asset(
                        //         imgList[index],
                        //         height: h * 0.03,
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        CommonIconButton(
                            containerwidth: h * 0.055,
                            containerheight: h * 0.055,
                            backgroundColor: AppColors.colorPrimary,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(100)),
                            centericon: Center(
                              child: Image.asset(
                                imgList[index],
                                height: h * 0.03,
                              ),
                            ),
                            onPressed: () {
                              commonNavigator(
                                  context: context,
                                  duration: Duration(milliseconds: 400),
                                  child: ViewAllCategory(title: title),
                                  type: PageTransitionType.rightToLeftWithFade);
                            }),
                        Flexible(
                          child: CommonText(
                              text: nameList[index],
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.8),
                                fontSize: h * 0.014,
                                fontWeight: FontWeight.w600,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
            childAspectRatio: 0.6,
            crossAxisSpacing: w * 0.005,
            mainAxisSpacing: 0,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 5,
            maxCrossAxisExtent: w * 0.21,
            mainAxisExtent: h * 0.12,
          )
        else
          CommonListView(
              itemCount: imgList.length,
              scrollDirection: scrollDirection,
              shrinkWrap: shrinkWrap,
              padding: padding,
              width: width,
              height: height,
              itemBuilder: (context, index) {
                return OpenContainerWrapper(
                  transitionDuration: Duration(milliseconds: 800),
                  closedBuilder:
                      (BuildContext context, void Function() action) {
                    return Padding(
                      padding: EdgeInsets.only(
                        left: index == 0 ? w * 0.05 : w * 0.02,
                      ),
                      child: Card(
                        color: contColor,
                        elevation: 5,
                        shape: RoundedRectangleBorder(
                          borderRadius: borderRadius!,
                        ),
                        child: Container(
                          width: contwidth,
                          height: contheight,
                          decoration: BoxDecoration(
                            color: contColor,
                            borderRadius: borderRadius,
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: w * 0.02,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(vertical: h * 0.014),
                                  child: Stack(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: Image.asset(
                                              AppImg.homelist,
                                              height: contwidth! * 0.85,
                                              width: contwidth! * 0.85,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Positioned(
                                        top: h * 0.01,
                                        right: isFeature == true ? 0 : w * 0.05,
                                        left: isFeature == true ? 0 : w * 0.05,
                                        child: Row(
                                          mainAxisAlignment: isFeature == true
                                              ? MainAxisAlignment.spaceEvenly
                                              : MainAxisAlignment.end,
                                          children: [
                                            if (isFeature == true)
                                              Container(
                                                height: h * 0.03,
                                                width: contwidth! * 0.45,
                                                decoration: BoxDecoration(
                                                    color: AppColors.yellow,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            3)),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                      AppImg.lightning,
                                                      height: h * 0.02,
                                                    ),
                                                    CommonText(
                                                        text: AppText.featured,
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: ptSansTextStyle(
                                                          color: AppColors.black
                                                              .withOpacity(0.8),
                                                          fontSize: h * 0.014,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        )),
                                                  ],
                                                ),
                                              ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                CommonIconButton(
                                                  containerwidth: h * 0.03,
                                                  containerheight: h * 0.03,
                                                  backgroundColor:
                                                      favList[index] == false
                                                          ? AppColors.starcolor
                                                          : AppColors
                                                              .selectedstar,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              1000)),
                                                  centericon: Center(
                                                    child: Icon(
                                                      Icons.star,
                                                      color: AppColors.white,
                                                      size: h * 0.011,
                                                    ),
                                                  ),
                                                  onPressed: () {
                                                    controller()
                                                        .onFavTap(index, type!);
                                                  },
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                    Flexible(
                                      child: CommonText(
                                          text: nameList[index],
                                          maxLines: 1,
                                          style: ptSansTextStyle(
                                            color: AppColors.black
                                                .withOpacity(0.8),
                                            fontSize: h * 0.02,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w700,
                                          )),
                                    ),
                                  ],
                                ),
                                Container(
                                  width: contwidth,
                                  child: IntrinsicHeight(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CommonText(
                                          text: AppText.price25k,
                                          style: ptSansTextStyle(
                                              fontSize: h * 0.018,
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                        VerticalDivider(
                                          color:
                                              AppColors.black.withOpacity(0.3),
                                          width: 1,
                                          thickness: 1,
                                        ),
                                        ShaderMask(
                                          shaderCallback: (Rect bounds) {
                                            return const LinearGradient(
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight,
                                                colors: [
                                                  AppColors.colorPrimary,
                                                  AppColors.colorSecondary
                                                ]).createShader(bounds);
                                          },
                                          child: Icon(
                                              Icons.location_on_outlined,
                                              color: AppColors.white,
                                              size: h * 0.025),
                                        ),
                                        Expanded(
                                          child: CommonText(
                                            text: AppText.thane,
                                            maxLines: 1,
                                            style: ptSansTextStyle(
                                                fontSize: h * 0.015,
                                                color: AppColors.black
                                                    .withOpacity(0.3),
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                CommonText(
                                  text: AppText.forpermonth,
                                  style: TextStyle(
                                      fontSize: w * 0.04,
                                      color: AppColors.black.withOpacity(0.3),
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  transitionType: ContainerTransitionType.fade,
                  onClosed: (bool? data) {
                    if (data ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('Marked as done!'),
                      ));
                    }
                  },
                  child: CategoryDetailsScreen(
                    title: nameList[index],
                  ),
                );
              })
      ],
    );
  }
}
