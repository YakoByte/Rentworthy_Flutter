import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'business_chat_controller.g.dart';

@riverpod
class BusinessChatController extends _$BusinessChatController {
  TabController tabController =
      TabController(length: 3, vsync: CommonTickerProvider());
  int _selectedTab = 0;

  int get selectedtab => _selectedTab;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }
}
