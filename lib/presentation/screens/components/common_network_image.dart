import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:fitness_thoughts/core/constants.dart';
import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
    required this.blogId,
  });
  final String imageUrl;
  final int blogId;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(defaultBorderRadius),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        cacheKey: blogId.toString(),
        imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
        height: height,
        width: width,
        fit: BoxFit.cover,
      ),
    );
  }
}
