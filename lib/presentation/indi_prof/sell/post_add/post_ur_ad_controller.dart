import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:page_transition/page_transition.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/validate/validate.dart';
import '../../../../utils/import_utils.dart';
import '../product_availablity/product_availablity_screen.dart';

part 'post_ur_ad_controller.g.dart';

@riverpod
class PostUrAdsController extends _$PostUrAdsController {
  TextEditingController subcatController = TextEditingController();
  TextEditingController addtitleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController addtitlelastController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();
  late List<File> selectedImage;
  List<String>? _selectCat = [];
  List<String> _catList = [
    "cat1",
    "cat2",
    "cat3",
    "cat4",
  ];
  bool _isLoading = false;
  bool _issubmit = false;

  bool get isLoading => _isLoading;

  bool get issubmit => _issubmit;

  List<String> get catList => _catList;

  List<String> get selectCat => _selectCat!;

  @override
  FutureOr<void> build() async {
    state = AsyncLoading();
    selectedImage = List.generate(6, (index) => File(""));
    state = AsyncValue.data(null);
  }

  onValSelect({required List<String> val}) async {
    state = const AsyncLoading();
    _selectCat = val;
    state = const AsyncValue.data(null);
  }

  onImgSelect({required val, required index}) async {
    state = const AsyncLoading();
    selectedImage![index] = val;
    // print("selectedImage =-=- ${selectedImage![index]}");
    state = const AsyncValue.data(null);
  }

  onNext() async {
    state = const AsyncLoading();
    _issubmit = true;
    if (validate(addtitleController.text) == null &&
        validate(subcatController.text) == null &&
        validate(descController.text) == null &&
        validate(priceController.text) == null &&
        validate(cityController.text) == null &&
        validate(stateController.text) == null &&
        validate(addtitlelastController.text) == null) {
      _isLoading = true;

      Future.delayed(Duration(seconds: 1), () {
        state = const AsyncLoading();
        _isLoading = false;
        state = const AsyncValue.data(null);
        commonNavigator(
          context: Globals.navigatorKey.currentContext!,
          child: ProductAvailabliity(),
          type: PageTransitionType.rightToLeftWithFade,
        );
      });
    }

    state = const AsyncValue.data(null);
  }
}
