import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:flutter/material.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  // final String title;
  final List<Widget>? actions;
  final Widget? leading;
  final bool automaticallyImplyLeading;
  const CommonAppBar({
    super.key,
    // required this.title,
    this.actions,
    this.leading,
    required this.automaticallyImplyLeading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          Text(kAppName, style: const TextStyle(fontWeight: FontWeight.bold)),
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
