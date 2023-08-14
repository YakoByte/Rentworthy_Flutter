import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/home/categories/categories.dart';
import 'package:rentworthy/utils/color.dart';
import 'package:rentworthy/utils/common_components/common_dropdown.dart';
import 'package:rentworthy/utils/common_components/common_text.dart';
import 'package:rentworthy/utils/images.dart';

import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/text.dart';
import 'home_screen_controller.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeScreenControllerProvider);
    controller() => ref.read(homeScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      body: Container(
        width: w,
        height: h,
        color: AppColors.white,
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: w * 0.05),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            AppImg.menu,
                            height: h * 0.03,
                          ),
                          CommonDropdown(
                              onChanged: (value) {
                                controller().onValSelect(val: value!);
                              },
                              elevation: 0,
                              dropdownValue: controller().selectedLocation,
                              prefix: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on_sharp,
                                      color: AppColors.black, size: h * 0.025),
                                ],
                              ),
                              icon: Icon(Icons.keyboard_arrow_down_sharp,
                                  color: AppColors.black, size: h * 0.025),
                              isExpanded: true,
                              itemslist: controller().locationList,
                              isDense: false,
                              containerwidth: w * 0.5,
                              containerheight: h * 0.07,
                              containercolor: AppColors.white,
                              textstyle: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.4),
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w700)),
                        ],
                      ),
                      Image.asset(
                        AppImg.bell,
                        height: h * 0.04,
                      ),
                    ],
                  ),
                  Container(
                    height: h * 0.33,
                    width: w,
                    child: Stack(
                      children: [
                        Container(
                          height: h * 0.29,
                          width: w,
                          decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ]),
                              borderRadius: BorderRadius.circular(16)),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: w * 0.04, bottom: h * 0.02),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  width: w * 0.4,
                                  child: RichText(
                                    textAlign: TextAlign.start,
                                    text: TextSpan(
                                      text: AppText.letsstart,
                                      style: ptSansTextStyle(
                                          color: AppColors.white,
                                          fontSize: h * 0.026,
                                          fontWeight: FontWeight.w400),
                                      children: <TextSpan>[
                                        TextSpan(
                                            text: AppText.outofthings,
                                            style: ptSansTextStyle(
                                                color: AppColors.yellow,
                                                fontSize: h * 0.026,
                                                fontWeight: FontWeight.w400)),
                                      ],
                                    ),
                                  ),
                                ),
                                Image.asset(AppImg.homeimg,
                                    height: h * 0.25, width: w * 0.45)
                              ],
                            ),
                          ),
                        ),

                        ///search bar
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Card(
                                elevation: 1,
                                color: AppColors.white,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50)),
                                child: TextInputField(
                                  hintText: 'Search',
                                  controller: controller().searchController,
                                  keyboardType: TextInputType.text,
                                  containerwidth: w * 0.8,
                                  containerheight: h * 0.07,
                                  underline: false,
                                  containercolor: AppColors.white,
                                  bordercolor: AppColors.white,
                                  borderRadius: BorderRadius.circular(50),
                                  onChanged: (str) {
                                    controller().filterSearchResults(
                                        controller().searchController.text);
                                  },
                                  suffixicon: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.mic,
                                          color:
                                              AppColors.gray.withOpacity(0.6),
                                          size: h * 0.03),
                                    ],
                                  ),
                                  textCapitalization: TextCapitalization.none,
                                  textstyle: TextStyle(
                                      fontSize: w * 0.04,
                                      color: AppColors.gray.withOpacity(0.4),
                                      fontWeight: FontWeight.w700),
                                  titletextstyle: TextStyle(
                                      fontSize: w * 0.04,
                                      color: AppColors.gray.withOpacity(0.4),
                                      fontWeight: FontWeight.w700),
                                  hintStyle: TextStyle(
                                      fontSize: w * 0.04,
                                      color: AppColors.gray.withOpacity(0.4),
                                      fontWeight: FontWeight.w700),
                                  errorStyle: TextStyle(
                                      fontSize: w * 0.04,
                                      color: AppColors.gray.withOpacity(0.4),
                                      fontWeight: FontWeight.w700),
                                  prefix: Padding(
                                    padding: EdgeInsets.all(w * 0.03),
                                    child: Icon(
                                      Icons.search,
                                      size: h * 0.03,
                                      color: AppColors.gray.withOpacity(0.6),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Categories(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
