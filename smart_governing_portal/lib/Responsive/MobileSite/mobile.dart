//This is the place for develop the web site according to the desktop sizes

import 'package:flutter/material.dart';


import 'package:smart_governing_portal/Responsive/DesktopSite/home_page.dart';
import 'package:smart_governing_portal/Responsive/MobileSite/adminLoginMobile.dart';

class MobileDesign extends StatefulWidget {
  const MobileDesign({super.key});

  @override
  State<MobileDesign> createState() => _MobileDesignState();
}

class _MobileDesignState extends State<MobileDesign> {
  @override
  Widget build(BuildContext context) {

    return RegistorMobile();

}

}