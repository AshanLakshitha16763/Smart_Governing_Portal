import 'package:flutter/material.dart';
import 'package:smart_governing_portal/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navbar1,  //constants.dart file contains this 
      body: Column(
        children: [
          Container(),
          Container(),
          Container(),
        ],
      ),
    );
  }
}
