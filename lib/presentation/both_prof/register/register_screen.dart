import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rentworthy/application/validate/validate.dart';
import 'package:rentworthy/presentation/both_prof/register/reg_widget/reg_widget.dart';
import 'package:rentworthy/utils/common_components/back_gradient.dart';
import 'package:rentworthy/utils/common_components/common_button.dart';
import 'package:rentworthy/utils/common_components/common_navigator.dart';
import 'package:rentworthy/utils/common_components/text_input_field.dart';
import 'package:rentworthy/utils/text.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/common_loader.dart';
import '../../../utils/common_components/common_text.dart';
import '../../../utils/common_components/rent_lend_enjoy_icon.dart';
import '../../../utils/images.dart';
import '../../indi_prof/account/setting/privacy_policy/privacy_policy.dart';
import '../../indi_prof/error/error_screen.dart';
import '../../shimmers/register_shimmer.dart';
import 'login_method/login_method_screen.dart';
import 'register_screen_controller.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(registerScreenControllerProvider);
    controller() => ref.read(registerScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    print("tab is ${controller().tabController.index}");

    return Scaffold(
      backgroundColor: AppColors.white,
      resizeToAvoidBottomInset: false,
      body: asyncState.when(
          data: (data) {
            return Container(
              width: w,
              height: h,
              color: AppColors.white,
              child: Stack(
                children: [
                  /// Back gradient
                  const Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: BackGradient()),

                  /// Rent Lend Enjoy Icon
                  Positioned(
                    top: h * 0.1,
                    bottom: h * 0.1,
                    left: w * 0.1,
                    right: w * 0.1,
                    child: const RentLendEnjoyIcon()
                        .animate()
                        .then(delay: 1.seconds)
                        .slideY(
                          begin: 0.4355,
                          end: 0,
                          curve: Curves.easeInOutCubic,
                          duration: 800.ms,
                        ),
                  ),

                  /// Register form, login method
                  Positioned(
                    bottom: -h * 0.01,
                    left: 0,
                    right: 0,
                    top: 0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: h * 0.75,
                          width: w,
                          decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(h * 0.025)),

                          /// checking loading state
                          child: controller().isLoading
                              ? CommonLoader()
                              : Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: w * 0.05,
                                      vertical: h * 0.025),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      /// checking login method or register
                                      controller().isSignIn
                                          ? const LoginMethodScreen()
                                          : const RegWidget(),

                                      /// Privacy policy and accepting
                                      Column(
                                        children: [
                                          CommonText(
                                            text: AppText.accepting,
                                            style: ptSansTextStyle(
                                                color: AppColors.black
                                                    .withOpacity(0.4),
                                                fontSize: h * 0.018,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              commonNavigator(
                                                context: context,
                                                child: const PrivacyPolicy(),
                                                type: PageTransitionType
                                                    .rightToLeftWithFade,
                                              );
                                            },
                                            child: SizedBox(
                                              height: h * 0.025,
                                              child: ShaderMask(
                                                shaderCallback: (Rect bounds) {
                                                  return const LinearGradient(
                                                      begin:
                                                          Alignment.centerLeft,
                                                      end:
                                                          Alignment.centerRight,
                                                      colors: [
                                                        AppColors.colorPrimary,
                                                        AppColors.colorSecondary
                                                      ]).createShader(bounds);
                                                },
                                                child: CommonText(
                                                    text: AppText.privacyPolicy,
                                                    style: ptSansTextStyle(
                                                        color: AppColors.white,
                                                        fontSize: h * 0.017,
                                                        decorationColor:
                                                            AppColors.white,
                                                        decorationThickness: 1,
                                                        decorationStyle:
                                                            TextDecorationStyle
                                                                .solid,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                        )
                            .animate()
                            .fadeIn(duration: 400.ms)
                            .then(delay: 1.seconds)
                            .slideY(
                                begin: 3,
                                end: 0,
                                curve: Curves.easeInOutCubic,
                                duration: 800.ms),
                      ],
                    ),
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
            return CommonLoader();
          }),
    );
  }
}
