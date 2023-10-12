import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/import_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';
import '../admin_panel/admin_panel.dart';

part 'business_post_ur_ad_controller.g.dart';

@riverpod
class BusinessPostAdController extends _$BusinessPostAdController {
  TextEditingController itemnameController = TextEditingController();
  TextEditingController subcatController = TextEditingController();
  TextEditingController addtitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addtitlelastController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  List<String>? _selectCat = [];
  List<String> _catList = [
    "cat1",
    "cat2",
    "cat3",
    "cat4",
  ];

  List<String> get catList => _catList;

  List<String> get selectCat => _selectCat!;

  @override
  FutureOr<void> build() async {
    state = AsyncLoading();

    state = AsyncValue.data(null);
  }

  onValSelect({required List<String> val}) async {
    state = const AsyncLoading();
    _selectCat = val;
    state = const AsyncValue.data(null);
  }

  onNext() async {
    state = const AsyncLoading();
    _isLoading = true;

    Future.delayed(Duration(seconds: 1), () {
      state = const AsyncLoading();
      _isLoading = false;
      state = const AsyncValue.data(null);
      commonNavigator(
        context: Globals.navigatorKey.currentContext!,
        child: const AdminPanel(),
        type: PageTransitionType.rightToLeftWithFade,
      );
    });
    state = const AsyncValue.data(null);
  }
}
