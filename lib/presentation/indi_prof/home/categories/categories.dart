import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/indi_prof/home/categories/view_all_cat/view_all_category.dart';

import 'package:rentworthy/utils/common_components/common_iconbutton.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_gridview.dart';
import '../../../../utils/common_components/common_hor_ver_list.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/open_container_wrapper.dart';
import '../../../../utils/globals.dart';
import '../../../../utils/text.dart';
import '../home_screen_controller.dart';
import 'cat_details/category_details_screen.dart';

class Categories extends ConsumerWidget {
  String title;
  bool isViewAll;
  bool isTopPadding;
  bool isextended;
  bool isCategory;
  bool isFavIcon;
  bool isFeature;
  bool shrinkWrap;
  List imgList;
  Widget? favrow;
  List nameList;
  List<AnimationController> animatecontrollerlist;
  List favList;
  // List rentedTypeList;
  Axis scrollDirection;

  void Function(int) onFavPressed;
  Widget? onCardPressed;
  int? type;
  Widget? lastrow;
  double height;
  double width;
  double? contwidth;
  double? contheight;
  Color? contColor;
  BorderRadiusGeometry? borderRadius;
  EdgeInsetsGeometry? padding;

  Categories(
      {super.key,
      required this.title,
      required this.shrinkWrap,
      required this.isFavIcon,
      required this.animatecontrollerlist,
      required this.isTopPadding,
      required this.isextended,
      // required this.rentedTypeList,
      required this.onFavPressed,
      this.type,
      this.onCardPressed,
      this.favrow,
      this.lastrow,
      this.borderRadius,
      required this.height,
      this.contheight,
      this.contwidth,
      required this.width,
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
        if (title != "")
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
                          child: ViewAllCategory());
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
                          text: AppText.viewAll,
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
                  InkWell(
                    onTap: () {
                      onFavPressed(index);
                    },
                    child: Container(
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
                                    child: ViewAllCategory(),
                                    type:
                                        PageTransitionType.rightToLeftWithFade);
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
                    return HorizonVertList(
                      favrow: favrow,
                      animatecontrollerlist: animatecontrollerlist,
                      isTopPadding: isTopPadding,
                      title: title,
                      isextended: isextended,
                      isFavIcon: isFavIcon,
                      shrinkWrap: shrinkWrap,
                      width: width,
                      borderRadius: borderRadius ?? BorderRadius.circular(10),
                      onPressed: () {
                        onFavPressed(index);
                      },
                      index: index,
                      height: height,
                      lastrow: lastrow,
                      favList: favList,
                      scrollDirection: scrollDirection,
                      imgList: imgList,
                      nameList: nameList,
                      isCategory: isCategory,
                      isFeature: isFeature,
                      isViewAll: isViewAll,
                      contwidth: contwidth ?? width,
                      contheight: contheight ?? height,
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
                  child: onCardPressed != null
                      ? onCardPressed!
                      : CategoryDetailsScreen(
                          title: nameList[index],
                        ),
                );
              })
      ],
    );
  }
}
