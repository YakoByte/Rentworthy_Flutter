import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/home/categories/category_details_screen.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_gridview.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/common_components/open_container_wrapper/open_container_wrapper.dart';
import '../../../../utils/text.dart';
import '../home_screen_controller.dart';

class Categories extends ConsumerWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeScreenControllerProvider);
    controller() => ref.read(homeScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CommonText(
                text: AppText.categories,
                style: ptSansTextStyle(
                  color: AppColors.black.withOpacity(0.8),
                  fontSize: h * 0.022,
                  fontWeight: FontWeight.w700,
                )),
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
          ],
        ),
        CommonGridView(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.only(top: h * 0.02),
          width: w,
          height: h * 0.4,
          itemBuilder: (context, index) {
            return OpenContainerWrapper(
              closedBuilder: (BuildContext context, void Function() action) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      width: w * 0.2,
                      height: h * 0.12,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: h * 0.07,
                            width: h * 0.07,
                            decoration: BoxDecoration(
                              color: AppColors.colorPrimary,
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: Center(
                              child: Image.asset(
                                controller().imgList[index],
                                height: h * 0.05,
                              ),
                            ),
                          ),
                          CommonText(
                              text: controller().nameList[index],
                              textAlign: TextAlign.center,
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.8),
                                fontSize: h * 0.015,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                  ],
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
              child: CategoryDetailsScreen(),
            );
          },
          childAspectRatio: 0.6,
          crossAxisSpacing: 0,
          mainAxisSpacing: 0,
          crossAxisCount: 5,
          mainAxisExtent: null,
        )
      ],
    );
  }
}
