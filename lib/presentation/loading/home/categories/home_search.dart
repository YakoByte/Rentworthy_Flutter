import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_searchbar.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/images.dart';
import '../../../../utils/text.dart';
import '../home_screen_controller.dart';

class HomeSearch extends ConsumerWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeScreenControllerProvider);
    controller() => ref.read(homeScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: Container(
        height: h * 0.3,
        width: w,
        child: Stack(
          children: [
            Container(
              height: h * 0.25,
              width: w,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.colorPrimary,
                        AppColors.colorSecondary
                      ]),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.only(left: w * 0.04, bottom: h * 0.02),
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
              child: CommonSearchBar(
                containerwidth: w * 0.8,
                containerheight: h * 0.07,
                searchController: controller().searchController,
                onsearchChanged: (str) {
                  controller()
                      .filterSearchResults(controller().searchController.text);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
