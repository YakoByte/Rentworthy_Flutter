import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      body: SafeArea(
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
                child: Container(
                  width: w,
                  height: h,
                  child: Categories(
                      isFavIcon: true,
                      title: "",
                      isextended: true,
                      onCardPressed: () {},
                      shrinkWrap: true,
                      lastrow: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(1000),
                            child: Image.asset(
                              AppImg.homelist,
                              height: h * 0.035,
                              width: h * 0.035,
                              fit: BoxFit.cover,
                            ),
                          ),
                          CommonText(
                            text: "Rented by Stacy on 23 June 023",
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
                      isTopPadding: true,
                      height: controller().imgList.length * h * 0.083,
                      favList: controller().getfavlist,
                      scrollDirection: Axis.vertical,
                      nameList: controller().nameList,
                      imgList: controller().imgList,
                      isCategory: false,
                      isFeature: false,
                      isViewAll: false),
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
    );
  }
}
