import 'package:flutter/material.dart';

extension HoverExtensions on Widget {
  Widget get showCursorOnHover {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: this,
    );
  }

  Widget get addBorder {
    return Container(
      decoration: BoxDecoration(border: Border.all()),
      child: this,
    );
  }
}
