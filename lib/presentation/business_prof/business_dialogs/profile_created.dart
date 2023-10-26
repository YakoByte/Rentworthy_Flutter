import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../utils/import_utils.dart';

class ProfileCreated extends ConsumerStatefulWidget {
  void Function(bool verfied) profVerified;

  ProfileCreated({super.key, required this.profVerified});

  @override
  ConsumerState createState() => _ProfileCreatedState();
}

class _ProfileCreatedState extends ConsumerState<ProfileCreated> {
  late final ConfettiController _controllerCenter;

  @override
  void initState() {
    // TODO: implement initState
    _controllerCenter =
        ConfettiController(duration: const Duration(seconds: 10));
    _controllerCenter.play();
    Future.delayed(const Duration(seconds: 3), () {
      widget.profVerified(true);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controllerCenter.dispose();
    super.dispose();
  }

  Path drawStar(Size size) {
    // Method to convert degree to radians
    double degToRad(double deg) => deg * (pi / 180.0);

    const numberOfPoints = 5;
    final halfWidth = size.width / 2;
    final externalRadius = halfWidth;
    final internalRadius = halfWidth / 2.5;
    final degreesPerStep = degToRad(360 / numberOfPoints);
    final halfDegreesPerStep = degreesPerStep / 2;
    final path = Path();
    final fullAngle = degToRad(360);
    path.moveTo(size.width, halfWidth);

    for (double step = 0; step < fullAngle; step += degreesPerStep) {
      path.lineTo(halfWidth + externalRadius * cos(step),
          halfWidth + externalRadius * sin(step));
      path.lineTo(halfWidth + internalRadius * cos(step + halfDegreesPerStep),
          halfWidth + internalRadius * sin(step + halfDegreesPerStep));
    }
    path.close();
    return path;
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    // return SizedBox();
    return StatefulBuilder(
      builder: (context, setState1) {
        return AlertDialog(
          surfaceTintColor: AppColors.white,
          backgroundColor: AppColors.backPopup,
          titlePadding: EdgeInsets.only(
              left: w * 0.055, right: w * 0.055, top: h * 0.02, bottom: 0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          insetPadding: EdgeInsets.only(
            left: w * 0.03,
            right: w * 0.03,
            top: h * 0.02,
            bottom: h * 0.02,
          ),
          contentPadding: EdgeInsets.only(
              left: w * 0.05, right: w * 0.05, bottom: h * 0.04, top: h * 0.02),
          buttonPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          iconPadding: EdgeInsets.zero,
          content: Container(
            height: h * 0.4,
            width: w,
            color: AppColors.backPopup,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: ConfettiWidget(
                      numberOfParticles: 50,
                      confettiController: _controllerCenter,
                      blastDirectionality: BlastDirectionality.explosive,
                      shouldLoop: true,
                      colors: const [
                        Color(0xFF7C588F),
                        Color(0xFF9A2ED1),
                        Color(0xFF281830),
                        Color(0xFFCD94EB),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: h * 0.01,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CommonText(
                          text: "Your profile has been created !!!",
                          style: ptSansTextStyle(
                              color: AppColors.black,
                              fontSize: h * 0.022,
                              fontWeight: FontWeight.w700)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
