import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../globals.dart';

commonNavigator({required BuildContext context, required Widget child}) {
  // Navigator.push(Globals.navigatorKey.currentContext!,
  //     MaterialPageRoute(builder: (context) => child));
  Navigator.push(
      Globals.navigatorKey.currentContext!,
      PageTransition(
          child: child,
          type: PageTransitionType.fade,
          duration: const Duration(milliseconds: 400)));
}
