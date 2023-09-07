import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/common_components/common_tickerprovider.dart';

part 'membership_plan_screen_controller.g.dart';

@riverpod
class MemberShipPlanController extends _$MemberShipPlanController {
  final List<String> _locationList = [
    'Wagle state',
    'Mumbra',
    'Mulund',
    'Dadar',
    'Mahim',
  ];
  List<bool>? featureadfavlist;
  ScrollController scrollController = ScrollController();

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
  List<bool> activeList = [
    true,
    true,
    false,
  ];

  List<bool> get getactiveList => activeList;

  String? get selectedLocation => _selectedLocation;
  TextEditingController searchController = TextEditingController();
  List<String> searchitems = [];
  int currentpageIndex = 0;

  int get getcurrentPageIndex => currentpageIndex;

  List<String> get getsearchitems => searchitems;
  List<AnimationController>? animatecontrollerlist = [];

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
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
      Future.delayed(const Duration(milliseconds: 400), () {
        animatecontrollerlist![0].forward();
      });
      if (i != (animatecontrollerlist!.length - 1)) {
        animatecontrollerlist![i + 1].forward();
      }
    }
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
