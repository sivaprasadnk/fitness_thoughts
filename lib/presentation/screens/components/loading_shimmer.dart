import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingShimmer extends StatelessWidget {
  const LoadingShimmer({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: kGreyColor,
      highlightColor: kBgColor,
      child: SizedBox(
        height: height,
        width: width,
        child: ColoredBox(
          color: kGreyColor,
        ),
      ),
    );
  }
}
