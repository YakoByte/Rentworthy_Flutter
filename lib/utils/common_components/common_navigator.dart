import 'package:flutter/cupertino.dart';
import 'package:page_transition/page_transition.dart';

import '../globals.dart';

CommonNavigatior({required Widget child}) {
  Navigator.push(
      Globals.navigatorKey.currentContext!,
      PageTransition(
          child: child,
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400)));
}
