// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:smart_governing_portal/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      body: InteractiveViewer(
        child: ListView(
          children: [
            //navbar
            navbar,
      
            //first section on the web
            SizedBox(
              height: h * 0.9,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: w * 0.5,
                      child: const Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                          child: Column(
                            children: [
                              Text(
                                "WELCOME",
                                style: TextStyle(
                                  fontFamily: 'Mitr',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 80,
                                  color: Color.fromARGB(255, 10, 4, 70),
                                ),
                              ),
                              Text(
                                "TO ",
                                style: TextStyle(
                                  fontFamily: 'Mitr',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 80,
                                  color: Color.fromARGB(255, 10, 4, 70),
                                ),
                              ),
                              Text(
                                "LET'S GOV",
                                style: TextStyle(
                                  fontFamily: 'Mitr',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 80,
                                  color: Color.fromARGB(255, 10, 4, 70),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: w * 0.5,
                  ), // chatbot here
                ],
              ),
            ),
      
            //second section on the web
            Padding(
              padding: const EdgeInsets.only(left: 120, right: 120, top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('lib/Assets/people.png'),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          'Explore Government Services in Sri Lanka....',
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 4, 70),
                            fontFamily: 'Inter',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final tileSize = constraints.maxWidth /
                          _calculateCrossAxisCount(context);
      
                      return Wrap(
                        spacing: 60.0,
                        runSpacing: 40.0,
                        children: _GOVserviceTiles(tileSize),
                      );
                    },
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
      
            //third section of the web
            Padding(
              padding: const EdgeInsets.only(left: 120, right: 120, top: 100),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('lib/Assets/serve.png'),
                      const SizedBox(width: 20),
                      const Expanded(
                        child: Text(
                          'Explore What We Serve You',
                          style: TextStyle(
                            color: Color.fromARGB(255, 10, 4, 70),
                            fontFamily: 'Inter',
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(40.0),
                    child: Text(
                      'Explore What We Serve YouLorem ipsum dolor sit amet, in vim nihil maiorum, vim et postea philosophia mediocritatem. Eu sit postea adolescens intellegam. Pri modus pericula ut, an vidisse aperiam nec, sed ea. animal inciderint. Etiam ceteros repudiandae ex usu, nec diam decore cu. Sea an libris.Lorem ipsum dolor sit amet, in vim nihil maiorum, vim et postea philosophia mediocritatem. Eu sit postea adolescens intellegam. Pri modus pericula ut, an vidisse aperiam nec, sed ea.',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final tileSize = constraints.maxWidth /
                          _calculateCrossAxisCountOURservices(context);
      
                      return Wrap(
                        spacing: 300.0,
                        runSpacing: 60.0,
                        children: _OURserviceTiles(tileSize),
                      );
                    },
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
            
            //Footer
            footer
          ],
        ),
      ),
    );
  }

// functions for the government services

  List<Widget> _GOVserviceTiles(double tileSize) {
    return [
      _GOVserviceTile(' AGRICULTURE, LIVESTOCK & FISHERIES',
          width: 298, height: 120, tileSize: tileSize, index: 0),
      _GOVserviceTile(' BANKING, TAX & INSURANCE',
          width: 300, height: 120, tileSize: tileSize, index: 1),
      _GOVserviceTile(' CITIZEN’S REGISTRATION',
          width: 300, height: 120, tileSize: tileSize, index: 2),
      _GOVserviceTile(' COMMUNICATION & MEDIA',
          width: 300, height: 120, tileSize: tileSize, index: 3),
      _GOVserviceTile(' EDUCATION & TRAINING',
          width: 300, height: 120, tileSize: tileSize, index: 4),
      _GOVserviceTile(' EMPLOYMENT INFORMATION',
          width: 300, height: 120, tileSize: tileSize, index: 5),
      _GOVserviceTile(' ENVIRONMENT',
          width: 300, height: 120, tileSize: tileSize, index: 6),
      _GOVserviceTile(' HEALTH, WELL BEING & SOCIAL SERVICE',
          width: 300, height: 120, tileSize: tileSize, index: 78),
      _GOVserviceTile(' HOUSING PROPERTY & UTILITIES',
          width: 300, height: 120, tileSize: tileSize, index: 9),
      _GOVserviceTile(' JUSTICE, LAW & RIGHTS',
          width: 300, height: 120, tileSize: tileSize, index: 10),
      _GOVserviceTile(' TRADE, BUSINESS & INDUSTRY',
          width: 300, height: 120, tileSize: tileSize, index: 11),
      _GOVserviceTile(' TRAVEL, TOURISM & LEISURE',
          width: 300, height: 120, tileSize: tileSize, index: 12),
    ];
  }

  Widget _GOVserviceTile(String text,
      {required double width,
      required double height,
      required double tileSize,
      required int index}) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          hoveredIndex = index;
        });
      },
      onExit: (event) {
        setState(() {
          hoveredIndex = -1;
        });
      },
      child: SizedBox(
        width: tileSize,
        height: tileSize * (height / width),
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: hoveredIndex == index
                ? const Color.fromARGB(255, 10, 4, 70)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color.fromARGB(255, 187, 191, 190),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.shade600,
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: hoveredIndex == index
                    ? Colors.white
                    : const Color.fromARGB(255, 10, 4, 70),
                fontFamily: 'Inter',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth = 300.0;
    int crossAxisCount = (screenWidth / tileWidth).floor();
    return crossAxisCount;
  }

//functions for Our service tiles

  List<Widget> _OURserviceTiles(double tileSize) {
    return [ 
      _OURserviceTile(' Smart National Identity Card Verification System',
          width: 360,
          height: 180,
          tileSize: tileSize,
          index: 0,
          imagePath: 'lib/Assets/ID.png'),
      _OURserviceTile(' Smart Driving License Verification System',
          width: 360,
          height: 180,
          tileSize: tileSize,
          index: 1,
          imagePath: 'lib/Assets/DL.png'),
      _OURserviceTile(' Inquiry Tracking System',
          width: 360,
          height: 180,
          tileSize: tileSize,
          index: 2,
          imagePath: 'lib/Assets/Inquiry.png'),
      _OURserviceTile(' Smart Passport Verification System',
          width: 360,
          height: 180,
          tileSize: tileSize,
          index: 3,
          imagePath: 'lib/Assets/Passport.png'),
    ];
  }

  // ignore: unused_element
  Widget _OURserviceTile(String text,
      {required double width,
      required double height,
      required double tileSize,
      required int index,
      required imagePath}) {
    return SizedBox(
      width: tileSize,
      height: tileSize * (height / width),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: hoveredIndex == index
              ? const Color.fromARGB(255, 10, 4, 70)
              : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: const Color.fromARGB(255, 187, 191, 190),
            width: 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade600,
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                width: 52,
                height: 52,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  int _calculateCrossAxisCountOURservices(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth = 360.0;
    int crossAxisCount = (screenWidth / tileWidth).floor();
    return crossAxisCount;
  }
}
