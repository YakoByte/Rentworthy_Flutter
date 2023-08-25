import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/loading/chat/chat_widget/message_screen.dart';
import 'package:rentworthy/utils/color.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';

import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/images.dart';
import '../../chatlist/chat_list.dart';

class AllSubAll extends ConsumerWidget {
  const AllSubAll({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return ChatList(
      itemCount: 3,
      itemBuilder: (BuildContext, index) {
        return Padding(
          padding: EdgeInsets.only(bottom: h * 0.015),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              InkWell(
                onTap: () {
                  commonNavigator(
                    context: context,
                    child: MessageScreen(
                        title: "Ashish Sharma", subtitle: "iphone 11 64 GB"),
                    type: PageTransitionType.rightToLeftWithFade,
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: h * 0.085,
                          width: h * 0.09,
                          child: Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(4),
                                child: Image.asset(
                                  AppImg.homelist,
                                  height: h * 0.065,
                                  width: h * 0.065,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Positioned(
                                bottom: h * 0.005,
                                right: w * 0.01,
                                child: Container(
                                  height: h * 0.05,
                                  width: h * 0.05,
                                  decoration: BoxDecoration(
                                    color: AppColors.white,
                                    border: Border.all(
                                        color: AppColors.white, width: 3),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image.asset(
                                      AppImg.homelist,
                                      height: h * 0.05,
                                      width: h * 0.05,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: w * 0.02,
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CommonText(
                                style: ptSansTextStyle(
                                    fontSize: w * 0.04,
                                    color: AppColors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.w700),
                                text: "Ashish Sharma",
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CommonText(
                                    text: "iphone 11 64 GB",
                                    style: ptSansTextStyle(
                                        fontSize: h * 0.018,
                                        color: AppColors.black.withOpacity(0.6),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: w * 0.02),
                                    child: Image.asset(AppImg.checkall,
                                        height: h * 0.02,
                                        width: h * 0.02,
                                        fit: BoxFit.cover),
                                  ),
                                  CommonText(
                                    text: "Hello",
                                    style: ptSansTextStyle(
                                        fontSize: w * 0.04,
                                        color: AppColors.black.withOpacity(0.4),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        CommonText(
                          text: "02:00 pm",
                          maxLines: 1,
                          style: ptSansTextStyle(
                              fontSize: w * 0.04,
                              overflow: TextOverflow.ellipsis,
                              color: AppColors.black.withOpacity(0.4),
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (index != 2)
                Divider(
                  color: AppColors.black.withOpacity(0.2),
                  height: h * 0.01,
                  thickness: 1,
                )
            ],
          ),
        );
      },
      width: w,
      height: h * 0.7,
    );
  }
}
