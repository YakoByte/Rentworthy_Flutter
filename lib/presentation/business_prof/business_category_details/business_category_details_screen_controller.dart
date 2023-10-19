import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:share_plus/share_plus.dart';
import '../../../application/business_prof/product_details/product_details_service.dart';
import '../../../application/business_prof/track_item/track_item_service.dart';
import '../../../application/dialog/dialog_service.dart';
import '../../../model/business_prof/product_details/get_product_details/get_product_details.dart';
import '../../../utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/icon_text.dart';
import '../../../utils/globals.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../../indi_prof/dialogs/widgets/date_picker/date_picker_manager.dart';

part 'business_category_details_screen_controller.g.dart';

@riverpod
class BusinessCatDetailsController extends _$BusinessCatDetailsController {
  final List<String> _sortList = [
    'Yearly',
    'Quarterly',
    'Monthly',
    'Weekly',
  ];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<bool>? featureadfavlist;
  DateRangePickerController _pickerController = DateRangePickerController();

  int _selectedcosmetic = 0;

  int get selectedcosmetic => _selectedcosmetic;
  int _selecteditemwork = 0;
  TextEditingController cosmeticcontroller = TextEditingController();
  TextEditingController itemworkscontroller = TextEditingController();
  TextEditingController missingcontroller = TextEditingController();

  int get selecteditemwork => _selecteditemwork;
  int _selectedmssing = 0;

  int get selectedmssing => _selectedmssing;

  DateRangePickerController get pickerController => _pickerController;

  List<bool> get getfeatureadfavlist => featureadfavlist!;

  List<bool>? nearbyadfavlist;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  List<String> get sortList => _sortList;

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
  String? _sorted;

  String? get selectedsorted => _sorted;
  TextEditingController searchController = TextEditingController();
  TextEditingController descController = TextEditingController();
  List<String> searchitems = [];
  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  List<String> get getsearchitems => searchitems;
  int _selectedreason = 0;

  int get selectedreason => _selectedreason;
  ProductDetailsResponse? _productDetailsData;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    _sorted = _sortList[0];
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

    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);
    _productDetailsData =
        await ref.read(productDetailServiceProvider).getProductDetails();
    print("_productDetailsData $_productDetailsData");
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      state = const AsyncValue.data(null);
    });
  }

  oncosmeticval(
    val,
  ) {
    state = const AsyncLoading();
    _selectedcosmetic = val;
    state = const AsyncValue.data(null);
  }

  onitemworksval(
    val,
  ) {
    state = const AsyncLoading();
    _selecteditemwork = val;
    state = const AsyncValue.data(null);
  }

  onmissingval(
    val,
  ) {
    state = const AsyncLoading();
    _selectedmssing = val;
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
    _sorted = val;
    state = const AsyncValue.data(null);
  }
}
