import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
    return Text.rich(
      TextSpan(
        text: '© $year  ',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          // fontFamily: kRobotoFont,
          fontSize: size - 2,
          color: color,
        ),
        children: [
          TextSpan(
            text: 'www.sivaprasadnk.dev',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              // fontFamily: kRobotoFont,
              fontSize: size,
              color: Colors.blue, // Highlight the link
              // decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => launchUrl(Uri.parse('https://sivaprasadnk.dev')),
          ),
          // TextSpan(text: ' .'),
        ],
      ),
    );
  }
}
