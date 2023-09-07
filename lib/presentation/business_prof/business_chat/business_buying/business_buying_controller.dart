import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'business_buying_controller.g.dart';

@riverpod
class BusinessBuyingController extends _$BusinessBuyingController {
  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    state = const AsyncValue.data(null);
  }
}
