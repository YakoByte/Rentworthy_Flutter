import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../application/dialog/dialod_service.dart';
import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../dialogs/widgets/date_picker/date_picker_manager.dart';

part 'category_details_screen_controller.g.dart';

@riverpod
class CategoryDetailsController extends _$CategoryDetailsController {
  final List<String> _locationList = [
    'Wagle state',
    'Mumbra',
    'Mulund',
    'Dadar',
    'Mahim',
  ];
  List<bool>? featureadfavlist;
  DateRangePickerController _pickerController = DateRangePickerController();

  DateRangePickerController get pickerController => _pickerController;

  List<bool> get getfeatureadfavlist => featureadfavlist!;

  List<bool>? nearbyadfavlist;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  List<String> get locationList => _locationList;

  CarouselController carouselController = CarouselController();
  PageController pageController = PageController();
  List<PopupMenuItem> _popupitemList = [];

  List<PopupMenuItem> get popupitemList => _popupitemList;
  final List<String> _imgList = [
    AppImg.movie,
    AppImg.party,
    AppImg.homeoutdoor,
    AppImg.electronics,
    AppImg.star,
    AppImg.guitar,
    AppImg.cleaner,
    AppImg.clothing,
    AppImg.setting,
    AppImg.newtag,
  ];

  List<String> get imgList => _imgList;
  final List<String> _nameList = [
    AppText.film,
    AppText.partyevents,
    AppText.homeoutdoor,
    AppText.electronics,
    AppText.toprent,
    AppText.music,
    AppText.cleaning,
    AppText.clothing,
    AppText.heavymachine,
    AppText.newmarket,
  ];

  List<String> get nameList => _nameList;
  String? _selectedLocation;

  String? get selectedLocation => _selectedLocation;
  TextEditingController searchController = TextEditingController();
  List<String> searchitems = [];
  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  List<String> get getsearchitems => searchitems;
  int _selectedreason = 0;

  int get selectedreason => _selectedreason;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    _popupitemList = [
      PopupMenuItem(
        value: 1,
        child: IconText(
          isCenter: false,
          title: AppText.addtofavorite,
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
          ref.read(dialogServiceProvider).reportimgtitledialog(
              groupValue: _selectedreason,
              onChangedval: (val) {
                onReasonval(val);
              });
        },
        child: IconText(
          isCenter: false,
          title: AppText.reportthisad,
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
    _selectedLocation = _locationList[0];
    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);

    state = const AsyncValue.data(null);
  }

  onFavTap(int index, int type) {
    state = const AsyncLoading();
    if (type == 0) {
      if (featureadfavlist![index] == true) {
        featureadfavlist![index] = false;
      } else {
        featureadfavlist![index] = true;
      }
    } else if (type == 1) {
      if (nearbyadfavlist![index] == true) {
        nearbyadfavlist![index] = false;
      } else {
        nearbyadfavlist![index] = true;
      }
    } else if (type == 2) {
      if (popularfavlist![index] == true) {
        popularfavlist![index] = false;
      } else {
        popularfavlist![index] = true;
      }
    }

    state = const AsyncValue.data(null);
  }

  onReasonval(
    val,
  ) {
    state = const AsyncLoading();
    _selectedreason = val;
    state = const AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }

  void filterSearchResults(String query) {
    state = const AsyncLoading();
    // searchitems = carlist
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    print("searchitems $searchitems");
    state = const AsyncValue.data(null);
  }

  onValSelect({required String val}) async {
    state = const AsyncLoading();
    _selectedLocation = val;
    state = const AsyncValue.data(null);
  }
}
