import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../utils/common_components/common_tickerprovider.dart';

part 'unread_chat_controller.g.dart';

@riverpod
class UnreadChatController extends _$UnreadChatController {
  late TabController tabController;

  int _selectedTab = 0;
  bool _isLoading = false;

  bool get isLoading => _isLoading;

  int get selectedtab => _selectedTab;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    tabController = TabController(
      initialIndex: 0,
      length: 3,
      vsync: CommonTickerProvider(),
    );
    tabController.addListener(() {
      onTabTap(val: tabController.index);
      state = const AsyncLoading();
      state = const AsyncValue.data(null);
    });

    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      state = const AsyncValue.data(null);
    });
    state = const AsyncValue.data(null);
  }

  onTabTap({required int val}) async {
    state = const AsyncLoading();
    //   debugPrint('_selectedTab $val');
    _selectedTab = val;

    state = const AsyncValue.data(null);
  }
}
