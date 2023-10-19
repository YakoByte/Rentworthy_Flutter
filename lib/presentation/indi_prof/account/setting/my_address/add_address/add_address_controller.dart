import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
  int _selectedtype = 0;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int get selectedtype => _selectedtype;

  @override
  FutureOr<void> build() async {}

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

  onSwitchType({required int val}) async {
    state = const AsyncLoading();
    debugPrint('onSwitchType $val');
    _selectedtype = val;

    state = const AsyncValue.data(null);
  }
}
