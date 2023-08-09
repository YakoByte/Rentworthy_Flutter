import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:rentworthy/utils/common_components/back_gradient.dart';

import '../../../utils/color.dart';
import '../../../utils/common_components/rent_lend_enjoy_icon.dart';
import 'login_screen_controller.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final asyncState = ref.watch(loginScreenControllerProvider);
    controller() => ref.read(loginScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: w,
        height: h,
        color: AppColors.white,
        child: Stack(
          children: [
            const Positioned(
                left: 0, right: 0, top: 0, bottom: 0, child: BackGradient()),
            Positioned(
                top: h * 0.1,
                bottom: h * 0.1,
                left: w * 0.1,
                right: w * 0.1,
                child: const RentLendEnjoyIcon()),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              top: h * 0.25,
              child: Container(
                height: h * 0.7,
                decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(h * 0.025)),
                child: Column(
                  children: [],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
