import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../../utils/import_utils.dart';

part 'my_address_controller.g.dart';

@riverpod
class MyAddressesScreenController extends _$MyAddressesScreenController {
  List<List<PopupMenuItem>> _popupitemList = [];

  List<List<PopupMenuItem>> get popupitemList => _popupitemList;

  @override
  FutureOr<void> build() async {
    state = const AsyncLoading();
    final h = MediaQuery.of(Globals.navigatorKey.currentContext!).size.height;
    final w = MediaQuery.of(Globals.navigatorKey.currentContext!).size.width;
    _popupitemList = List.generate(
        5,
        (index) => [
              PopupMenuItem(
                value: 1,
                child: IconText(
                  isCenter: false,
                  title: AppText.edit,
                  textStyle: ptSansTextStyle(
                      fontSize: w * 0.035,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600),
                  subimg: false,
                  preimg: true,
                  preicon: Icons.edit_outlined,
                  preiconsize: h * 0.03,
                  preimgcolor: AppColors.black.withOpacity(0.8),
                ),
              ),
              PopupMenuItem(
                value: 2,
                child: IconText(
                  isCenter: false,
                  title: AppText.remove,
                  textStyle: ptSansTextStyle(
                      fontSize: w * 0.035,
                      overflow: TextOverflow.ellipsis,
                      color: AppColors.black,
                      fontWeight: FontWeight.w600),
                  subimg: false,
                  preimg: true,
                  preicon: Icons.delete_outline,
                  preiconsize: h * 0.03,
                  preimgcolor: AppColors.black.withOpacity(0.8),
                ),
              ),
            ]);
  }
}
