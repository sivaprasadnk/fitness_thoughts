import 'package:fitness_thoughts/core/constants.dart';
import 'package:flutter/material.dart';

extension ContextExtensions on BuildContext {
  Size get screenSize => MediaQuery.of(this).size;
  ThemeData get theme => Theme.of(this);
  Color get primaryColor => theme.primaryColor;
  double get screenWidth => screenSize.width;
  double get screenHeight => screenSize.height;
  bool get isMobileDevice => screenWidth < mobileBreakPoint;
  bool get isLargeDevice => !isMobileDevice;
  double get horizontalPadding => screenWidth > 1325
      ? 150
      : screenWidth > 950
          ? 80
          : 24;
}
