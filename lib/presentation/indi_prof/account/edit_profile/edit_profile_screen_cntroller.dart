import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/import_utils.dart';

part 'edit_profile_screen_cntroller.g.dart';

@riverpod
class EditProfileController extends _$EditProfileController {
  TextEditingController nameController = TextEditingController();
  TextEditingController aboutyouController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController countryCodeController =
      TextEditingController(text: "+91");
  bool _isLoading = false;
  ImagePicker imagePicker = ImagePicker();
  File? selectedImage;
  bool get isLoading => _isLoading;
  bool _issubmit = false;

  bool get issubmit => _issubmit;

  @override
  FutureOr<void> build() async {}
  onImgSelect({required val}) async {
    state = const AsyncLoading();
    selectedImage = val;
    print("selectedImage =-=- ${selectedImage}");
    state = const AsyncValue.data(null);
  }

  onSave() async {
    state = const AsyncLoading();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      Navigator.pop(Globals.navigatorKey.currentContext!);

      state = const AsyncValue.data(null);
    });
    state = const AsyncValue.data(null);
  }
}
