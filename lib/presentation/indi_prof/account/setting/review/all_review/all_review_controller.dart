import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../utils/text.dart';

part 'all_review_controller.g.dart';

@riverpod
class AllReviewController extends _$AllReviewController {
  bool _isLoading = false;

  bool get isLoading => _isLoading;

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
