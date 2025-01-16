import 'package:fitness_thoughts/core/common_colors.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/presentation/screens/components/common_asset_image.dart';
import 'package:flutter/material.dart';

class CoverImage extends StatelessWidget {
  const CoverImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CommonAssetImage(
          imagePath: 'assets/images/cover2.jpg',
          height: context.isLargeDevice ? 500 : 320,
          width: double.infinity,
        ),
        // Container(
        //   // margin: EdgeInsets.only(
        //   //   left: horizontalPadding,
        //   //   right: horizontalPadding,
        //   //   bottom: width > 945 ? 0 : 0,
        //   // ),
        //   height: context.isLargeDevice ? 500 : 320,
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     gradient: LinearGradient(
        //       begin: Alignment.bottomCenter,
        //       end: Alignment.topCenter,
        //       colors: [
        //         kBlackColor,
        //         kTransparentColor,
        //       ],
        //       stops: [0, 1],
        //     ),
        //   ),
        // ),
        Positioned.fill(
          bottom: context.isLargeDevice ? 50 : 20,
          left: context.isLargeDevice ? 50 : 20,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(
              'Welcome to $kAppName',
              style: TextStyle(
                color: kWhiteColor,
                fontSize: context.isLargeDevice ? 36 : 24,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        )
      ],
    );
  }
}
