import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:rentworthy/utils/color.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/globals.dart';

import '../../presentation/business_prof/business_dialogs/pre_rent_screen_que.dart';
import '../../presentation/business_prof/business_dialogs/profile_created.dart';
import '../../presentation/business_prof/business_dialogs/register_complaint.dart';
import '../../presentation/indi_prof/dialogs/alert_dialog.dart';
import '../../presentation/indi_prof/dialogs/are_u_sure_dialog.dart';
import '../../presentation/indi_prof/dialogs/cancel_booking_dialog.dart';
import '../../presentation/indi_prof/dialogs/order_confirm.dart';
import '../../presentation/indi_prof/dialogs/product_availability_dialog.dart';
import '../../presentation/indi_prof/dialogs/rent_screening_dialog.dart';
import '../../presentation/indi_prof/dialogs/reportimgortitle.dart';
import '../../presentation/indi_prof/dialogs/select_date.dart';
import '../../utils/common_components/common_image_picker.dart';

abstract class DialogService {
  void showSnackBar({
    required String content,
    required Color color,
    required Color textclr,
  });

  Future<void> requestLocationPermission();

  Future<void> productAvailabilityDialog({required String date});

  Future<void> contactusalertdialog();

  Future<bool> handleLocationPermission();

  Future<void> orderconfirmalertdialog();

  Future<void> selectDatedialog();

  Future<void> cancelbookingalertdialog({
    required String groupValue,
    required void Function(String) onChangedval,
  });

  Future<void> profileCreatedDialog({
    required void Function(bool verfied) profVerified,
  });

  Future<void> reportimgtitledialog({
    required int groupValue,
    required void Function(int) onChangedval,
  });

  Future<void> commonImagePicker({
    required ImagePicker picker,
    required void Function(File file) pickedImage,
  });

  Future<void> rentScreeningDialog();

  Future<void> businessrentScreeningDialog();

  Future<void> areYouSureDialog({
    required String titleText,
    required String subtitleText,
    required void Function() onYesPressed,
    required void Function() onNoPressed,
  });

  Future<void> registerComplaintDialog();
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

  Future<void> areYouSureDialog({
    required String titleText,
    required String subtitleText,
    required void Function() onYesPressed,
    required void Function() onNoPressed,
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AreYouSureDialog(
            titleText: titleText,
            onNoPressed: onNoPressed,
            onYesPressed: onYesPressed,
            subtitleText: subtitleText,
          );
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

  Future<void> reportimgtitledialog({
    required int groupValue,
    required void Function(int) onChangedval,
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ReportImgTitleDialog(
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

  Future<void> businessrentScreeningDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return BusinessRentScreeningDialog();
        }));
  }

  Future<void> profileCreatedDialog({
    required void Function(bool verfied) profVerified,
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProfileCreated(
            profVerified: profVerified,
          );
        }));
  }

  Future<void> productAvailabilityDialog({
    required String date,
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierColor: AppColors.transparent,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ProductAvailabilityDialog(
            date: date,
          );
        }));
  }

  Future<void> registerComplaintDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return RegisterComplaintDialog();
        }));
  }

  Future<void> commonImagePicker({
    required ImagePicker picker,
    required void Function(File file) pickedImage,
  }) async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CommonImagePicker(
            picker: picker,
            pickedImage: pickedImage,
          );
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

  ///permissions

  Future<bool> handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      showSnackBar(
          content: 'Location services are disabled. Please enable the services',
          color: AppColors.red,
          textclr: AppColors.white);
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        showSnackBar(
            content: 'Location permissions are denied',
            color: AppColors.red,
            textclr: AppColors.white);

        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      showSnackBar(
          content:
              'Location permissions are permanently denied, we cannot request permissions.',
          color: AppColors.red,
          textclr: AppColors.white);

      return false;
    }
    return true;
  }
}

final dialogServiceProvider = Provider<DialogService>(
  (ref) => DialogServiceV1(),
);
