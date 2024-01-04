import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/common_components/common_tickerprovider.dart';

part 'booking_screen_controller.g.dart';

@riverpod
class BookingScreenController extends _$BookingScreenController {
  final List<String> _locationList = [
    'Wagle state',
    'Mumbra',
    'Mulund',
    'Dadar',
    'Mahim',
  ];
  List<AnimationController>? animatecontrollerlist = [];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<String> filterlist = [
    "Filter",
    "Color",
    "Price",
    "Categories",
  ];

  List<String> get getfilterlist => filterlist;

  List<String>? selectedfilter;
  TextEditingController searchController = TextEditingController();

  List<String> get getselectedfilter => selectedfilter!;

  List<String> sortlist = [
    "Sort By",
    "Price: high to low",
    "Price: low to high",
    "Ratings",
    "Popularity",
    "Discount",
  ];

  List<String> get getsortlist => sortlist;
  List<String>? selectedsortby;

  List<String> get getselectedselectedsortby => selectedsortby!;
  List<String> searchitems = [];

  List<String> get getsearchitems => searchitems;
  bool? checkboxitems = false;

  bool get getcheckboxitems => checkboxitems!;

  List<bool>? featureadfavlist;

  List<bool> get getfeatureadfavlist => featureadfavlist!;

  List<bool>? nearbyadfavlist;

  List<bool> get getnearbyadfavlist => nearbyadfavlist!;
  List<bool>? popularfavlist;

  List<bool> get getpopularfavlist => popularfavlist!;

  List<String> get locationList => _locationList;

  CarouselController carouselController = CarouselController();
  PageController pageController = PageController();

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
  String? _selectedLocation;

  String? get selectedLocation => _selectedLocation;

  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;

    selectedfilter = filterlist;
    selectedsortby = sortlist;

    state = const AsyncValue.data(null);
    _selectedLocation = _locationList[0];
    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);
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

    state = const AsyncValue.data(null);
  }

  onchangefilter(
    val,
  ) {
    state = const AsyncLoading();
    selectedfilter = val;
    state = const AsyncValue.data(null);
  }

  onchangecheckbox(
    val,
  ) {
    state = const AsyncLoading();
    checkboxitems = val;
    // print("checkboxitems $checkboxitems");
    state = const AsyncValue.data(null);
  }

  onchangesorting(
    val,
  ) {
    state = const AsyncLoading();
    selectedsortby = val;

    state = const AsyncValue.data(null);
  }

  onPageChanged(int index) async {
    state = const AsyncLoading();
    currentpageIndex = index;
    state = const AsyncValue.data(null);
  }

  onFav(int index) async {
    state = const AsyncLoading();
    if (featureadfavlist![index] == true) {
      featureadfavlist![index] = false;
    } else {
      featureadfavlist![index] = true;
    }
    state = const AsyncValue.data(null);
  }

  onValSelect({required String val}) async {
    state = const AsyncLoading();
    _selectedLocation = val;
    state = const AsyncValue.data(null);
  }
}
