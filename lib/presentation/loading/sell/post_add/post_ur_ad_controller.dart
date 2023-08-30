import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_ur_ad_controller.g.dart';

@riverpod
class PostUrAdsController extends _$PostUrAdsController {
  TextEditingController itemnameController = TextEditingController();
  TextEditingController subcatController = TextEditingController();
  TextEditingController addtitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addtitlelastController = TextEditingController();

  String? _selectCat = "Select Category";
  List<String> _catList = [
    "Select Category",
    "cat1",
    "cat2",
    "cat3",
    "cat4",
  ];

  List<String> get catList => _catList;

  String get selectCat => _selectCat!;

  @override
  FutureOr<void> build() async {
    state = AsyncLoading();

    state = AsyncValue.data(null);
  }

  onValSelect({required String val}) async {
    state = const AsyncLoading();
    _selectCat = val;
    state = const AsyncValue.data(null);
  }
}
