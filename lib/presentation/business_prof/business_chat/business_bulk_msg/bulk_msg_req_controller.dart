import 'package:flutter/material.dart';
import 'package:rentworthy/utils/globals.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../application/validate/validate.dart';
import '../../../../utils/common_components/common_tickerprovider.dart';

part 'bulk_msg_req_controller.g.dart';

@riverpod
class BulkMsgReqController extends _$BulkMsgReqController {
  TextEditingController searchController = TextEditingController();
  TextEditingController descController = TextEditingController();
  List<bool>? _selectuser;
  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  List<bool> get getselectuser => _selectuser!;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _selectuser = List.generate(4, (index) => false);
    state = const AsyncValue.data(null);
  }

  onSend() async {
    state = const AsyncLoading();
    _isSubmit = true;
    if (validate(descController.text) == null) {
      _isLoading = true;
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        Navigator.pop(Globals.navigatorKey.currentContext!);
        state = const AsyncValue.data(null);
      });
    }

    state = const AsyncValue.data(null);
  }

  void selectUser(
    int index,
  ) {
    state = const AsyncLoading();
    if (_selectuser![index] == true) {
      _selectuser![index] = false;
    } else {
      _selectuser![index] = true;
    }
    // searchitems = carlist
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    state = const AsyncValue.data(null);
  }
}
