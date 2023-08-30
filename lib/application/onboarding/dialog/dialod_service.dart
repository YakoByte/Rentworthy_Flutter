import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rentworthy/presentation/loading/dialogs/alert_dialog.dart';

import '../../../presentation/loading/dialogs/cancel_booking_dialog.dart';
import '../../../presentation/loading/dialogs/order_confirm.dart';
import '../../../presentation/loading/dialogs/rent_screening_dialog.dart';
import '../../../presentation/loading/dialogs/select_date.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';

abstract class DialogService {
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  });

  Future<void> requestLocationPermission();

  Future<void> contactusalertdialog();

  Future<void> orderconfirmalertdialog();

  Future<void> selectDatedialog();

  Future<void> cancelbookingalertdialog({
    required String groupValue,
    required void Function(String) onChangedval,
  });

  Future<void> rentScreeningDialog();
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
  }

  Future<void> contactusalertdialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ContactUsAlertDialog();
        }));
  }

  Future<void> selectDatedialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SelectDateDialog();
        }));
  }

  Future<void> orderconfirmalertdialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return OrderConfirmAlertDialog();
        }));
  }

  Future<void> cancelbookingalertdialog({
    required String groupValue,
    required void Function(String) onChangedval,
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CancelBookingDialog(
            groupValue: groupValue,
            onChangedval: onChangedval,
          );
        }));
  }

  Future<void> rentScreeningDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return RentScreeningDialog();
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
