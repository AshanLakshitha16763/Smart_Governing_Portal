// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:smart_governing_portal/controllers/constants.dart';
import 'package:smart_governing_portal/pages/Admin/adminLoginPage.dart';
import 'package:smart_governing_portal/pages/User/SmartDL_applying_form.dart';
import 'package:smart_governing_portal/pages/User/SmartNIC_applyingForm.dart';
import 'package:smart_governing_portal/pages/User/user_loginPage.dart';
import 'package:smart_governing_portal/pages/User/user_signupPage.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserHomePage extends StatefulWidget {
  const UserHomePage({super.key});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  late double width;
  late double height;
  int hoveredIndex = -1;
  bool _isLoggedIn = false;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _section2Key = GlobalKey();
  final GlobalKey _section1Key = GlobalKey();

  @override
  void initState() {
    super.initState();
    _checkLogingStatus();
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 120,
            leadingWidth: 180,
            leading: SizedBox(
              width: 150,
              child: Image.asset(
                'lib/Assets/logo.png',
                fit: BoxFit.cover,
              ),
            ),
            actions: [_appBar()],
            backgroundColor: const Color.fromARGB(255, 115, 185, 250),
          ),
          body: _body(),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 115, 185, 250),
          ),
          drawer: mobileDrawer(width * 0.6,context),
          body: _body(),
        );
      }
    });
  }

  //body of the web page
  Widget _body() {
    return SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            //first section on the web
            _section1(id: 'home_section'),

            //second section on the web(GOV Services)
            _section2(id: 'services_section'),

            //third section of the web(Our Services)
            _section3(),

            //Footer
            _footer(),
          ],
        ));
  }

  // functions for the government services
  List<Widget> _GOVserviceTiles(double tileSize) {
    return [
      _GOVserviceTile(' AGRICULTURE, LIVESTOCK & FISHERIES',
          width: 298,
          height: 120,
          tileSize: tileSize,
          index: 0,
          url: 'https://www.gov.lk/services?service=agrlvstk&'),
      _GOVserviceTile(' BANKING, TAX & INSURANCE',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 1,
          url: 'https://www.gov.lk/services?service=bti&'),
      _GOVserviceTile(' CITIZEN’S REGISTRATION',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 2,
          url: 'https://www.gov.lk/services?service=cizreg&'),
      _GOVserviceTile(' COMMUNICATION & MEDIA',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 3,
          url: 'https://www.gov.lk/services?service=comnm&'),
      _GOVserviceTile(' EDUCATION & TRAINING',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 4,
          url: 'https://www.gov.lk/services?service=ednt&'),
      _GOVserviceTile(' EMPLOYMENT INFORMATION',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 5,
          url: 'https://www.gov.lk/services?service=empinfo&'),
      _GOVserviceTile(' ENVIRONMENT',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 6,
          url: 'https://www.gov.lk/services?service=env&'),
      _GOVserviceTile(' HEALTH, WELL BEING & SOCIAL SERVICE',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 78,
          url: 'https://www.gov.lk/services?service=hwbss&'),
      _GOVserviceTile(' HOUSING PROPERTY & UTILITIES',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 9,
          url: 'https://www.gov.lk/services?service=hpu&'),
      _GOVserviceTile(' JUSTICE, LAW & RIGHTS',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 10,
          url: 'https://www.gov.lk/services?service=jlnr&'),
      _GOVserviceTile(' TRADE, BUSINESS & INDUSTRY',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 11,
          url: 'https://www.gov.lk/services?service=tbni&'),
      _GOVserviceTile(' TRAVEL, TOURISM & LEISURE',
          width: 300,
          height: 120,
          tileSize: tileSize,
          index: 12,
          url: 'https://www.gov.lk/services?service=ttnl&'),
    ];
  }

  Widget _GOVserviceTile(String text,
      {required double width,
      required double height,
      required double tileSize,
      required String url,
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
        child: InkWell(
          onTap: () {
            _launchURL(url);
          },
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
      ),
    );
  }

  int _calculateCrossAxisCount(BuildContext context) {
    double tileWidth = 300.0;
    int crossAxisCount = (width / tileWidth).floor();
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
          imagePath: 'lib/Assets/ID.png',
          pageName: const NICApplicationForm()),
      _OURserviceTile(' Smart Driving License Verification System',
          width: 360,
          height: 180,
          tileSize: tileSize,
          index: 1,
          imagePath: 'lib/Assets/DL.png',
          pageName: const DLApplicationForm()),
      _OURserviceTile(' Inquiry Tracking System',
          width: 360,
          height: 180,
          tileSize: tileSize,
          index: 2,
          imagePath: 'lib/Assets/Inquiry.png',
          pageName: null),
      _OURserviceTile(' Smart Passport Verification System',
          width: 360,
          height: 180,
          tileSize: tileSize,
          index: 3,
          imagePath: 'lib/Assets/Passport.png',
          pageName: null),
    ];
  }

  // ignore: unused_element
  Widget _OURserviceTile(String text,
      {required double width,
      required double height,
      required double tileSize,
      required int index,
      required pageName,
      required imagePath}) {
    return SizedBox(
      width: tileSize,
      height: tileSize * (height / width),
      child: InkWell(
        onTap: () {
          if (_isLoggedIn) {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => pageName,
              ),
            );
          } else {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const UserLoginPage(),
              ),
            );
          }
        },
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
      ),
    );
  }

  Future<void> _checkLogingStatus() async {
    final prefs = await SharedPreferences.getInstance();
    final isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    setState(() {
      _isLoggedIn = isLoggedIn;
    });
  }

  int _calculateCrossAxisCountOURservices(BuildContext context) {
    double tileWidth = 360.0;
    int crossAxisCount = (width / tileWidth).floor();
    return crossAxisCount;
  }

  //appbar function
  Widget _appBar() {
    return FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 15,
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {Future.delayed(Duration.zero, () {
                  Scrollable.ensureVisible(
                    _section1Key.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                });
                  },
                  child: const Text(
                    'Home',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
                  Scrollable.ensureVisible(
                    _section2Key.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                });
                  },
                  child: const Text(
                    'Services',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'About Us',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const AdminLoginPage(),
                      ),
                    );
                  },
                  child: const Text(
                    'Admin',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  )),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const UserLoginPage(),
                    ),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 255, 255, 255))),
                child: const Text(
                  'Login',
                  style: TextStyle(color: Color.fromARGB(255, 10, 4, 70)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const UserSignUpPage(),
                    ),
                  );
                },
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(
                        Color.fromARGB(255, 10, 4, 70))),
                child: const Text(
                  'Register',
                  style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ),
              const SizedBox(
                width: 15,
              ),
            ],
          )
        ],
      ),
    );
  }

  // Calculate the offset of _section1
  double _section1Offset() {
    final RenderBox renderBoxRed =
        _section1Key.currentContext!.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    return positionRed.dy - kToolbarHeight; // Adjusted for app bar height
  }

  // Calculate the offset of _section2
  double _section2Offset() {
    final RenderBox renderBoxRed =
        _section2Key.currentContext!.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    return positionRed.dy - kToolbarHeight; // Adjusted for app bar height
  }

  //section 1 on the web
  Widget _section1({required String id}) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return ConstrainedBox(
          key: _section1Key,
          constraints: BoxConstraints(
            minHeight: height * 0.88,
          ),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.5,
                child: const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: FittedBox(
                      child: Text(
                        "WELCOME TO \nLET'S GOV",
                        style: TextStyle(
                          fontFamily: 'Mitr',
                          fontWeight: FontWeight.w800,
                          fontSize: 80,
                          color: Color.fromARGB(255, 10, 4, 70),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    width: width * 0.5,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          right: 40, left: 40, top: 40, bottom: 20),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                            color: const Color.fromARGB(255, 187, 191, 190),
                            width: 1,
                          ),
                          boxShadow: const [
                            BoxShadow(
                              color: Color.fromARGB(
                                255,
                                187,
                                191,
                                190,
                              ),
                              spreadRadius: 1,
                              blurRadius: 5,
                              offset: Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Image.asset(
                          'lib/Assets/homepagepic.png',
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 187, 191, 190),
                        width: 1,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(
                            255,
                            187,
                            191,
                            190,
                          ),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Text(
                      'Chatbot',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ), // chatbot here
            ],
          ),
        );
      } else {
        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: height,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width * 0.8,
                child: const Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 100),
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "WELCOME TO \nLET'S GOV",
                        style: TextStyle(
                          fontFamily: 'Mitr',
                          fontWeight: FontWeight.w800,
                          fontSize: 80,
                          color: Color.fromARGB(255, 10, 4, 70),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.8,
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 40, left: 40, top: 40, bottom: 20),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: const Color.fromARGB(255, 187, 191, 190),
                        width: 1,
                      ),
                      boxShadow: const [
                        BoxShadow(
                          color: Color.fromARGB(
                            255,
                            187,
                            191,
                            190,
                          ),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      'lib/Assets/homepagepic.png',
                      fit: BoxFit.scaleDown,
                    ),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: const Color.fromARGB(255, 187, 191, 190),
                    width: 1,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(
                        255,
                        187,
                        191,
                        190,
                      ),
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: const Text(
                  'Chatbot',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Inter',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ), // chatbot here
            ],
          ),
        );
      }
    });
  }

  //section 2 on the web
  Widget _section2({required String id}) {
    return ConstrainedBox(
      key: _section2Key,
      constraints: BoxConstraints(
        minHeight: height * 0.88,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 100),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Image.asset('lib/Assets/serve.png'),
                  const SizedBox(width: 20),
                  const Text(
                    'Explore What We Serve You',
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 4, 70),
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(40.0),
              child: Text(
                'Explore What We Serve YouLorem ipsum dolor sit amet, in vim nihil maiorum, vim et postea philosophia mediocritatem. Eu sit postea adolescens intellegam. Pri modus pericula ut, an vidisse aperiam nec, sed ea. animal inciderint. Etiam ceteros repudiandae ex usu, nec diam decore cu. Sea an libris.Lorem ipsum dolor sit amet',
                textAlign: TextAlign.justify,
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
    );
  }

  //section 2 on the web
  Widget _section3() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height * 0.88,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Row(
                children: [
                  Image.asset('lib/Assets/people.png'),
                  const SizedBox(width: 20),
                  const Text(
                    'Explore Government Services',
                    style: TextStyle(
                      color: Color.fromARGB(255, 10, 4, 70),
                      fontFamily: 'Inter',
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 60),
            LayoutBuilder(
              builder: (context, constraints) {
                final tileSize =
                    constraints.maxWidth / _calculateCrossAxisCount(context);

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
    );
  }

  Widget _footer(){
    return Container(
      width: width,
      color: const Color.fromARGB(255, 248, 247, 247),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        'lib/Assets/logo.png',
                        width: 150,
                      ),
                      const Text(
                        'A centralized platform for citizens',
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Lorem ipsum dolor sit amet,\nin vim orum, vim et postea \nphilosophia mediocritatem. \nEu sit postea adolescens intellegam.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ],
                  ),
                  //Discover
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Discover',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.gov.lk/sri-lanka/country-overview?');
                          },
                          child: const Text(
                            'Country Overview',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.gov.lk/sri-lanka/government?');
                          },
                          child: const Text(
                            'Government',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.gov.lk/sri-lanka/constitution?');
                          },
                          child: const Text(
                            'Costitution',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            _launchURL(
                                'http://hrlibrary.umn.edu/research/srilanka/legalsystem.html#:~:text=Hierarchy%20of%20courts.,interpretation%20of%20the%20case%20law.');
                          },
                          child: const Text(
                            'Legal System',
                            style: TextStyle(fontSize: 15),
                          )),
                    ],
                  ),

                  //Quick Links
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Quick Links',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.gov.lk/webdirectory/ministry?');
                          },
                          child: const Text(
                            'Ministry Websites',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.gov.lk/webdirectory/departments?');
                          },
                          child: const Text(
                            'Departments Websites',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            _launchURL(
                                'https://www.gov.lk/webdirectory/statutoryboards?');
                          },
                          child: const Text(
                            'Statutory Boards',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            /* _launchURL('');*/
                          },
                          child: const Text(
                            'Authorization Websites',
                            style: TextStyle(fontSize: 15),
                          )),
                    ],
                  ),

                  //Easy Navigate To
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      const Text(
                        'Easy Navigate To',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Home',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Services',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'About Us',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Register',
                            style: TextStyle(fontSize: 15),
                          )),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Copyright 2023, Let’s Gov, government service. All right reserved.',
                style: TextStyle(
                  color: Color.fromARGB(255, 100, 100, 100),
                  fontSize: 15,
                  fontFamily: 'Inter',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}

//url launcher
void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
