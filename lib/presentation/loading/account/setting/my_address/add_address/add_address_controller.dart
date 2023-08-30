import 'package:flutter/material.dart';
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

  int get selectedtype => _selectedtype;

  @override
  FutureOr<void> build() async {}

  onSwitchType({required int val}) async {
    state = const AsyncLoading();
    debugPrint('onSwitchType $val');
    _selectedtype = val;

    state = const AsyncValue.data(null);
  }
}
