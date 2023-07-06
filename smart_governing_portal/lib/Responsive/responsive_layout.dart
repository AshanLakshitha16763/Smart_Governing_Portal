import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileDesign;
  final Widget tabletDesign;
  final Widget desktopDesign;

  const ResponsiveLayout({
      super.key, 
      required this.mobileDesign,
      required this.tabletDesign,
      required this.desktopDesign});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth < 500) {
        return mobileDesign;
      } else if (constraints.maxWidth < 1100) {
        return tabletDesign;
      } else {
        return desktopDesign;
      }
    });
  }
}
