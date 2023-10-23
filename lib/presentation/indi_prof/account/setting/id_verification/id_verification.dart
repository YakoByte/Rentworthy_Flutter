import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/application/validate/validate.dart';
import 'package:rentworthy/utils/common_components/icon_text.dart';

import '../../../../../utils/color.dart';
import '../../../../../utils/common_components/common_appbar.dart';
import '../../../../../utils/common_components/common_button.dart';
import '../../../../../utils/common_components/common_text.dart';
import '../../../../../utils/common_components/text_input_field.dart';
import '../../../../../utils/images.dart';
import '../../../../../utils/text.dart';
import 'id_verification_controller.dart';

class IdVerification extends ConsumerStatefulWidget {
  const IdVerification({super.key});

  @override
  ConsumerState createState() => _IdVerificationState();
}

class _IdVerificationState extends ConsumerState<IdVerification> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(idVerificationControllerProvider);
    controller() => ref.read(idVerificationControllerProvider.notifier);

    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: true,
      appBar: CommonAppBar(
        leadingicon: true,
        padding: EdgeInsets.symmetric(
          horizontal: w * 0.02,
          vertical: h * 0.005,
        ),
        backgroundColor: AppColors.white,
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
            text: AppText.idverification,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: w * 0.04),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                controller().isVerified
                    ? AppImg.idvergreen
                    : AppImg.idverpurple,
                height: h * 0.35,
                width: w,
                fit: BoxFit.contain,
              ),
              Container(
                height: h * 0.4,
                child: controller().isVerified
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: w * 0.1),
                            child: CommonText(
                              textAlign: TextAlign.center,
                              style: ptSansTextStyle(
                                  fontSize: w * 0.053,
                                  color: AppColors.black.withOpacity(0.8),
                                  fontWeight: FontWeight.w700),
                              text: AppText.yourverified,
                            ),
                          ),
                          const SizedBox(),
                        ],
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CommonText(
                            textAlign: TextAlign.center,
                            style: ptSansTextStyle(
                                fontSize: w * 0.053,
                                color: AppColors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w700),
                            text: AppText.needverify,
                          ),
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: w * 0.045),
                            child: CommonText(
                              textAlign: TextAlign.center,
                              style: ptSansTextStyle(
                                  fontSize: w * 0.048,
                                  color: AppColors.black.withOpacity(0.6),
                                  fontWeight: FontWeight.w500),
                              text: AppText.verifyprof,
                            ),
                          ),
                          CommonText(
                            textAlign: TextAlign.center,
                            style: ptSansTextStyle(
                                fontSize: w * 0.053,
                                color: AppColors.black.withOpacity(0.8),
                                fontWeight: FontWeight.w700),
                            text: controller().onverify == true
                                ? AppText.entereinnumber
                                : AppText.verifyid,
                          ),
                          controller().onverify == true
                              ? TextInputField(
                                  isCounter: false,
                                  hintText: AppText.entereinnumber,
                                  lableText: AppText.writeeinnumber,
                                  enableunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  disableunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  focusunderlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  underlinecolor:
                                      AppColors.black.withOpacity(0.6),
                                  hintStyle: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      fontSize: h * 0.019,
                                      fontWeight: FontWeight.w400),
                                  textstyle: ptSansTextStyle(
                                      color: AppColors.black,
                                      fontSize: h * 0.019,
                                      fontWeight: FontWeight.w500),
                                  lableStyle: ptSansTextStyle(
                                      color: AppColors.black.withOpacity(0.6),
                                      fontSize: h * 0.021,
                                      fontWeight: FontWeight.w400),
                                  errorText: controller().isSubmit
                                      ? validate(
                                          controller().einController.text)
                                      : null,
                                  onChanged: (value) {
                                    setState(() {
                                      validate(controller().einController.text);
                                    });
                                  },
                                  errorStyle: ptSansTextStyle(
                                      color: AppColors.red,
                                      fontSize: h * 0.019,
                                      fontWeight: FontWeight.w400),
                                  controller: controller().einController,
                                  keyboardType: TextInputType.text,
                                  containerwidth: w,
                                  containerheight: h * 0.06,
                                  containercolor: AppColors.white,
                                  textCapitalization: TextCapitalization.none)
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: w * 0.35,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              IconText(
                                                title: "Passport",
                                                textStyle: ptSansTextStyle(
                                                    foreground: Paint()
                                                      ..shader =
                                                          const LinearGradient(
                                                        colors: <Color>[
                                                          AppColors
                                                              .colorPrimary,
                                                          AppColors
                                                              .colorSecondary
                                                        ],
                                                      ).createShader(const Rect
                                                              .fromLTRB(
                                                              20, 0, 300, 20)),
                                                    fontSize: h * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                subimg: false,
                                                preimg: true,
                                                preicon: Icons.circle_rounded,
                                                preshadermask: true,
                                                preimgcolor: AppColors.white,
                                                preiconsize: h * 0.012,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconText(
                                                title: "Driver License",
                                                textStyle: ptSansTextStyle(
                                                    foreground: Paint()
                                                      ..shader =
                                                          const LinearGradient(
                                                        colors: <Color>[
                                                          AppColors
                                                              .colorPrimary,
                                                          AppColors
                                                              .colorSecondary
                                                        ],
                                                      ).createShader(const Rect
                                                              .fromLTRB(
                                                              20, 0, 300, 20)),
                                                    fontSize: h * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                subimg: false,
                                                preimg: true,
                                                preicon: Icons.circle_rounded,
                                                preshadermask: true,
                                                preimgcolor: AppColors.white,
                                                preiconsize: h * 0.012,
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconText(
                                                title: "Govt. Issued ID",
                                                textStyle: ptSansTextStyle(
                                                    foreground: Paint()
                                                      ..shader =
                                                          const LinearGradient(
                                                        colors: <Color>[
                                                          AppColors
                                                              .colorPrimary,
                                                          AppColors
                                                              .colorSecondary
                                                        ],
                                                      ).createShader(const Rect
                                                              .fromLTRB(
                                                              20, 0, 300, 20)),
                                                    fontSize: h * 0.02,
                                                    fontWeight:
                                                        FontWeight.w600),
                                                subimg: false,
                                                preimg: true,
                                                preicon: Icons.circle_rounded,
                                                preshadermask: true,
                                                preimgcolor: AppColors.white,
                                                preiconsize: h * 0.012,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      ),
              ),
              Padding(
                padding: EdgeInsets.only(top: h * 0.02, bottom: h * 0.04),
                child: CommonButton(
                    containerwidth: w,
                    containerheight: h * 0.06,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(h * 0.005),
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              AppColors.colorPrimary,
                              AppColors.colorSecondary
                            ])),
                    backgroundColor: AppColors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(h * 0.005),
                    ),
                    text: controller().isVerified
                        ? AppText.backprof
                        : AppText.verfynow,
                    textStyle: ptSansTextStyle(
                        color: AppColors.white,
                        fontSize: h * 0.02,
                        fontWeight: FontWeight.w600),
                    onPressed: () {
                      controller().onerifiedTap();
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
