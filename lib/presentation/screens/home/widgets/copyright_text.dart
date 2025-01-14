import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class CopyrightText extends StatelessWidget {
  const CopyrightText({
    super.key,
    required this.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    final color = context.primaryColor;
    var year = DateTime.now().year;
    return Text(
      'Copyright © $year Sivaprasad NK .',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        fontFamily: kRobotoFont,
        fontSize: size,
        color: color,
      ),
    );
  }
}
