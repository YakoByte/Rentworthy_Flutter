import 'package:flutter/material.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/common_tickerprovider.dart';
import '../../../utils/common_components/icon_text.dart';
import '../../../utils/globals.dart';
import '../../../utils/text.dart';

part 'chat_screen_controller.g.dart';

@riverpod
class ChatScreenController extends _$ChatScreenController {
  TextEditingController textEditingController = TextEditingController();
  late ScrollController scrollController = ScrollController();
  AnimationController? divideranimationController;
  AnimationController? closeanimationController;

  List<String> questionList = [
    "Do you offer extended rentals?",
    "Is it available?",
    "Do you deliver?",
    "What’s your location?",
    "How is the condition of this item?"
  ];
  bool isShow = false;

  bool get getisShow => isShow;

  List<String> get getquestionList => questionList;
  List<PopupMenuItem> _popupitemList = [];

  List<PopupMenuItem> get popupitemList => _popupitemList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    divideranimationController = AnimationController(
      vsync: CommonTickerProvider(),
      duration: const Duration(milliseconds: 800),
    );
    closeanimationController = AnimationController(
      vsync: CommonTickerProvider(),
      duration: const Duration(milliseconds: 800),
    );
    closeanimationController!.forward();
    _popupitemList = [
      PopupMenuItem(
        value: 1,
        child: IconText(
          isCenter: false,
          title: AppText.reportuser,
          textStyle: ptSansTextStyle(
              fontSize: w * 0.035,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
          subimg: false,
          preimg: true,
          preimgname: AppImg.reportuser,
          preiconsize: h * 0.03,
          preimgcolor: AppColors.black.withOpacity(0.9),
        ),
      ),
      PopupMenuItem(
        value: 2,
        child: IconText(
          isCenter: false,
          title: AppText.block,
          textStyle: ptSansTextStyle(
              fontSize: w * 0.035,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
          subimg: false,
          preimg: true,
          preicon: Icons.block_flipped,
          preiconsize: h * 0.03,
          preimgcolor: AppColors.black.withOpacity(0.8),
        ),
      ),
    ];
    WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());

    state = const AsyncValue.data(null);
  }

  openchat({required bool val}) async {
    state = const AsyncLoading();
    if (val == true) {
      divideranimationController!.duration = const Duration(milliseconds: 800);
      divideranimationController!.repeat();
      divideranimationController!.forward();
      if (divideranimationController!.isAnimating) {
        isShow = val;
        WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
      }
    } else {
      isShow = val;
      closeanimationController!.forward();
      WidgetsBinding.instance!.addPostFrameCallback((_) => _scrollToEnd());
    }

    state = const AsyncValue.data(null);
  }

  _scrollToEnd() async {
    if (scrollController.positions.isNotEmpty) {
      scrollController.jumpTo(scrollController.position.maxScrollExtent);
    }
  }
}
