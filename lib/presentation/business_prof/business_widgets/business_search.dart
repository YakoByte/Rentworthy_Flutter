import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_searchbar.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/globals.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../admin_panel/admin_panel_controller.dart';

class BusinessSearch extends ConsumerWidget {
  final adminscaffoldKey;

  BusinessSearch({super.key, required this.adminscaffoldKey});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(adminPanelControllerProvider);
    controller() => ref.read(adminPanelControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.0, vertical: h * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CommonIconButton(
              containerwidth: w * 0.1,
              containerheight: h * 0.06,
              backgroundColor: AppColors.white,
              shape: LinearBorder.none,
              centericon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.menu_open,
                      color: AppColors.black, size: h * 0.035),
                ],
              ),
              onPressed: () {
                adminscaffoldKey.currentState?.openDrawer();
              }),
          CommonSearchBar(
            containerwidth: w * 0.7,
            containerheight: h * 0.055,
            containercolor: AppColors.black.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10),
            suffixicon: SizedBox(),
            borderColor: AppColors.black.withOpacity(0.1),
            searchController: controller().searchController,
            onsearchChanged: (str) {
              controller()
                  .filterSearchResults(controller().searchController.text);
            },
          ),
          CommonIconButton(
              containerwidth: w * 0.1,
              containerheight: h * 0.06,
              backgroundColor: AppColors.white,
              shape: LinearBorder.none,
              centericon: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImg.bellOutline,
                    height: h * 0.03,
                    width: h * 0.03,
                  ),
                ],
              ),
              onPressed: () {}),
        ],
      ),
    );
  }
}
