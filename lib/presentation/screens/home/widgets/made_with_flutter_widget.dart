import 'package:avatar_glow/avatar_glow.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class MadeWithFlutterWidget extends StatelessWidget {
  const MadeWithFlutterWidget({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.end,
    required this.size,
  });
  final MainAxisAlignment mainAxisAlignment;
  final double size;

  @override
  Widget build(BuildContext context) {
    final color = context.primaryColor;
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(
          ' Made with ',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            // fontFamily: kRobotoFont,
          ),
        ),
        SizedBox(width: 10),
        AvatarGlow(
          glowCount: 1,
          glowColor: color,
          glowRadiusFactor: 1.2,
          // glowBorderRadius: BorderRadius.circular(20),
          // showTwoGlows: false,
          child: const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 12,
          ),
        ),
        SizedBox(width: 10),
        Text(
          ' in ',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            // fontFamily: kRobotoFont,
          ),
        ),
        FlutterLogo(
          size: size,
        ),
        Text(
          ' Flutter  ',
          style: TextStyle(
            // fontWeight: FontWeight.bold,
            fontSize: size,
            color: color,
            // fontFamily: kRobotoFont,
          ),
        ),
      ],
    );
  }
}
