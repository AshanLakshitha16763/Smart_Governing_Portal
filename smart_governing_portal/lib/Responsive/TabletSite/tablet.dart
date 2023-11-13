//This is the place for develop the web site according to the desktop sizes

import 'package:flutter/material.dart';
import 'package:smart_governing_portal/Responsive/TabletSite/adminLoginTablet.dart';




class TabletDesign extends StatefulWidget {
  const TabletDesign({super.key});

  @override
  State<TabletDesign> createState() => _TabletDesignState();
}

class _TabletDesignState extends State<TabletDesign> {
  @override
  Widget build(BuildContext context) {

   

    return adminLoginTablet();

  }
}

