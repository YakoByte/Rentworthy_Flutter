import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'bulk_msg_req_controller.g.dart';

@riverpod
class BulkMsgReqController extends _$BulkMsgReqController {
  TextEditingController searchController = TextEditingController();
  TextEditingController descController = TextEditingController();
  List<String> searchitems = [];

  List<String> get getsearchitems => searchitems;
  bool? _isSelected = false;

  bool get getisSelected => _isSelected!;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    state = const AsyncValue.data(null);
  }

  void filterSearchResults(String query) {
    state = const AsyncLoading();
    // searchitems = carlist
    //     .where((item) => item.toLowerCase().contains(query.toLowerCase()))
    //     .toList();
    print("searchitems $searchitems");
    state = const AsyncValue.data(null);
  }
}
