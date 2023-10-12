import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../utils/text.dart';

part 'all_review_controller.g.dart';

@riverpod
class AllReviewController extends _$AllReviewController {
  List<String> title = [
    "Earnings",
    "Expenses",
    AppText.request,
    AppText.requested,
    AppText.rental,
    AppText.rented,
  ];
  TextEditingController reviewController = TextEditingController();
  List<String> subtitle = [
    "US\$0 ",
    "US\$0 ",
    "0 ",
    "0 ",
    "0 ",
    "0 ",
  ];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<String> get getTitle => title;

  List<String> get getsubtitle => subtitle;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    _isLoading = true;
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading = false;
      state = const AsyncValue.data(null);
    });
    state = const AsyncValue.data(null);
  }
}
