import 'dart:math' as math show sin, pi, sqrt;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/import_utils.dart';
import '../home_screen_controller.dart';
import 'curve_wave.dart';

class HomeSearch extends ConsumerWidget {
  const HomeSearch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(homeScreenControllerProvider);
    controller() => ref.read(homeScreenControllerProvider.notifier);
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: w * 0.05),
      child: SizedBox(
        height: h * 0.3,
        width: w,
        child: Stack(
          children: [
            ///Gradient container
            Container(
              height: h * 0.25,
              width: w,
              decoration: BoxDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        AppColors.colorPrimary,
                        AppColors.colorSecondary
                      ]),
                  borderRadius: BorderRadius.circular(16)),
              child: Padding(
                padding: EdgeInsets.only(
                    left: w * 0.045, bottom: h * 0.025, top: h * 0.01),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ///Text
                    SizedBox(
                      width: w * 0.4,
                      child: RichText(
                        textAlign: TextAlign.start,
                        text: TextSpan(
                          text: AppText.letsStart,
                          style: ptSansTextStyle(
                              color: AppColors.white,
                              fontSize: h * 0.026,
                              fontWeight: FontWeight.w400),
                          children: <TextSpan>[
                            TextSpan(
                                text: AppText.outOfThings,
                                style: ptSansTextStyle(
                                    color: AppColors.yellow,
                                    fontSize: h * 0.026,
                                    fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ),

                    ///Image
                    Image.asset(AppImg.homeImg,
                        height: h * 0.25, width: w * 0.45)
                  ],
                ),
              ),
            ),

            ///search bar
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///Search bar
                  Card(
                    elevation: 3,
                    color: AppColors.transparent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50)),
                    child: CommonSearchBar(
                      containerwidth: w * 0.8,
                      containerheight: h * 0.07,
                      suffixicon: (controller().speechRecognitionAvailable ==
                                  false ||
                              controller().isListening == false)
                          ? CommonIconButton(
                              containerwidth: h * 0.07,
                              containerheight: h * 0.07,
                              backgroundColor: AppColors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50)),
                              centericon: Icon(Icons.mic,
                                  color: AppColors.gray.withOpacity(0.6),
                                  size: h * 0.03),
                              onPressed: () {
                                if (controller().speechRecognitionAvailable &&
                                    !controller().isListening) {
                                  // debugPrint(
                                  //     "ssdsdpeechRecognitionAvailable ${controller().speechRecognitionAvailable}");
                                  // debugPrint(
                                  //     "isListeningisListening ${controller().isListening}");

                                  ///start listening
                                  controller().start();
                                }
                              })
                          : GestureDetector(
                              onTap: () {
                                ///stop listening
                                controller().stop();
                              },
                              child: CustomPaint(
                                painter: CirclePainter(
                                  controller().animationController!,
                                  color: AppColors.colorSecondary,
                                ),
                                child: SizedBox(
                                  width: h * 0.07,
                                  height: h * 0.07,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(1000),
                                    child: ScaleTransition(
                                        scale: Tween(begin: 0.95, end: 1.0)
                                            .animate(
                                          CurvedAnimation(
                                            parent: controller()
                                                .animationController!,
                                            curve: CurveWave(),
                                          ),
                                        ),
                                        child: Icon(Icons.mic,
                                            color: AppColors.white
                                                .withOpacity(0.8),
                                            size: h * 0.03)),
                                  ),
                                ),
                              ),
                            ),
                      searchController: controller().searchController,
                      onsearchChanged: (str) {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// mic animation
class CirclePainter extends CustomPainter {
  CirclePainter(
    this._animation, {
    required this.color,
  }) : super(repaint: _animation);
  final Color color;
  final Animation<double> _animation;

  void circle(Canvas canvas, Rect rect, double value) {
    final double opacity = (1.0 - (value / 4.0)).clamp(0.0, 1.0);
    final Color _color = color.withOpacity(opacity);
    final double size = rect.width / 2;
    final double area = size * size;
    final double radius = math.sqrt(area * value / 4);
    final Paint paint = Paint()
      ..shader = RadialGradient(
        colors: [AppColors.colorPrimary, _color.withOpacity(0.0)],
      ).createShader(rect);
    canvas.drawCircle(rect.center, radius, paint);
  }

  @override
  void paint(Canvas canvas, Size size) {
    final Rect rect = Rect.fromLTRB(0.0, 0.0, size.width, size.height);
    for (int wave = 3; wave >= 0; wave--) {
      circle(canvas, rect, wave + _animation.value);
    }
  }

  @override
  bool shouldRepaint(CirclePainter oldDelegate) => true;
}
