import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../application/validate/validate.dart';

part 'add_address_controller.g.dart';

@riverpod
class AddAddressController extends _$AddAddressController {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController zipcodeController = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController unitnoController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  int _selectedaddress = 0;

  int get selectedaddress => _selectedaddress;

  @override
  FutureOr<void> build() async {}

  /// This function is used to save the address
  onSave() async {
    state = const AsyncLoading();
    _isSubmit = true;
    if (validateUname(nameController.text) == null &&
        validatePhone(phoneController.text) == null &&
        validate(zipcodeController.text) == null &&
        validate(stateController.text) == null &&
        validate(cityController.text) == null &&
        validate(addressController.text) == null &&
        validate(unitnoController.text) == null) {
      _isLoading = true;
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        Navigator.pop(Globals.navigatorKey.currentContext!);
        state = const AsyncValue.data(null);
      });
    }
    state = const AsyncValue.data(null);
  }

  /// This function is used to select the address
  onSelectAddress({required int val}) async {
    state = const AsyncLoading();
    debugPrint('selectedaddress $val');
    _selectedaddress = val;

    state = const AsyncValue.data(null);
  }
}
