import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/application/dialog/dialod_service.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_appbar.dart';
import '../../../utils/common_components/common_button.dart';
import '../../../utils/common_components/common_dropdown_multiselect.dart';
import '../../../utils/common_components/common_gridview.dart';
import '../../../utils/common_components/common_iconbutton.dart';
import '../../../utils/common_components/common_navigator.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/dropdown/src/properties/clear_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_button_props.dart';
import '../../../utils/common_components/dropdown/src/properties/dropdown_decorator_props.dart';
import '../../../utils/common_components/gradient_track_shape.dart';
import '../../../utils/common_components/text_input_field.dart';
import '../../../utils/globals.dart';
import '../../../utils/images.dart';
import '../../../utils/text.dart';
import '../../indi_prof/error/error_screen.dart';
import '../../shimmers/business_info_shimmer.dart';
import '../admin_panel/admin_panel.dart';
import '../business_widgets/business_nav_drawer.dart';
import '../business_widgets/business_search.dart';
import '../user_prof/user_prof_screen.dart';
import 'business_info_screen_controller.dart';

class BusinessInfoScreen extends ConsumerStatefulWidget {
  const BusinessInfoScreen({super.key});

  @override
  ConsumerState createState() => _BusinessInfoScreenState();
}

class _BusinessInfoScreenState extends ConsumerState<BusinessInfoScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(businessInfoScreenControllerProvider);
    controller() => ref.read(businessInfoScreenControllerProvider.notifier);
    final h = MediaQuery
        .of(context)
        .size
        .height;
    final w = MediaQuery
        .of(context)
        .size
        .width;
    return Scaffold(
      key: Globals.profverified,
      drawer: AdminNavDrawer(
        selectedindex: 8,
      ).animate().fadeIn(duration: 30.ms).then(delay: 20.ms).slideX(
          begin: -1, end: 0, curve: Curves.easeInOutCubic, duration: 400.ms),
      appBar: controller().verified
          ? null
          : CommonAppBar(
        padding: EdgeInsets.symmetric(horizontal: w * 0.03),
        backgroundColor: AppColors.white,
        centerTitle: true,
        leadingicon: false,
        suffixicon: SizedBox(
          width: w * 0.1,
        ),
        leadicon: CommonIconButton(
            containerwidth: w * 0.1,
            containerheight: h * 0.08,
            backgroundColor: AppColors.white,
            shape: LinearBorder.none,
            centericon: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_back,
                  size: h * 0.035,
                ),
              ],
            ),
            onPressed: () {
              Navigator.pop(context);
            })
            .animate()
            .fadeIn(duration: 30.ms)
            .then(delay: 20.ms)
            .slideX(
            begin: 2,
            end: 0,
            curve: Curves.easeInOutCubic,
            duration: 400.ms),
        centerwidget: CommonText(
            text: "Your Information",
            style: ptSansTextStyle(
                color: AppColors.black,
                fontSize: h * 0.025,
                fontWeight: FontWeight.w600))
            .animate()
            .fadeIn(duration: 30.ms)
            .then(delay: 20.ms)
            .slideX(
            begin: 2,
            end: 0,
            curve: Curves.easeInOutCubic,
            duration: 400.ms),
      ),
      body: asyncState.when(
          data: (data) {
            if (controller().isLoading) {
              return const BusinessInfoShimmer();
            }
            return Container(
              color: AppColors.white,
              child: controller().verified
                  ? SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BusinessSearch(
                        adminscaffoldKey: Globals.profverified),
                    // .animate()
                    // .fadeIn(duration: 300.ms)
                    // .then(delay: 300.ms)
                    // .slideX(
                    //   begin: 1,
                    //   end: 0,
                    //   curve: Curves.easeInOutCubic,
                    //   duration: 600.ms,
                    // ),
                    controller().underreview
                        ? controller().banned
                        ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.05),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller().onBanned(val: true);
                            },
                            child: Image.asset(AppImg.banned,
                                height: h * 0.3,
                                width: w * 0.6,
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.015),
                            child: CommonText(
                                text:
                                "Your profile has been banned by Admin ",
                                textAlign: TextAlign.center,
                                style: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.023,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.015),
                            child: CommonText(
                                text:
                                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                                textAlign: TextAlign.center,
                                style: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.018,
                                  fontWeight: FontWeight.w400,
                                )),
                          ),
                          GestureDetector(
                            onTap: () {
                              commonNavigator(
                                context: context,
                                child: BusinessUserProf(),
                                type: PageTransitionType
                                    .rightToLeftWithFade,
                              );
                            },
                            child: ShaderMask(
                              shaderCallback: (Rect bounds) {
                                return const LinearGradient(
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                  colors: [
                                    AppColors.colorPrimary,
                                    AppColors.colorSecondary,
                                  ],
                                ).createShader(bounds);
                              },
                              child: CommonText(
                                  text: "View Profile",
                                  style: ptSansTextStyle(
                                      color: AppColors.white,
                                      decoration: TextDecoration
                                          .underline,
                                      decorationColor:
                                      AppColors.white,
                                      fontSize: h * 0.021,
                                      fontWeight:
                                      FontWeight.w600)),
                            ),
                          )
                        ],
                      ),
                    )
                        : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: w * 0.1),
                      child: Column(
                        mainAxisAlignment:
                        MainAxisAlignment.center,
                        crossAxisAlignment:
                        CrossAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              controller().onBanned(val: true);
                            },
                            child: Image.asset(
                                AppImg.underreview,
                                height: h * 0.3,
                                width: w * 0.6,
                                fit: BoxFit.cover),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: h * 0.015),
                            child: CommonText(
                                text:
                                "Your profile is under review ",
                                style: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.023,
                                  fontWeight: FontWeight.w600,
                                )),
                          ),
                          CommonText(
                              text:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis.",
                              textAlign: TextAlign.center,
                              style: ptSansTextStyle(
                                color: AppColors.black
                                    .withOpacity(0.6),
                                fontSize: h * 0.018,
                                fontWeight: FontWeight.w400,
                              )),
                        ],
                      ),
                    )
                        : Card(
                      elevation: 5,
                      color: AppColors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      child: Container(
                        width: w * 0.9,
                        height: h * 0.45,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            borderRadius:
                            BorderRadius.circular(12)),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller()
                                    .onUnderReview(val: true);
                              },
                              child: Image.asset(AppImg.verified,
                                  height: h * 0.3,
                                  width: w * 0.6,
                                  fit: BoxFit.cover),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: h * 0.01),
                              child: CommonText(
                                  text:
                                  "Your Profile will be verified in 1-3 Days.",
                                  style: ptSansTextStyle(
                                      foreground: Paint()
                                        ..shader =
                                        const LinearGradient(
                                          colors: <Color>[
                                            AppColors.colorPrimary,
                                            AppColors.colorSecondary
                                          ],
                                        ).createShader(
                                            const Rect.fromLTRB(
                                                100,
                                                0,
                                                300,
                                                20)),
                                      fontSize: h * 0.022,
                                      fontWeight: FontWeight.w600)),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.2,
                    )
                  ],
                ),
              )
                  : SingleChildScrollView(
                child: Column(
                  children: [
                    Divider(
                      color: AppColors.black.withOpacity(0.1),
                      height: h * 0.01,
                      thickness: 1,
                    )
                        .animate()
                        .fadeIn(duration: 100.ms)
                        .then(delay: 100.ms)
                        .slideX(
                        begin: 2,
                        end: 0,
                        curve: Curves.easeInOutCubic,
                        duration: 500.ms),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: w * 0.035),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:
                            EdgeInsets.symmetric(vertical: h * 0.02),
                            child: CommonText(
                                text: "Basic Information",
                                style: ptSansTextStyle(
                                    color: AppColors.black,
                                    fontSize: h * 0.025,
                                    fontWeight: FontWeight.w600))
                                .animate()
                                .fadeIn(duration: 150.ms)
                                .then(delay: 150.ms)
                                .slideX(
                                begin: 2,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 600.ms),
                          ),
                          TextInputField(
                              hintText: "Business name",
                              onChanged: (value) {
                                setState(() {});
                              },
                              enableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              disableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              focusunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              underlinecolor:
                              AppColors.black.withOpacity(0.6),
                              hintStyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              textstyle: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w500),
                              titletextstyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w500),
                              errorText: "",
                              errorStyle: ptSansTextStyle(
                                  color: AppColors.red,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              controller:
                              controller().businessnameController,
                              keyboardType: TextInputType.text,
                              containerwidth: w,
                              underline: false,
                              borderRadius: BorderRadius.circular(4),
                              containerborder: Border.all(
                                  color: AppColors.black
                                      .withOpacity(0.4)),
                              containerheight: h * 0.06,
                              containercolor: AppColors.white,
                              textCapitalization:
                              TextCapitalization.none)
                              .animate()
                              .fadeIn(duration: 170.ms)
                              .then(delay: 170.ms)
                              .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 630.ms),
                          TextInputField(
                              hintText: "EIN ID",
                              onChanged: (value) {
                                setState(() {});
                              },
                              enableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              disableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              focusunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              underlinecolor:
                              AppColors.black.withOpacity(0.6),
                              hintStyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              textstyle: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w500),
                              titletextstyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w500),
                              errorText: "",
                              errorStyle: ptSansTextStyle(
                                  color: AppColors.red,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              controller:
                              controller().einIdController,
                              keyboardType: TextInputType.text,
                              containerwidth: w,
                              underline: false,
                              borderRadius: BorderRadius.circular(4),
                              containerborder: Border.all(
                                  color: AppColors.black
                                      .withOpacity(0.4)),
                              containerheight: h * 0.06,
                              containercolor: AppColors.white,
                              textCapitalization:
                              TextCapitalization.none)
                              .animate()
                              .fadeIn(duration: 190.ms)
                              .then(delay: 190.ms)
                              .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 660.ms),
                          TextInputField(
                              hintText: "About Business ( optional )",
                              onChanged: (value) {
                                setState(() {});
                              },
                              enableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              disableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              focusunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              underlinecolor:
                              AppColors.black.withOpacity(0.6),
                              hintStyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              textstyle: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w500),
                              titletextstyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w500),
                              errorText: "",
                              errorStyle: ptSansTextStyle(
                                  color: AppColors.red,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              controller:
                              controller().einIdController,
                              keyboardType: TextInputType.text,
                              containerwidth: w,
                              underline: false,
                              center: false,
                              borderRadius: BorderRadius.circular(4),
                              containerborder: Border.all(
                                  color: AppColors.black
                                      .withOpacity(0.4)),
                              containerheight: h * 0.16,
                              containercolor: AppColors.white,
                              textCapitalization:
                              TextCapitalization.none)
                              .animate()
                              .fadeIn(duration: 210.ms)
                              .then(delay: 210.ms)
                              .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 690.ms),
                          TextInputField(
                              hintText: "Business Address",
                              onChanged: (value) {
                                setState(() {});
                              },
                              enableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              disableunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              focusunderlinecolor:
                              AppColors.black.withOpacity(0.6),
                              underlinecolor:
                              AppColors.black.withOpacity(0.6),
                              hintStyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              textstyle: ptSansTextStyle(
                                  color: AppColors.black,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w500),
                              titletextstyle: ptSansTextStyle(
                                  color: AppColors.black
                                      .withOpacity(0.6),
                                  fontSize: h * 0.021,
                                  fontWeight: FontWeight.w500),
                              errorText: "",
                              errorStyle: ptSansTextStyle(
                                  color: AppColors.red,
                                  fontSize: h * 0.019,
                                  fontWeight: FontWeight.w400),
                              controller:
                              controller().einIdController,
                              keyboardType: TextInputType.text,
                              containerwidth: w,
                              underline: false,
                              center: false,
                              maxLength: 200,
                              isCounter: true,
                              borderRadius: BorderRadius.circular(4),
                              containerborder: Border.all(
                                  color: AppColors.black
                                      .withOpacity(0.4)),
                              containerheight: h * 0.16,
                              containercolor: AppColors.white,
                              textCapitalization:
                              TextCapitalization.none)
                              .animate()
                              .fadeIn(duration: 230.ms)
                              .then(delay: 230.ms)
                              .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 700.ms),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                      EdgeInsets.symmetric(horizontal: w * 0.035),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CommonText(
                                  text: "Contact information",
                                  style: ptSansTextStyle(
                                      color: AppColors.black,
                                      fontSize: h * 0.025,
                                      fontWeight: FontWeight.w600)),
                            ],
                          )
                              .animate()
                              .fadeIn(duration: 290.ms)
                              .then(delay: 290.ms)
                              .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 730.ms),
                          Container(
                            height: h * 0.125,
                            child: Stack(
                              children: [
                                TextInputField(
                                    hintText: "",
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    underlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    hintStyle: ptSansTextStyle(
                                        color: AppColors.black
                                            .withOpacity(0.6),
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
                                    textstyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w500),
                                    titletextstyle: ptSansTextStyle(
                                        color: AppColors.black
                                            .withOpacity(0.6),
                                        fontSize: h * 0.021,
                                        fontWeight: FontWeight.w500),
                                    errorText: "",
                                    errorStyle: ptSansTextStyle(
                                        color: AppColors.red,
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
                                    controller:
                                    controller().priceController,
                                    keyboardType: TextInputType.number,
                                    containerwidth: w,
                                    underline: false,
                                    borderRadius:
                                    BorderRadius.circular(4),
                                    prefix: IntrinsicHeight(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.012),
                                        child: Row(
                                          children: [
                                            CommonText(
                                                text: "+91",
                                                style: ptSansTextStyle(
                                                    color: AppColors.black
                                                        .withOpacity(0.4),
                                                    fontSize: h * 0.02,
                                                    fontWeight:
                                                    FontWeight.w500)),
                                            VerticalDivider(
                                              color: AppColors.black
                                                  .withOpacity(0.4),
                                              thickness: 1.3,
                                              width: w * 0.04,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    containerborder: Border.all(
                                        color: AppColors.black
                                            .withOpacity(0.4)),
                                    containerheight: h * 0.07,
                                    containercolor: AppColors.white,
                                    textCapitalization:
                                    TextCapitalization.none),
                                Positioned(
                                  bottom: 0,
                                  right: w * 0.1,
                                  left: 0,
                                  child: CommonText(
                                      text:
                                      "Yay! Your number is verified.",
                                      style: ptSansTextStyle(
                                          color: AppColors.black
                                              .withOpacity(0.5),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 310.ms)
                              .then(delay: 310.ms)
                              .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 760.ms),
                          Container(
                            height: h * 0.18,
                            child: Stack(
                              children: [
                                TextInputField(
                                    hintText: "",
                                    onChanged: (value) {
                                      setState(() {});
                                    },
                                    enableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    disableunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    focusunderlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    underlinecolor:
                                    AppColors.black.withOpacity(0.6),
                                    hintStyle: ptSansTextStyle(
                                        color: AppColors.black
                                            .withOpacity(0.6),
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
                                    textstyle: ptSansTextStyle(
                                        color: AppColors.black,
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w500),
                                    titletextstyle: ptSansTextStyle(
                                        color: AppColors.black
                                            .withOpacity(0.6),
                                        fontSize: h * 0.021,
                                        fontWeight: FontWeight.w500),
                                    errorText: "",
                                    errorStyle: ptSansTextStyle(
                                        color: AppColors.red,
                                        fontSize: h * 0.019,
                                        fontWeight: FontWeight.w400),
                                    controller:
                                    controller().priceController,
                                    keyboardType:
                                    TextInputType.emailAddress,
                                    containerwidth: w,
                                    underline: false,
                                    borderRadius:
                                    BorderRadius.circular(4),
                                    prefix: IntrinsicHeight(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: w * 0.012),
                                        child: Row(
                                          children: [
                                            Image.asset(
                                              AppImg.google,
                                              color: AppColors.black
                                                  .withOpacity(0.4),
                                              height: h * 0.02,
                                              width: h * 0.02,
                                            ),
                                            VerticalDivider(
                                              color: AppColors.black
                                                  .withOpacity(0.4),
                                              thickness: 1.3,
                                              width: w * 0.04,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    containerborder: Border.all(
                                        color: AppColors.black
                                            .withOpacity(0.4)),
                                    containerheight: h * 0.07,
                                    containercolor: AppColors.white,
                                    textCapitalization: TextCapitalization
                                        .none),
                                Positioned(
                                  bottom: 0,
                                  right: w * 0.02,
                                  left: 0,
                                  child: CommonText(
                                      text:
                                      "Your email is never shared with external parties nor do we use it to spam you in any way.",
                                      style: ptSansTextStyle(
                                          color: AppColors.black
                                              .withOpacity(0.5),
                                          fontSize: h * 0.02,
                                          fontWeight: FontWeight.w400)),
                                )
                              ],
                            ),
                          )
                              .animate()
                              .fadeIn(duration: 330.ms)
                              .then(delay: 330.ms)
                              .slideX(
                              begin: 2,
                              end: 0,
                              curve: Curves.easeInOutCubic,
                              duration: 790.ms),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: h * 0.02, horizontal: w * 0.035),
                          child: CommonButton(
                              containerwidth: w * 0.4,
                              containerheight: h * 0.06,
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(h * 0.006),
                                  gradient: const LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        AppColors.colorPrimary,
                                        AppColors.colorSecondary
                                      ])),
                              backgroundColor: AppColors.transparent,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                BorderRadius.circular(h * 0.006),
                              ),
                              text: AppText.continueeng,
                              textStyle: ptSansTextStyle(
                                  color: AppColors.white,
                                  fontSize: h * 0.023,
                                  fontWeight: FontWeight.w700),
                              onPressed: () {
                                controller().onCont();
                              }),
                        )
                            .animate()
                            .fadeIn(duration: 700.ms)
                            .then(delay: 700.ms)
                            .slideX(
                            begin: 2,
                            end: 0,
                            curve: Curves.easeInOutCubic,
                            duration: 1700.ms),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) =>
              ErrorScreen(
                  text: error.toString(),
                  backgroundColor: AppColors.white,
                  color: AppColors.red),
          loading: () {
            return const BusinessInfoShimmer();
          }),
    );
  }
}
