import 'package:fitness_thoughts/core/constants.dart';
import 'package:flutter/material.dart';

class CommonAssetImage extends StatelessWidget {
  const CommonAssetImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.fit = BoxFit.cover,
    this.cacheHeight,
  });
  final String imagePath;
  final double height;
  final int? cacheHeight;
  final double width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        cacheHeight: cacheHeight,
        fit: fit,
        errorBuilder: (context, error, stackTrace) {
          return SizedBox(
            height: height,
            width: width,
            child: Center(
              child: Icon(Icons.error),
            ),
          );
        },
      ),
    );
  }
}
