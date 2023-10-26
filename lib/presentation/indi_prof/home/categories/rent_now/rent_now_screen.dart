import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gradient_borders/box_borders/gradient_box_border.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/presentation/indi_prof/home/categories/rent_now/rent_now_screen_controller.dart';

import '../../../../../application/dialog/dialog_service.dart';
import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_navigator.dart';
import '../../../../../utils/common_components/common_outline_button.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/globals.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import '../../../../shimmers/rent_now_shimmer.dart';
import '../../../account/setting/my_address/add_address/add_address.dart';
import '../../../error/error_screen.dart';

class RentNow extends ConsumerWidget {
  const RentNow({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(rentNowControllerProvider);
    controller() => ref.read(rentNowControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CommonAppBar(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        backgroundColor: AppColors.white,
        centerTitle: false,
        leadingicon: true,
        centerwidget: CommonText(
                text: AppText.rentNow,
                style: ptSansTextStyle(
                    color: AppColors.black,
                    fontSize: h * 0.025,
                    fontWeight: FontWeight.w600))
            .animate()
            .fade(duration: 1000.ms)
            .then(delay: 1000.ms)
            .slideX(
                begin: 0, end: 0, curve: Curves.decelerate, duration: 800.ms),
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const RentNowShimmer();
            }
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 1,
                  )
                      .animate()
                      .fade(duration: 1000.ms)
                      .then(delay: 1000.ms)
                      .slideX(
                          begin: 0,
                          end: 0,
                          curve: Curves.decelerate,
                          duration: 800.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ///Product Image
                        Padding(
                          padding: EdgeInsets.only(right: w * 0.016),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.asset(
                              AppImg.homeList,
                              height: h * 0.12,
                              width: w * 0.4,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ///Product Name
                            CommonText(
                                text: "Xbox Series S",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.028,
                                  fontWeight: FontWeight.w700,
                                )),

                            ///Product Description
                            Container(
                              width: w * 0.45,
                              child: CommonText(
                                  text:
                                      "Amet minim mollit non deserunt ullamco est sitaliqua dolor do amet sint.",
                                  style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.4),
                                    fontSize: h * 0.017,
                                    fontWeight: FontWeight.w400,
                                  )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .then(delay: 600.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .then(delay: 600.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),

                  ///Selected Date
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: "Please select date",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                    text: AppText.dates,
                                    maxLines: 1,
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: h * 0.023,
                                      fontWeight: FontWeight.w700,
                                    )),
                                CommonText(
                                    text: "29-31 May",
                                    maxLines: 1,
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: h * 0.021,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CommonText(
                                    text: AppText.edit,
                                    maxLines: 1,
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: h * 0.021,
                                      decoration: TextDecoration.underline,
                                      decorationColor:
                                          AppColors.black.withOpacity(0.6),
                                      decorationThickness: 1,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .then(delay: 700.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 700.ms)
                      .then(delay: 700.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),

                  ///Price Details
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CommonText(
                                text: "Price details",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.025,
                                  fontWeight: FontWeight.w700,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                                text: "\$2,000 per day x 4 days",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                            CommonText(
                                text: "\$8,000",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                                text: "Shipping charges",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                            CommonText(
                                text: "\$150",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                                text: "Service fee",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                            CommonText(
                                text: "\$200",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                        Divider(
                          color: AppColors.black.withOpacity(0.1),
                          height: h * 0.01,
                          thickness: 1,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CommonText(
                                text: "Total",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w700,
                                )),
                            CommonText(
                                text: "\$8,350",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w400,
                                )),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .then(delay: 800.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 800.ms)
                      .then(delay: 800.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),

                  ///Add Address
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: CommonOutlineButton(
                      containerwidth: w,
                      containerheight: h * 0.06,
                      backgroundColor: AppColors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(h * 0.006),
                        side: const BorderSide(
                            color: AppColors.colorPrimary, width: 2),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: const GradientBoxBorder(
                          gradient: LinearGradient(colors: [
                            AppColors.colorPrimary,
                            AppColors.colorSecondary
                          ]),
                          width: 2.5,
                        ),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      text: AppText.addAddress,
                      textStyle: ptSansTextStyle(
                          foreground: Paint()
                            ..shader = const LinearGradient(
                              colors: <Color>[
                                AppColors.colorPrimary,
                                AppColors.colorSecondary
                              ],
                            ).createShader(
                                const Rect.fromLTRB(100, 0, 250, 20)),
                          fontSize: h * 0.022,
                          fontWeight: FontWeight.w700),
                      onPressed: () {
                        FocusScope.of(Globals.navigatorKey.currentContext!)
                            .requestFocus(FocusNode());
                        commonNavigator(
                            type: PageTransitionType.rightToLeftWithFade,
                            context: context,
                            child: AddAddressScreen());
                      },
                      side: BorderSide.none,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 900.ms)
                      .then(delay: 900.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 900.ms)
                      .then(delay: 900.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),

                  ///Payment Method
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CommonText(
                                    text: "Pay with",
                                    maxLines: 1,
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: h * 0.022,
                                      fontWeight: FontWeight.w700,
                                    )),
                              ],
                            ),
                            CommonText(
                                text: "Payment method",
                                maxLines: 1,
                                style: ptSansTextStyle(
                                  color: AppColors.black.withOpacity(0.6),
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: h * 0.02,
                                  fontWeight: FontWeight.w700,
                                )),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image.asset(
                                  AppImg.visa,
                                  height: h * 0.04,
                                  width: w * 0.15,
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  AppImg.mastercard,
                                  height: h * 0.04,
                                  width: w * 0.15,
                                  fit: BoxFit.contain,
                                ),
                                Image.asset(
                                  AppImg.paypal,
                                  height: h * 0.07,
                                  width: w * 0.15,
                                  fit: BoxFit.contain,
                                ),
                              ],
                            )
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CommonOutlineButton(
                              containerwidth: w * 0.25,
                              containerheight: h * 0.045,
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(h * 0.006),
                                side: const BorderSide(
                                    color: AppColors.colorPrimary, width: 2),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: const GradientBoxBorder(
                                  gradient: LinearGradient(colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary
                                  ]),
                                  width: 2.5,
                                ),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              text: AppText.add,
                              textStyle: ptSansTextStyle(
                                  foreground: Paint()
                                    ..shader = const LinearGradient(
                                      colors: <Color>[
                                        AppColors.colorPrimary,
                                        AppColors.colorSecondary
                                      ],
                                    ).createShader(
                                        const Rect.fromLTRB(200, 0, 350, 20)),
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w700),
                              onPressed: () async {
                                await controller().makePayment();
                              },
                              side: BorderSide.none,
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 1000.ms)
                      .then(delay: 1000.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 1000.ms)
                      .then(delay: 1000.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),

                  ///Cancellation Policy
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CommonText(
                            text: "Cancellation policy",
                            maxLines: 1,
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              overflow: TextOverflow.ellipsis,
                              fontSize: h * 0.021,
                              fontWeight: FontWeight.w700,
                            )),
                        RichText(
                          textAlign: TextAlign.start,
                          text: TextSpan(
                            text:
                                "Free cancellation before 10 May. Cancel before check-in on 17 May for a partial refund. ",
                            style: ptSansTextStyle(
                              color: AppColors.black.withOpacity(0.6),
                              fontSize: h * 0.02,
                              fontWeight: FontWeight.w400,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                  text: "Learn more",
                                  style: ptSansTextStyle(
                                    color: AppColors.black.withOpacity(0.6),
                                    fontSize: h * 0.02,
                                    decoration: TextDecoration.underline,
                                    decorationThickness: 1,
                                    fontWeight: FontWeight.w600,
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 1100.ms)
                      .then(delay: 1100.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 1100.ms)
                      .then(delay: 1100.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: Row(
                      children: [
                        Image.asset(
                          AppImg.calendarClock,
                          height: h * 0.04,
                          width: w * 0.2,
                          fit: BoxFit.contain,
                        ),
                        Expanded(
                          child: RichText(
                            textAlign: TextAlign.start,
                            text: TextSpan(
                              text:
                                  "Your reservation won’t be confirmed until the product owner accepts your request (within 24 hours).",
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w600,
                              ),
                              children: <TextSpan>[
                                TextSpan(
                                    text: "You won’t be charged until then.",
                                    style: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      fontSize: h * 0.02,
                                      fontWeight: FontWeight.w400,
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 1200.ms)
                      .then(delay: 1200.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Divider(
                    color: AppColors.black.withOpacity(0.1),
                    height: h * 0.01,
                    thickness: 4,
                  )
                      .animate()
                      .fadeIn(duration: 1200.ms)
                      .then(delay: 1200.ms)
                      .slideY(
                          begin: 80,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(
                        text: "Lorem ipsum dolor sit amet,",
                        style: ptSansTextStyle(
                          color: AppColors.black.withOpacity(0.6),
                          fontSize: h * 0.02,
                          fontWeight: FontWeight.w400,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                              text:
                                  "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              style: ptSansTextStyle(
                                color: AppColors.black,
                                fontSize: h * 0.02,
                                decoration: TextDecoration.underline,
                                decorationThickness: 1,
                                fontWeight: FontWeight.w600,
                              )),
                          TextSpan(
                              text: "Ut enim ad minim veniam.",
                              style: ptSansTextStyle(
                                color: AppColors.black.withOpacity(0.6),
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 1300.ms)
                      .then(delay: 1300.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),

                  /// Rent Now Button
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: w * 0.04, vertical: h * 0.015),
                    child: CommonButton(
                        containerwidth: w,
                        containerheight: h * 0.069,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(h * 0.006),
                            gradient: const LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [
                                  AppColors.colorPrimary,
                                  AppColors.colorSecondary
                                ])),
                        backgroundColor: AppColors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(h * 0.006),
                        ),
                        text: AppText.rentNow,
                        textStyle: ptSansTextStyle(
                            color: AppColors.white,
                            fontSize: h * 0.022,
                            fontWeight: FontWeight.w700),
                        onPressed: () {
                          ///Order Confirm Dialog
                          ref
                              .read(dialogServiceProvider)
                              .orderConfirmAlertDialog();
                        }),
                  )
                      .animate()
                      .fadeIn(duration: 1300.ms)
                      .then(delay: 1300.ms)
                      .slideY(
                          begin: 10,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms),
                ],
              ),
            );
          },
          error: (error, stackTrace) => ErrorScreen(
              text: error.toString(),
              backgroundColor: AppColors.white,
              color: AppColors.red),
          loading: () {
            return const RentNowShimmer();
          }),
    );
  }
}
