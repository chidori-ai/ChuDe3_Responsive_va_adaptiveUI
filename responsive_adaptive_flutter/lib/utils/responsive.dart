import 'package:flutter/widgets.dart';

enum ScreenType { mobile, tablet, desktop }

class AppBreakpoints {
  AppBreakpoints._();

  static const double mobile = 600;
  static const double desktop = 900;
}

class Responsive {
  Responsive._();

  static ScreenType screenType(double width) {
    if (width < AppBreakpoints.mobile) return ScreenType.mobile;
    if (width < AppBreakpoints.desktop) return ScreenType.tablet;
    return ScreenType.desktop;
  }

  static int gridColumns(double width) {
    if (width < AppBreakpoints.mobile) return 1;
    if (width < AppBreakpoints.desktop) return 2;
    return 3;
  }

  static EdgeInsets pagePadding(double width) {
    if (width < AppBreakpoints.mobile) {
      return const EdgeInsets.all(16);
    }
    if (width < AppBreakpoints.desktop) {
      return const EdgeInsets.all(24);
    }
    return const EdgeInsets.symmetric(horizontal: 32, vertical: 24);
  }
}
