import 'package:fitness_thoughts/core/locator.dart';
import 'package:fitness_thoughts/core/utils/extensions/widget_extensions.dart';
import 'package:fitness_thoughts/domain/use_case/get_recent_posts.dart';
import 'package:flutter/material.dart';

class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({
    super.key,
    this.callback,
    this.color = Colors.black,
  });

  final VoidCallback? callback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (callback != null) {
          callback!.call();
        }
        await locator<GetRecentPosts>().call();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Text(
              'Read More',
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(width: 10),
          Icon(
            Icons.arrow_forward,
            color: color,
            size: 16,
          )
        ],
      ),
    ).showCursorOnHover;
  }
}
