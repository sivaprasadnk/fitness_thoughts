import 'package:auto_route/auto_route.dart';
import 'package:fitness_thoughts/core/common_strings.dart';
import 'package:fitness_thoughts/core/utils/extensions/widget_extensions.dart';
import 'package:fitness_thoughts/router.gr.dart';
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
      title: GestureDetector(
        onTap: () {
          AutoRouter.of(context).pushAndPopUntil(HomeRoute(),
              predicate: (route) => route.settings.name == HomeRoute.name);
          // AutoRouter.of(context).replaceAll([const HomeRoute()]);
        },
        child: Text(
          kAppName,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      elevation: 0,
      scrolledUnderElevation: 0,
      automaticallyImplyLeading: automaticallyImplyLeading,
      centerTitle: true,
    ).showCursorOnHover;
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
