import 'package:flutter/material.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/icon_text.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';

part 'user_prof_screen_controller.g.dart';

@riverpod
class BusinessUserProfController extends _$BusinessUserProfController {
  List<bool>? favlist;

  List<bool> get getfavlist => favlist!;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> productlist = [];

  List<String> get getproductlist => productlist!;

  List<PopupMenuItem> _popupitemList = [];

  List<PopupMenuItem> get popupitemList => _popupitemList;

  TabController tabController =
      TabController(length: 2, vsync: CommonTickerProvider());
  int _selectedTab = 0;
  List<AnimationController>? animatecontrollerlist = [];

  int get selectedtab => _selectedTab;

  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeOutDoor,
    AppImg.electronics,
    AppImg.star,
    AppImg.guitar,
    AppImg.cleaner,
    AppImg.clothing,
    AppImg.setting,
    AppImg.newTag,
  ];

  List<String> get imgList => _imgList;
  final List<String> _nameList = [
    AppText.film,
    AppText.partyEvents,
    AppText.homeOutDoor,
    AppText.electronics,
    AppText.topRent,
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavyMachine,
    AppText.newMarket,
  ];

  List<String> get nameList => _nameList;

  @override
  FutureOr<void> build() async {
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    state = const AsyncLoading();
    _isLoading = true;
    for (int i = 0; i < _nameList.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
      ));
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        Future.delayed(const Duration(milliseconds: 400), () {
          animatecontrollerlist![0].forward();
          if (i != (animatecontrollerlist!.length - 1)) {
            animatecontrollerlist![i + 1].forward();
          }
        });
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncLoading();
    for (int i = 0; i < 5; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
      ));
      Future.delayed(const Duration(milliseconds: 400), () {
        animatecontrollerlist![0].forward();
        if (i != (animatecontrollerlist!.length - 1)) {
          animatecontrollerlist![i + 1].forward();
        }
      });
    }
    state = const AsyncValue.data(null);
    _popupitemList = [
      PopupMenuItem(
        value: 1,
        onTap: () {
          Share.share('check out my website https://example.com');
        },
        child: IconText(
          isCenter: false,
          title: "Share Profile",
          textStyle: ptSansTextStyle(
              fontSize: w * 0.035,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
          subimg: false,
          preimg: true,
          preicon: Icons.share_outlined,
          preiconsize: h * 0.03,
          preimgcolor: AppColors.black.withOpacity(0.8),
        ),
      ),
      // PopupMenuItem(
      //   value: 2,
      //   onTap: () {},
      //   child: IconText(
      //     isCenter: false,
      //     title: "Report User",
      //     textStyle: ptSansTextStyle(
      //         fontSize: w * 0.035,
      //         overflow: TextOverflow.ellipsis,
      //         color: AppColors.black,
      //         fontWeight: FontWeight.w600),
      //     subimg: false,
      //     preimg: true,
      //     preimgname: AppImg.accountoff,
      //     preiconsize: h * 0.03,
      //     preimgcolor: AppColors.black,
      //   ),
      // ),
    ];

    favlist = List.generate(nameList.length, (index) => false);
    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }
}
