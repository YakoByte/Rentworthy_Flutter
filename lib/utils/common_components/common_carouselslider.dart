import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CommonCarousel extends ConsumerWidget {
  CommonCarousel(
      {Key? key,
      required this.enlargeFactor,
      required this.containerheight,
      required this.containerwidth,
      required this.viewportFraction,
      required this.scrollDirection,
      required this.autoPlayCurve,
      required this.aspectRatio,
      required this.itemBuilder,
      required this.enableInfiniteScroll,
      required this.autoPlay,
      required this.reverse,
      required this.itemCount,
      required this.carouselHeight,
      required this.carouselController,
      required this.disableGesture,
      required this.padding,
      this.enlargeCenterPage,
      this.items,
      this.onPageChanged})
      : super(key: key);
  List<Widget>? items;
  double containerwidth;
  double enlargeFactor;
  double viewportFraction;
  double aspectRatio;
  double carouselHeight;
  Curve autoPlayCurve;
  Axis scrollDirection;
  bool? enlargeCenterPage;
  bool enableInfiniteScroll;
  bool autoPlay;
  bool reverse;
  int itemCount;
  bool disableGesture;
  double containerheight;
  Widget Function(BuildContext, int, int)? itemBuilder;
  CarouselController carouselController;
  EdgeInsetsGeometry padding;
  dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: padding,
      child: CarouselSlider.builder(
        itemBuilder: itemBuilder,
        options: CarouselOptions(
          height: carouselHeight,
          aspectRatio: aspectRatio,
          viewportFraction: viewportFraction,
          initialPage: 0,
          enableInfiniteScroll: enableInfiniteScroll,
          reverse: reverse,
          autoPlay: autoPlay,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: autoPlayCurve,
          enlargeCenterPage: enlargeCenterPage,
          enlargeFactor: enlargeFactor,
          onPageChanged: onPageChanged,
          scrollDirection: scrollDirection,
        ),
        disableGesture: disableGesture,
        carouselController: carouselController,
        itemCount: itemCount,
      ),
    );
  }
}
