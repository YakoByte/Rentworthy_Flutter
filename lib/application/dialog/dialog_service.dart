import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rentworthy/utils/color.dart';

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

  Future<void> productAvailabilityDialog({required String date});

  Future<void> contactUsAlertDialog();

  Future<bool> handleLocationPermission();

  Future<void> orderConfirmAlertDialog();

  Future<void> selectDateDialog();

  Future<void> cancelBookingAlertDialog();

  Future<void> profileCreatedDialog({
    required void Function(bool verfied) profVerified,
  });

  Future<void> reportImgTitleDialog();

  Future<void> commonImagePicker({
    required ImagePicker picker,
    required void Function(File file) pickedImage,
  });

  Future<void> rentScreeningDialog();

  Future<void> businessRentScreeningDialog();

  Future<void> areYouSureDialog({
    required String titleText,
    required String subtitleText,
    required void Function() onYesPressed,
    required void Function() onNoPressed,
  });

  Future<void> registerComplaintDialog();
}

class DialogServiceV1 implements DialogService {
  @override
  Future<void> contactUsAlertDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const ContactUsAlertDialog();
        }));
  }

  @override
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

  @override
  Future<void> selectDateDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return SelectDateDialog();
        }));
  }

  @override
  Future<void> orderConfirmAlertDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const OrderConfirmAlertDialog();
        }));
  }

  @override
  Future<void> cancelBookingAlertDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return CancelBookingDialog();
        }));
  }

  @override
  Future<void> reportImgTitleDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return ReportImgTitleDialog();
        }));
  }

  @override
  Future<void> rentScreeningDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return RentScreeningDialog();
        }));
  }

  @override
  Future<void> businessRentScreeningDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return const BusinessRentScreeningDialog();
        }));
  }

  @override
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

  @override
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

  @override
  Future<void> registerComplaintDialog() async {
    return (await showDialog(
        context: Globals.navigatorKey.currentContext!,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return RegisterComplaintDialog();
        }));
  }

  @override
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
    Fluttertoast.cancel();
    Fluttertoast.showToast(
        msg: content,
        backgroundColor: color,
        textColor: textclr,
        fontSize:
            MediaQuery.of(Globals.navigatorKey.currentContext!).size.width *
                0.04);
  }

  ///permissions

  @override
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
