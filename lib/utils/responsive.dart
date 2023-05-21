import 'package:flutter/material.dart';

class Responsive extends StatelessWidget {
  const Responsive(
      {super.key,
      required Widget desktop,
      required Widget mobile,
      Widget? tablet});
  static const int mobileMaxWidth = 576;
  static const int tabletMaxWidth = 768;
  static const int desktopMaxWidth = 992;

  static bool isMobile(context) {
    return MediaQuery.of(context).size.width <= mobileMaxWidth;
  }

  static bool isTablet(context) {
    return mobileMaxWidth < MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width <= tabletMaxWidth;
  }

  static bool isDesktop(context) {
    return tabletMaxWidth < MediaQuery.of(context).size.width &&
        MediaQuery.of(context).size.width <= desktopMaxWidth;
  }

  static bool isLarge(context) {
    return desktopMaxWidth < MediaQuery.of(context).size.width;
  }

  static bool isSmall(context) {
    return mobileMaxWidth > MediaQuery.of(context).size.width;
  }

  static Widget getWidgetIfLarge(context, Widget widget) {
    return isSmall(context) ? Container() : widget;
  }

  static Map<String, double> getScreenReolution(context) {
    return {
      'width': MediaQuery.of(context).size.width,
      'height': MediaQuery.of(context).size.height
    };
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
