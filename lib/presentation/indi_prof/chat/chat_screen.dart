import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/presentation/indi_prof/chat/selling/selling_chat.dart';
import 'package:rentworthy/presentation/indi_prof/chat/unread/unread_chat.dart';
import 'package:rentworthy/utils/common_components/common_appbar.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import 'all/all_chat.dart';

class ChatScreen extends ConsumerWidget {
  bool frombottom;

  ChatScreen({super.key, required this.frombottom});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
          centerwidget: CommonText(
              text: AppText.chats,
              style: ptSansTextStyle(
                  color: AppColors.black,
                  fontSize: h * 0.028,
                  fontWeight: FontWeight.w600)),
          // .animate()
          // .fadeIn(duration: 100.ms)
          // .then(delay: 100.ms)
          // .slideY(
          //     begin: 10,
          //     end: 0,
          //     curve: Curves.easeInOutCubic,
          //     duration: 1000.ms),
          leadingicon: !frombottom,
          centerTitle: false,
          padding: EdgeInsets.symmetric(horizontal: w * 0.025),
          backgroundColor: AppColors.white),
      body: Container(
        height: h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: w * 0.025),
          child: DefaultTabController(
            length: 3,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: AppColors.transparent,
                        unselectedLabelStyle: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.6),
                            fontSize: h * 0.019,
                            fontWeight: FontWeight.w500),
                        labelStyle: ptSansTextStyle(
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: <Color>[
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary
                                ],
                              ).createShader(
                                  const Rect.fromLTRB(150, 0, 250, 20)),
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w700),
                        tabs: [
                          Tab(text: AppText.all),
                          Tab(text: AppText.unread),
                          Tab(text: AppText.selling),
                        ]),
                  ),
                  // .animate()
                  // .fadeIn(duration: 110.ms)
                  // .then(delay: 110.ms)
                  // .slideY(
                  //     begin: 14,
                  //     end: 0,
                  //     curve: Curves.easeInOutCubic,
                  //     duration: 1000.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: h * 0.02, horizontal: w * 0.021),
                    child: CommonText(
                        text: AppText.quickfilter,
                        style: ptSansTextStyle(
                            color: AppColors.black.withOpacity(0.6),
                            fontSize: h * 0.02,
                            fontWeight: FontWeight.w700)),
                  ),
                  // .animate()
                  // .fadeIn(duration: 120.ms)
                  // .then(delay: 120.ms)
                  // .slideY(
                  //     begin: 14,
                  //     end: 0,
                  //     curve: Curves.easeInOutCubic,
                  //     duration: 1000.ms),
                  Container(
                    height: h * 0.75,
                    child: const TabBarView(children: [
                      AllChat(),
                      UnreadChat(),
                      SellingChat(),
                    ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
