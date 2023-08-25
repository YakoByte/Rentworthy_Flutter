import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rentworthy/utils/common_components/alert_dialog.dart';

import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';

abstract class DialogService {
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  });

  Future<void> requestLocationPermission();

  Future<void> alertdialog();
}

class DialogServiceV1 implements DialogService {
  Future<void> requestLocationPermission() async {
    final permissionStatus = await Permission.location.status;
    if (permissionStatus.isGranted) {
      print("denined");
      await Permission.location.request();

      if (permissionStatus.isDenied) {
        print("deninedopenAppSettings");
        await openAppSettings();
      }
    } else if (permissionStatus.isPermanentlyDenied) {
      print("isPermanentlyDenied");
      await openAppSettings();
    } else {}

    // final PermissionStatus permissionStatus =
    //     await Permission.location.request();
    // if (permissionStatus.isGranted) {
    //   await Permission.location.request();
    //
    //   if (permissionStatus.isDenied) {
    //     print("deninedopenAppSettings");
    //     await openAppSettings();
    //   }
    // } else if (permissionStatus.isDenied) {
    //   await openAppSettings();
    //   // Permission denied, handle accordingly
    // } else if (permissionStatus.isPermanentlyDenied) {
    //   // Permission permanently denied, open app settings for the user to enable manually
    //   await openAppSettings();
    // } else {}
  }

  Future<void> alertdialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CommonAlertDialog();
        }));
  }

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
          style: ptSansTextStyle(
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
