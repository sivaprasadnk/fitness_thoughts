import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key,
    required this.title,
    this.textColor = Colors.black,
  });
  final String title;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w500,
            fontFamily: kPlayFairDisplayFont,
            color: textColor,
          ),
        ),
        SizedBox(height: 20),
        Container(
          height: 6,
          width: 50,
          color: Colors.orange,
        ),
      ],
    );
  }
}
