import 'package:fitness_thoughts/core/utils/extensions/context_extensions.dart';
import 'package:fitness_thoughts/core/utils/extensions/widget_extensions.dart';
import 'package:flutter/material.dart';

class MenuIcon extends StatelessWidget {
  const MenuIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return GestureDetector(
          onTap: () {
            Scaffold.of(context).openEndDrawer();
          },
          child: Icon(
            Icons.menu,
            color: context.primaryColor,
          ),
        );
      },
    ).showCursorOnHover;
  }
}
