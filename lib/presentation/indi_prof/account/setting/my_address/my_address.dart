import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import '../../../../../application/dialog/dialod_service.dart';
import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_popup.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';
import '../../../../shimmers/my_address_shimmer.dart';
import '../../../error/error_screen.dart';
import 'add_address/add_address.dart';
import 'my_address_controller.dart';

class MyAddressesScreen extends ConsumerWidget {
  const MyAddressesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(myAddressesScreenControllerProvider);
    controller() => ref.read(myAddressesScreenControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.backgroundField,
      appBar: CommonAppBar(
        leadingicon: true,
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.backgroundField,
        centerTitle: false,
        centerwidget: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: w * 0.02,
          ),
          child: CommonText(
            style: ptSansTextStyle(
                fontSize: w * 0.05,
                color: AppColors.black.withOpacity(0.8),
                fontWeight: FontWeight.w700),
            text: AppText.myaddress,
          ),
        ),
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const MyAddressShimmer();
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: h * 0.07,
                    width: w,
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              commonNavigator(
                                context: context,
                                child: const AddAddressScreen(),
                                type: PageTransitionType.rightToLeftWithFade,
                              );
                            },
                            child: IconText(
                                title: AppText.addnewaddress,
                                textStyle: ptSansTextStyle(
                                    foreground: Paint()
                                      ..shader = const LinearGradient(
                                        colors: <Color>[
                                          AppColors.colorPrimary,
                                          AppColors.colorSecondary
                                        ],
                                      ).createShader(
                                          const Rect.fromLTRB(80, 0, 400, 100)),
                                    fontSize: h * 0.022,
                                    fontWeight: FontWeight.w600),
                                preicon: Icons.add,
                                preiconsize: w * 0.06,
                                preimgcolor: AppColors.white,
                                preshadermask: true,
                                subimg: false,
                                preimg: true),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.045, vertical: h * 0.01),
                    child: CommonText(
                      style: ptSansTextStyle(
                          fontSize: w * 0.035,
                          color: AppColors.black.withOpacity(0.6),
                          fontWeight: FontWeight.w800),
                      text: "3 Save Addresses",
                    ),
                  ),
                  CommonListView(
                    itemCount: 5,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    width: w,
                    height: (h * 0.28) * 5,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 5,
                        color: AppColors.white,
                        shape: LinearBorder.none,
                        child: Container(
                          width: w,
                          // margin: EdgeInsets.symmetric(vertical: h * 0.01),
                          color: AppColors.white,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: w * 0.04, vertical: h * 0.01),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: w * 0.2,
                                          height: h * 0.037,
                                          color: AppColors.starcolor
                                              .withOpacity(0.6),
                                          child: Center(
                                            child: CommonText(
                                                text: "Home",
                                                style: ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    fontSize: h * 0.02,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        CommonIconButton(
                                            containerwidth: w * 0.08,
                                            containerheight: h * 0.052,
                                            backgroundColor: AppColors.white,
                                            shape: LinearBorder.none,
                                            centericon: Icon(
                                                Icons.edit_outlined,
                                                color: AppColors.black,
                                                size: h * 0.03),
                                            onPressed: () {}),
                                        CommonIconButton(
                                            containerwidth: w * 0.08,
                                            containerheight: h * 0.052,
                                            backgroundColor: AppColors.white,
                                            shape: LinearBorder.none,
                                            centericon: Icon(
                                                Icons.delete_outline,
                                                color: AppColors.red,
                                                size: h * 0.03),
                                            onPressed: () {
                                              ref
                                                  .read(dialogServiceProvider)
                                                  .areYouSureDialog(
                                                      titleText:
                                                          "Are you sure?",
                                                      subtitleText:
                                                          "Would you like to delete this address?",
                                                      onYesPressed: () {},
                                                      onNoPressed: () {
                                                        Navigator.pop(context);
                                                      });
                                            }),
                                      ],
                                    ),
                                  ],
                                ),
                                CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: w * 0.05,
                                      overflow: TextOverflow.ellipsis,
                                      color: AppColors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.w700),
                                  text: AppText.hamzaali,
                                ),
                                CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: w * 0.03,
                                      color: AppColors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.w600),
                                  text:
                                      "Street: C501, Vishal Apt, Behind Vishal Hall, Andheri Kurla Rd, Andheri (e)",
                                ),
                                CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: w * 0.03,
                                      color: AppColors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.w600),
                                  text: "City: Mumbai",
                                ),
                                CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: w * 0.03,
                                      color: AppColors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.w600),
                                  text: "State/province/area: Maharashtra",
                                ),
                                CommonText(
                                  style: ptSansTextStyle(
                                      fontSize: w * 0.03,
                                      color: AppColors.black.withOpacity(0.8),
                                      fontWeight: FontWeight.w600),
                                  text: "Phone number 02226833712",
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: h * 0.02),
                                  child: CommonText(
                                    style: ptSansTextStyle(
                                        fontSize: w * 0.03,
                                        color: AppColors.black.withOpacity(0.8),
                                        fontWeight: FontWeight.w600),
                                    text: "Zip code 400069",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return const MyAddressShimmer();
          }),
    );
  }
}
