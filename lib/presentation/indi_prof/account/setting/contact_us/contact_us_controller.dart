import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../utils/import_utils.dart';

part 'contact_us_controller.g.dart';

@riverpod
class ContactUsController extends _$ContactUsController {
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
  String? selectedfilter;
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String get getselectedfilter => selectedfilter!;
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
  String? _selectedLocation;
  String _selectedreason = AppText.nolongneed;

  String get selectedreason => _selectedreason;

  int _selectedcosmetic = 0;

  int get selectedcosmetic => _selectedcosmetic;
  int _selecteditemwork = 0;
  TextEditingController cosmeticcontroller = TextEditingController();
  TextEditingController itemworkscontroller = TextEditingController();
  TextEditingController missingcontroller = TextEditingController();

  int get selecteditemwork => _selecteditemwork;
  int _selectedmssing = 0;

  int get selectedmssing => _selectedmssing;

  String? get selectedLocation => _selectedLocation;

  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    selectedfilter = filterlist[0];
    selectedsortby = sortlist[0];
    favlist = List.generate(carlist.length, (index) => false);
    state = const AsyncValue.data(null);
    _selectedLocation = _locationList[0];
    popularfavlist = List.generate(_imgList.length, (index) => false);
    featureadfavlist = List.generate(_imgList.length, (index) => false);
    nearbyadfavlist = List.generate(_imgList.length, (index) => false);
    state = const AsyncValue.data(null);
  }

  onchangefilter(
    val,
  ) {
    state = const AsyncLoading();
    selectedfilter = val;
    state = const AsyncValue.data(null);
  }

  onreasonSelected(
    val,
  ) {
    state = const AsyncLoading();
    _selectedreason = val;
    state = const AsyncValue.data(null);
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

  onValSelect({required String val}) async {
    state = const AsyncLoading();
    _selectedLocation = val;
    state = const AsyncValue.data(null);
  }
}
