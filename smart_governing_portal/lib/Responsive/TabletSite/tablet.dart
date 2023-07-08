//This is the place for develop the web site according to the tablet sizes


import 'package:flutter/material.dart';
import 'package:smart_governing_portal/Responsive/DesktopSite/home_page.dart';

class TabletDesign extends StatefulWidget {
  const TabletDesign({super.key});

  @override
  State<TabletDesign> createState() => _TabletDesignState();
}

class _TabletDesignState extends State<TabletDesign> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}