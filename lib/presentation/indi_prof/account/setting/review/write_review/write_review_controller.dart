import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../../../application/validate/validate.dart';
import '../../../../../../utils/import_utils.dart';
import '../../../../../../utils/text.dart';

part 'write_review_controller.g.dart';

@riverpod
class WriteReviewController extends _$WriteReviewController {
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
  bool _isSubmit = false;

  bool get isSubmit => _isSubmit;

  List<String> get getTitle => title;

  List<String> get getsubtitle => subtitle;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();

    state = const AsyncValue.data(null);
  }

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
