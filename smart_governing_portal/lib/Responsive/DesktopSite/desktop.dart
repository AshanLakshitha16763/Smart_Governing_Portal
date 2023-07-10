//This is the place for develop the web site according to the desktop sizes

import 'package:flutter/material.dart';
import 'package:smart_governing_portal/Responsive/DesktopSite/home_page.dart';


class DesktopDesign extends StatefulWidget {
  const DesktopDesign({super.key});

  @override
  State<DesktopDesign> createState() => _DesktopDesignState();
}

class _DesktopDesignState extends State<DesktopDesign> {
  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
