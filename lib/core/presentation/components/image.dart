import 'package:flutter/material.dart';

class KImage extends StatelessWidget {
  final String src;
  final double? height;
  final double? width;
  final BoxFit? fit;
  const KImage(
    this.src, {
    super.key,
    this.width,
    this.height,
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      src,
      fit: fit,
      height: height,
      width: width,
      frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
        if (frame != null) {
          return child;
        } else {
          return ImagePlaceHolder(height: height, width: width);
        }
      },
      errorBuilder: (context, error, stackTrace) {
        return ImagePlaceHolder(height: height, width: width);
      },
    );
  }
}

class ImagePlaceHolder extends StatelessWidget {
  final double? height;
  final double? width;
  const ImagePlaceHolder({
    super.key,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(16 / 2),
      decoration: BoxDecoration(
        color: Colors.grey[850]!,
      ),
    );
  }
}
