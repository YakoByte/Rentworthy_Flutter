import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/globals.dart';

abstract class DialogService {
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  });
}

class DialogServiceV1 implements DialogService {
  @override
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  }) {
    if (Globals.navigatorKey.currentContext == null) {
      return;
    }
    ScaffoldMessenger.of(Globals.navigatorKey.currentContext!).clearSnackBars();

    ScaffoldMessenger.of(Globals.navigatorKey.currentContext!).showSnackBar(
      SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        content: Text(
          content,
          style: TextStyle(
            color: textclr,
          ),
        ),
      ),
    );
  }
}

final dialogServiceProvider = Provider<DialogService>(
  (ref) => DialogServiceV1(),
);
