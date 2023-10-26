import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../application/validate/validate.dart';
import '../../../../../../utils/import_utils.dart';
import '../../../../../../utils/text.dart';

part 'write_review_controller.g.dart';

@riverpod
class WriteReviewController extends _$WriteReviewController {
  TextEditingController reviewController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;
  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

  /// This method is used to submit the review
  onSubmit() async {
    state = const AsyncLoading();
    _isSubmit = true;
    if (validate(reviewController.text) == null) {
      _isLoading = true;
      Future.delayed(const Duration(seconds: 1), () {
        _isLoading = false;
        Navigator.pop(Globals.navigatorKey.currentContext!);

        state = const AsyncValue.data(null);
      });
    }

    state = const AsyncValue.data(null);
  }
}
