import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/utils/common_components/common_iconbutton.dart';
import 'package:rentworthy/utils/common_components/common_listview.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';
import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_popup.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/text.dart';
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
      body: SingleChildScrollView(
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
                  horizontal: w * 0.035, vertical: h * 0.01),
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
                return Container(
                  width: w,
                  margin: EdgeInsets.symmetric(vertical: h * 0.01),
                  color: AppColors.white,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.04),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            CommonIconButton(
                                containerwidth: w * 0.08,
                                containerheight: h * 0.052,
                                backgroundColor: AppColors.white,
                                shape: LinearBorder.none,
                                centericon: Icon(Icons.more_vert,
                                    color: AppColors.black.withOpacity(0.8),
                                    size: h * 0.03),
                                onPressed: () {
                                  CommonPopup(
                                      position: RelativeRect.fromLTRB(
                                          w * 0.5, 0, w * 0.02, 0),
                                      items: controller().popupitemList[index]);
                                }),
                          ],
                        ),
                        Row(
                          children: [
                            CommonText(
                              style: ptSansTextStyle(
                                  fontSize: w * 0.05,
                                  color: AppColors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w700),
                              text: AppText.hamzaali,
                            ),
                            Padding(
                              padding: EdgeInsets.all(w * 0.015),
                              child: Container(
                                width: w * 0.2,
                                height: h * 0.037,
                                color: AppColors.starcolor.withOpacity(0.6),
                                child: Center(
                                  child: CommonText(
                                      text: "Home",
                                      style: ptSansTextStyle(
                                          color:
                                              AppColors.black.withOpacity(0.4),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w700)),
                                ),
                              ),
                            ),
                          ],
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
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
