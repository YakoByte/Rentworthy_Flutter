import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'select_lang_controller.g.dart';

@riverpod
class SelectLanController extends _$SelectLanController {
  bool _isEng = true;

  bool get isEng => _isEng;

  @override
  FutureOr<void> build() async {}

  /// Language selection
  onlangTap({required bool val}) async {
    state = const AsyncLoading();

    _isEng = val;
    debugPrint('_isEng $val');
    state = const AsyncValue.data(null);
  }
}
