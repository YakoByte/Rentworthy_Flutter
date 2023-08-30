import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../color.dart';
import '../images.dart';
import '../text.dart';
import 'common_text.dart';

class HorizonVertList extends ConsumerWidget {
  String title;
  bool isViewAll;
  bool isCategory;
  bool isFeature;
  bool isTopPadding;
  bool isFavIcon;
  List<AnimationController> animatecontrollerlist;
  bool shrinkWrap;
  bool isextended;
  Widget? lastrow;
  Widget? favrow;
  List imgList;
  List nameList;
  List favList;
  void Function() onPressed;
  Axis scrollDirection;
  double width;
  int? type;
  int index;
  double height;
  double contwidth;
  double contheight;
  Color? contColor;
  BorderRadiusGeometry borderRadius;
  EdgeInsetsGeometry? padding;

  HorizonVertList(
      {super.key,
      required this.title,
      required this.favrow,
      required this.shrinkWrap,
      required this.width,
      required this.onPressed,
      required this.index,
      required this.isFavIcon,
      required this.isTopPadding,
      required this.animatecontrollerlist,
      required this.isextended,
      this.type,
      this.lastrow,
      required this.contwidth,
      required this.borderRadius,
      required this.height,
      required this.contheight,
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
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return scrollDirection == Axis.horizontal
        ? Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? w * 0.05 : w * 0.02,
            ),
            child: Card(
              color: contColor ?? AppColors.white,
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadius,
              ),
              child: Container(
                width: contwidth,
                height: contheight,
                decoration: BoxDecoration(
                  color: contColor ?? AppColors.white,
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
                        padding: EdgeInsets.symmetric(vertical: h * 0.014),
                        child: Stack(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
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
                                              BorderRadius.circular(3)),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Image.asset(
                                            AppImg.lightning,
                                            height: h * 0.02,
                                          ),
                                          CommonText(
                                              text: AppText.featured,
                                              textAlign: TextAlign.center,
                                              style: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.8),
                                                fontSize: h * 0.014,
                                                fontWeight: FontWeight.w700,
                                              )),
                                        ],
                                      ),
                                    ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      GestureDetector(
                                        onTap: onPressed,
                                        child: CircleAvatar(
                                          backgroundColor:
                                              favList[index] == false
                                                  ? AppColors.starcolor
                                                  : AppColors.selectedstar,
                                          radius: h * 0.023,
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Icon(
                                                Icons.star,
                                                color: AppColors.white,
                                                size: h * 0.03,
                                              ),
                                            ],
                                          ),
                                        ),
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
                                  color: AppColors.black.withOpacity(0.8),
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              CommonText(
                                text: AppText.price25k,
                                style: ptSansTextStyle(
                                    fontSize: h * 0.018,
                                    color: AppColors.black,
                                    fontWeight: FontWeight.w700),
                              ),
                              VerticalDivider(
                                color: AppColors.black.withOpacity(0.3),
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
                                child: Icon(Icons.location_on_outlined,
                                    color: AppColors.white, size: h * 0.025),
                              ),
                              Expanded(
                                child: CommonText(
                                  text: AppText.thane,
                                  maxLines: 1,
                                  style: ptSansTextStyle(
                                      fontSize: h * 0.015,
                                      color: AppColors.black.withOpacity(0.3),
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
                        style: ptSansTextStyle(
                            fontSize: w * 0.04,
                            color: AppColors.black.withOpacity(0.3),
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        : Padding(
                padding: index == 0
                    ? isTopPadding
                        ? EdgeInsets.only(top: h * 0.05)
                        : EdgeInsets.zero
                    : EdgeInsets.zero,
                child: Card(
                  color: AppColors.white,
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14)),
                  child: Container(
                    height: favrow != null ? h * 0.22 : h * 0.15,
                    width: w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: AppColors.white),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.02, vertical: h * 0.012),
                      child: Column(
                        children: [
                          if (isFavIcon == false && favrow != null) favrow!,
                          Row(
                            mainAxisAlignment: isFavIcon == false
                                ? MainAxisAlignment.start
                                : MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                height: favrow != null ? h * 0.14 : h * 0.12,
                                width: w * 0.24,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(14),
                                  child: Image.asset(
                                    AppImg.homelist,
                                    height:
                                        favrow != null ? h * 0.14 : h * 0.12,
                                    width: w * 0.24,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Container(
                                width: w * 0.5,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: w * 0.02,
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CommonText(
                                        style: ptSansTextStyle(
                                            fontSize: w * 0.04,
                                            color: AppColors.black,
                                            overflow: TextOverflow.ellipsis,
                                            fontWeight: FontWeight.w700),
                                        text: nameList[index],
                                      ),
                                      Container(
                                        width: w * 0.6,
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
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              VerticalDivider(
                                                color: AppColors.black
                                                    .withOpacity(0.3),
                                                width: 1,
                                                thickness: 1,
                                              ),
                                              ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return const LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
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
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w400),
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
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Container(
                                        width: w * 0.5,
                                        child: isextended == false
                                            ? Row(children: [
                                                Flexible(
                                                  child: CommonText(
                                                    text:
                                                        AppText.extendedrental,
                                                    maxLines: 1,
                                                    style: ptSansTextStyle(
                                                        fontSize: w * 0.038,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        color: AppColors.black
                                                            .withOpacity(0.4),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                )
                                              ])
                                            : lastrow,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              if (isFavIcon == true)
                                Container(
                                  height: h * 0.12,
                                  width: w * 0.12,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      if (isFavIcon == true)
                                        GestureDetector(
                                          onTap: onPressed,
                                          child: CircleAvatar(
                                            backgroundColor:
                                                favList[index] == false
                                                    ? AppColors.starcolor
                                                    : AppColors.selectedstar,
                                            radius: h * 0.023,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  Icons.star,
                                                  color: AppColors.white,
                                                  size: h * 0.03,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
            .animate(
                controller: animatecontrollerlist![index],
                onComplete: (controller1) {
                  for (int i = 0; i < (animatecontrollerlist.length - 1); i++) {
                    animatecontrollerlist![i + 1].forward();
                  }
                },
                autoPlay: false)
            .fadeIn(duration: ((index * 40) + 100).ms)
            .then(delay: ((index * 40) + 100).ms)
            .slideX(
              begin: 1,
              end: 0,
              curve: Curves.easeInOutCubic,
              duration: 500.ms,
            );
  }
}
