import 'package:cached_network_image/cached_network_image.dart';
import 'package:cached_network_image_platform_interface/cached_network_image_platform_interface.dart';
import 'package:flutter/material.dart';

class CommonNetworkImage extends StatelessWidget {
  const CommonNetworkImage({
    super.key,
    required this.imageUrl,
    required this.height,
    required this.width,
  });
  final String imageUrl;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: CachedNetworkImage(
        imageUrl: imageUrl,
        cacheKey: imageUrl,
        
        imageRenderMethodForWeb: ImageRenderMethodForWeb.HttpGet,
        height: height,
        width: width,
        // height: 280,
        fit: BoxFit.cover,
      ),
    );
  }
}
