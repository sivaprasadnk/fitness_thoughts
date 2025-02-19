import 'package:fitness_thoughts/core/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class ReadMoreButton extends StatelessWidget {
  const ReadMoreButton({
    super.key,
    this.callback,
    this.color = Colors.black,
    this.absorbing = false,
  });

  final VoidCallback? callback;
  final Color color;
  final bool absorbing;

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: absorbing,
      child: GestureDetector(
        onTap: () async {
          if (callback != null) {
            callback!.call();
          }
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
              Icons.arrow_forward_rounded,
              color: color,
              size: 16,
            )
          ],
        ),
      ),
    ).showCursorOnHover;
  }
}
