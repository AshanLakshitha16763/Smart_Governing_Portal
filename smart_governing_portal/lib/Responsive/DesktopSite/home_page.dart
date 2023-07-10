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
      appBar: navbar1,
      body: ListView(
        children: [
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
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 120, right: 120, top: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset('lib/Assets/people.png'),
                      const SizedBox(width: 20),
                      const Text(
                        'Explore Government Services in Sri Lanka....',
                        style: TextStyle(
                          color: Color.fromARGB(255, 10, 4, 70),
                          fontFamily: 'Inter',
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 60),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final tileSize = constraints.maxWidth / _calculateCrossAxisCount(context);

                      return Wrap(
                        spacing: 60.0,
                        runSpacing: 40.0,
                        children: _buildTiles(tileSize),
                      );
                    },
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          Container(),
        ],
      ),
    );
  }

  List<Widget> _buildTiles(double tileSize) {
    return [
      _buildTile(' AGRICULTURE, LIVESTOCK & FISHERIES', width: 298, height: 120, tileSize: tileSize, index: 0),
      _buildTile(' BANKING, TAX & INSURANCE', width: 300, height: 120, tileSize: tileSize, index: 1),
      _buildTile(' CITIZEN’S REGISTRATION', width: 300, height: 120, tileSize: tileSize, index: 2),
      _buildTile(' COMMUNICATION & MEDIA', width: 300, height: 120, tileSize: tileSize, index: 3),
      _buildTile(' EDUCATION & TRAINING', width: 300, height: 120, tileSize: tileSize, index: 4),
      _buildTile(' EMPLOYMENT INFORMATION', width: 300, height: 120, tileSize: tileSize, index: 5),
      _buildTile(' ENVIRONMENT', width: 300, height: 120, tileSize: tileSize, index: 6),
      _buildTile(' HEALTH, WELL BEING & SOCIAL SERVICE', width: 300, height: 120, tileSize: tileSize, index: 78),
      _buildTile(' HOUSING PROPERTY & UTILITIES', width: 300, height: 120, tileSize: tileSize, index: 9),
      _buildTile(' JUSTICE, LAW & RIGHTS', width: 300, height: 120, tileSize: tileSize, index: 10),
      _buildTile(' TRADE, BUSINESS & INDUSTRY', width: 300, height: 120, tileSize: tileSize, index: 11),
      _buildTile(' TRAVEL, TOURISM & LEISURE', width: 300, height: 120, tileSize: tileSize, index: 12),
    ];
  }

  Widget _buildTile(String text,
    {required double width, required double height, required double tileSize, required int index}) {
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
          color: hoveredIndex == index ? const Color.fromARGB(255, 10, 4, 70) : Colors.white,
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
              color: hoveredIndex == index ? Colors.white : const Color.fromARGB(255, 10, 4, 70),
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
}
