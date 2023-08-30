import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/globals.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_dropdown.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/images.dart';
import '../home_screen_controller.dart';

class HomeAppBar extends ConsumerWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeScreenControllerProvider);
    controller() => ref.read(homeScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: h * 0.06,
                child: InkWell(
                  onTap: () {
                    Globals.scaffoldKey.currentState!.openDrawer();
                  },
                  child: Image.asset(
                    AppImg.menu,
                    height: h * 0.03,
                    width: h * 0.03,
                  ),
                ),
              ),
              CommonDropdown(
                selectedItem: controller().selectedLocation!,
                items: controller().locationList,
                dropdownicon: Padding(
                  padding: EdgeInsets.only(right: w * 0.01),
                  child: Icon(Icons.location_on,
                      color: AppColors.black.withOpacity(0.8), size: h * 0.025),
                ),
                dropdowntitle: Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: h * 0.015, horizontal: w * 0.025),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(right: w * 0.01),
                            child: Icon(Icons.my_location,
                                color: AppColors.black.withOpacity(0.8),
                                size: h * 0.03),
                          ),
                          CommonText(
                            text: "Use current location",
                            style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.8),
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.01),
                      Divider(
                        color: AppColors.black.withOpacity(0.1),
                        height: h * 0.01,
                        thickness: 2,
                      ),
                    ],
                  ),
                ),
                dropdownDecoratorProps: DropDownDecoratorProps(
                    textAlignVertical: TextAlignVertical.bottom,
                    dropdownSearchDecoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on_sharp,
                          color: AppColors.black, size: h * 0.025),
                      border: InputBorder.none,
                      hintText: "Select Location",
                      hintStyle: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.4),
                          fontSize: h * 0.017,
                          fontWeight: FontWeight.w500),
                    ),
                    baseStyle: ptSansTextStyle(
                        color: AppColors.black.withOpacity(0.8),
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w700)),
                clearButtonProps: ClearButtonProps(isVisible: false),
                dropdownButtonProps: DropdownButtonProps(
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
                  controller().onValSelect(val: str!);
                },
                enabled: true,
                isExpanded: true,
                containerwidth: w * 0.5,
                containerheight: h * 0.075,
                containercolor: AppColors.white,
                elevation: 0,
              ),
            ],
          ),
          Container(
            height: h * 0.06,
            child: Image.asset(
              AppImg.bell,
              height: h * 0.03,
              width: h * 0.03,
            ),
          ),
        ],
      ),
    );
  }
}
