import 'package:fitness_thoughts/core/constants.dart';
import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:flutter/material.dart';

class QuoteSection extends StatelessWidget {
  const QuoteSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 50),
          Image.asset(
            'assets/images/quote.png',
            height: context.isLargeDevice ? 75 : 40,
          ),
          SizedBox(height: 50),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              quote,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: context.isLargeDevice ? 24 : 16,
              ),
            ),
          ),
          SizedBox(height: 75),
        ],
      ),
    );
  }
}
