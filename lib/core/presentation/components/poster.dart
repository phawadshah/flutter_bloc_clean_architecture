import 'package:flutter/material.dart';
import 'package:sgm_block/core/presentation/components/image.dart';

class KPoster extends StatelessWidget {
  final String src;
  final double? height;
  const KPoster(
    this.src, {
    super.key,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.transparent,
            Colors.black.withOpacity(.71),
          ],
        ).createShader(bounds);
      },
      blendMode: BlendMode.darken,
      child: KImage(
        src,
        height: height ?? MediaQuery.of(context).size.height / 1.6,
        width: double.infinity,
        fit: BoxFit.fill,
      ),
    );
  }
}
