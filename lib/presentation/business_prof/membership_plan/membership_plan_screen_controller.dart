import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:rentworthy/utils/images.dart';
import 'package:rentworthy/utils/text.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/common_components/common_tickerprovider.dart';

part 'membership_plan_screen_controller.g.dart';

@riverpod
class MemberShipPlanController extends _$MemberShipPlanController {
  ScrollController scrollController = ScrollController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  CarouselController carouselController = CarouselController();
  PageController pageController = PageController();

  String? _selectedLocation;
  List<bool> activeList = [
    true,
    true,
    false,
  ];

  List<bool> get getactiveList => activeList;

  String? get selectedLocation => _selectedLocation;
  TextEditingController searchController = TextEditingController();

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;

    state = const AsyncValue.data(null);
  }

  onValSelect({required String val}) async {
    state = const AsyncLoading();
    _selectedLocation = val;
    state = const AsyncValue.data(null);
  }
}
