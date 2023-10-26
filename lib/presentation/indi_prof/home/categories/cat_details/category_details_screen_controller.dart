import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import '../../../../../application/dialog/dialog_service.dart';
import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../dialogs/widgets/date_picker/date_picker_manager.dart';

part 'category_details_screen_controller.g.dart';

@riverpod
class CategoryDetailsController extends _$CategoryDetailsController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  DateRangePickerController _pickerController = DateRangePickerController();

  DateRangePickerController get pickerController => _pickerController;

  CarouselController carouselController = CarouselController();
  List<PopupMenuItem> _popupitemList = [];

  List<PopupMenuItem> get popupitemList => _popupitemList;
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

  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  @override
  FutureOr<void> build() async {
    state = const AsyncValue.loading();
    state = const AsyncLoading();
    _isLoading = true;

    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    _popupitemList = [
      PopupMenuItem(
        value: 1,
        child: IconText(
          isCenter: false,
          title: AppText.addToFavorite,
          textStyle: ptSansTextStyle(
              fontSize: w * 0.035,
              overflow: TextOverflow.ellipsis,
              color: AppColors.black,
              fontWeight: FontWeight.w600),
          subimg: false,
          preimg: true,
          preicon: Icons.star_border,
          preiconsize: h * 0.03,
          preimgcolor: AppColors.black.withOpacity(0.8),
        ),
      ),
      PopupMenuItem(
        value: 2,
        onTap: () {
          Share.share('check out my website https://example.com');
        },
        child: IconText(
          isCenter: false,
          title: AppText.share,
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
      PopupMenuItem(
        value: 3,
        onTap: () {
          ref.read(dialogServiceProvider).reportImgTitleDialog();
        },
        child: IconText(
          isCenter: false,
          title: AppText.reportThisAd,
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
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      state = const AsyncValue.data(null);
    });
  }

  /// This function is used to change the current page index of the carousel
  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }
}
