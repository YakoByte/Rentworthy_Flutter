import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../application/dialog/dialog_service.dart';
import '../../../../../application/validate/validate.dart';
import '../../../../../utils/import_utils.dart';

part 'contact_us_controller.g.dart';

@riverpod
class ContactUsController extends _$ContactUsController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController descController = TextEditingController();

  int _selectedcosmetic = 0;

  int get selectedcosmetic => _selectedcosmetic;
  int _selecteditemwork = 0;

  int get selecteditemwork => _selecteditemwork;
  TextEditingController cosmeticcontroller = TextEditingController();
  TextEditingController itemworkscontroller = TextEditingController();
  TextEditingController missingcontroller = TextEditingController();

  int _selectedmssing = 0;

  int get selectedmssing => _selectedmssing;

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isSubmit = false;

  bool get issubmit => _isSubmit;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

  /// onsubmit
  onSubmit() async {
    state = const AsyncLoading();
    _isSubmit = true;
    if (validate(nameController.text) == null &&
        validate(phoneController.text) == null &&
        validate(descController.text) == null) {
      _isLoading = true;
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        ref.read(dialogServiceProvider).contactUsAlertDialog();
        state = const AsyncValue.data(null);
      });
    }

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
}
