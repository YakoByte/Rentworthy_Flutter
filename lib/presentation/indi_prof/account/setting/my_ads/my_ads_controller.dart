import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/material.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/common_components/common_tickerprovider.dart';

part 'my_ads_controller.g.dart';

@riverpod
class MyAdsController extends _$MyAdsController {
  final List<String> _locationList = [
    'Wagle state',
    'Mumbra',
    'Mulund',
    'Dadar',
    'Mahim',
  ];
  List<String> filterlist = [
    "Filter",
    "Color",
    "Price",
    "Categories",
  ];
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<AnimationController>? animatecontrollerlist = [];
  AnimationController animationController = AnimationController(
    vsync: CommonTickerProvider(),
    duration: Duration(milliseconds: 1000),
  );

  List<String> get getfilterlist => filterlist;
  List<String> carlist = [
    "Mercedes",
    "MG",
    "Kia",
    "Hyundai",
    "Tata",
    "Honda",
    "Suzuki",
    "AUdi",
    "BMW",
    "Ford",
    "Toyota",
    "Renault",
    "Porsche",
    "Ferrari",
    "Volvo",
  ];

  List<String> get getcarlist => carlist;
  List<String>? selectedfilter;
  TextEditingController searchController = TextEditingController();

  List<String> get getselectedfilter => selectedfilter!;
  List<bool>? favlist;

  List<bool> get getfavlist => favlist!;
  List<String> sortlist = [
    "Sort By",
    "Price: high to low",
    "Price: low to high",
    "Ratings",
    "Popularity",
    "Discount",
  ];

  List<String> get getsortlist => sortlist;
  String? selectedsortby;

  String get getselectedselectedsortby => selectedsortby!;
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
  List<String>? _selectedLocation;

  List<String>? get selectedLocation => _selectedLocation;

  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;
  late TabController tabController;
  int _selectedTab = 0;

  int get selectedtab => _selectedTab;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: CommonTickerProvider(),
    );
    _isLoading = true;

    tabController.addListener(() {
      onTabTap(val: tabController.index);
      state = const AsyncLoading();
      state = const AsyncValue.data(null);
    });

    selectedfilter = filterlist;
    selectedsortby = sortlist[0];
    favlist = List.generate(carlist.length, (index) => false);
    state = const AsyncValue.data(null);
    _selectedLocation = _locationList;
    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);
    animationController.forward();
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

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

    for (int i = 0; i < _nameList.length; i++) {
      animatecontrollerlist!.add(AnimationController(
        vsync: CommonTickerProvider(),
        duration: Duration(
            milliseconds:
                ((i == 0 ? i + 2 : i + 1) + 5) * int.parse("${i + 3}0")),
      ));
      Future.delayed(const Duration(milliseconds: 400), () {
        animatecontrollerlist![0].forward();
      });
      if (i != (animatecontrollerlist!.length - 1)) {
        animatecontrollerlist![i + 1].forward();
      }
    }
    state = const AsyncValue.data(null);
  }

  onchangefilter(
    val,
  ) {
    state = const AsyncLoading();
    print("val $val");
    selectedfilter = val;
    print("selectedfilter $selectedfilter");
    state = const AsyncValue.data(null);
  }

  onchangecheckbox(
    val,
  ) {
    state = const AsyncLoading();
    checkboxitems = val;
    print("checkboxitems $checkboxitems");
    state = const AsyncValue.data(null);
  }

  void filterSearchResults(String query) {
    state = const AsyncLoading();
    searchitems = carlist
        .where((item) => item.toLowerCase().contains(query.toLowerCase()))
        .toList();
    print("searchitems $searchitems");
    state = const AsyncValue.data(null);
  }

  onFavTap(
    int index,
  ) {
    state = const AsyncLoading();
    if (favlist![index] == true) {
      favlist![index] = false;
    } else {
      favlist![index] = true;
    }

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

  onValSelect({required List<String> val}) async {
    state = const AsyncLoading();
    _selectedLocation = val;
    state = const AsyncValue.data(null);
  }
}
