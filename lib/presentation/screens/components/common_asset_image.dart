import 'package:flutter/material.dart';

class CommonAssetImage extends StatelessWidget {
  const CommonAssetImage({
    super.key,
    required this.imagePath,
    required this.height,
    required this.width,
    this.fit = BoxFit.cover,
  });
  final String imagePath;
  final double height;
  final double width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Image.asset(
        imagePath,
        width: width,
        height: height,
        fit: fit,
      ),
    );
  }
}
