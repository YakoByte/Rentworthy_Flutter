import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
        children: [
          Row(
            children: [
              Image.asset(
                AppImg.menu,
                height: h * 0.03,
                width: h * 0.03,
              ),
              CommonDropdown(
                  onChanged: (value) {
                    controller().onValSelect(val: value!);
                  },
                  elevation: 0,
                  dropdownValue: controller().selectedLocation,
                  prefix: SizedBox(
                    height: h * 0.03,
                    width: h * 0.03,
                    child: Icon(Icons.location_on_sharp,
                        color: AppColors.black, size: h * 0.025),
                  ),
                  icon: SizedBox(
                    height: h * 0.03,
                    width: h * 0.03,
                    child: Icon(Icons.keyboard_arrow_down_sharp,
                        color: AppColors.black, size: h * 0.025),
                  ),
                  isExpanded: true,
                  itemslist: controller().locationList,
                  isDense: false,
                  containerwidth: w * 0.5,
                  containerheight: h * 0.075,
                  containercolor: AppColors.white,
                  textstyle: ptSansTextStyle(
                      color: AppColors.black.withOpacity(0.4),
                      fontSize: h * 0.02,
                      fontWeight: FontWeight.w700)),
            ],
          ),
          Image.asset(
            AppImg.bell,
            height: h * 0.03,
            width: h * 0.03,
          ),
        ],
      ),
    );
  }
}
