import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/loading/chat/selling/suball/selling_suball.dart';
import 'package:rentworthy/presentation/loading/chat/selling/subunread/selling_subunread.dart';

import '../../../../utils/color.dart';
import '../../../../utils/common_components/common_text.dart';
import '../../../../utils/text.dart';
import 'meeting/selling_submeeting.dart';

class SellingChat extends ConsumerWidget {
  const SellingChat({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 3,
      child: Column(
        children: <Widget>[
          Container(
            child: TabBar(
                indicatorWeight: 0,
                indicatorPadding: EdgeInsets.symmetric(
                    vertical: h * 0.005, horizontal: w * 0.03),
                unselectedLabelStyle: ptSansTextStyle(
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: <Color>[
                          AppColors.colorPrimary,
                          AppColors.colorSecondary
                        ],
                      ).createShader(const Rect.fromLTRB(150, 0, 250, 20)),
                    fontSize: h * 0.019,
                    fontWeight: FontWeight.w500),
                dividerColor: Colors.transparent,
                unselectedLabelColor: AppColors.transparent,
                indicatorSize: TabBarIndicatorSize.tab,
                labelStyle: ptSansTextStyle(
                    color: AppColors.white,
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.w700),
                indicator: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.colorPrimary,
                      AppColors.colorSecondary,
                    ]),
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.redAccent),
                tabs: [
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppText.all,
                        style: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.025,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppText.meeting,
                        style: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.025,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  Tab(
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        AppText.unread,
                        style: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.025,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ]),
          ),
          Container(
            height: h * 0.69,
            child: TabBarView(children: [
              SellingAll(),
              SellingMeeting(),
              SellingUnread(),
            ]),
          ),
        ],
      ),
    );
  }
}
