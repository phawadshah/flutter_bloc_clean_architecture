import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class KSlider extends StatelessWidget {
  final int itemCount;
  final Widget Function(BuildContext context, int itemIndex, int) itemBuilder;
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  const KSlider({
    required this.itemCount,
    required this.itemBuilder,
    this.onPageChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return CarouselSlider.builder(
      itemCount: itemCount,
      options: CarouselOptions(
        viewportFraction: 1,
        height: size.height * 0.63,
        autoPlay: true,
        padEnds: false,
        onPageChanged: onPageChanged,
      ),
      itemBuilder: itemBuilder,
    );
  }
}
