import 'package:flutter/material.dart';
import 'package:smart_governing_portal/Responsive/DesktopSite/desktop.dart';
import 'package:smart_governing_portal/Responsive/MobileSite/mobile.dart';
import 'package:smart_governing_portal/Responsive/responsive_layout.dart';
import 'package:smart_governing_portal/Responsive/TabletSite/tablet.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Governing Portal',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 205, 219, 243)),
        useMaterial3: true,
      ),
      home: const ResponsiveLayout(
        mobileDesign: MobileDesign(), 
        tabletDesign: TabletDesign(), 
        desktopDesign: DesktopDesign()),
    );
  }
}

