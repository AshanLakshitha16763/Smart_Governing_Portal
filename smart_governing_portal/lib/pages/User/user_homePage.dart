// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_governing_portal/controllers/constants.dart';
import 'package:smart_governing_portal/pages/Admin/adminLoginPage.dart';
import 'package:smart_governing_portal/pages/User/SmartDL_applying_form.dart';
import 'package:smart_governing_portal/pages/User/SmartNIC_applyingForm.dart';
import 'package:smart_governing_portal/pages/User/aboutUsPage.dart';
import 'package:smart_governing_portal/pages/User/user_loginPage.dart';
import 'package:smart_governing_portal/pages/User/user_signupPage.dart';
import 'package:smart_governing_portal/pages/chat/chat_hopmepage.dart';
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
  int hoveredIndexOur = -1;
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
          floatingActionButton: IconButton(
            onPressed: () {
              chatbot();
            },
            icon: const Icon(
              Icons.chat,
              size: 50,
              color: Color.fromARGB(255, 10, 4, 70),
            ),
          ),
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
          floatingActionButton: IconButton(
            onPressed: () {
              chatbot();
            },
            icon: const Icon(
              Icons.chat,
              size: 50,
              color: Color.fromARGB(255, 10, 4, 70),
            ),
          ),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 115, 185, 250),
          ),
          drawer: mobileDrawer(width * 0.6, context),
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
            const Footer(),
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
              boxShadow: const [
                BoxShadow(
                  color: Color.fromARGB(255, 187, 191, 190),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 5),
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
            color: hoveredIndexOur == index
                ? const Color.fromARGB(255, 10, 4, 70)
                : Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: const Color.fromARGB(255, 187, 191, 190),
              width: 1,
            ),
            boxShadow: const [
              BoxShadow(
                color: Color.fromARGB(255, 187, 191, 190),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 5),
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
                  onPressed: () {
                    Future.delayed(Duration.zero, () {
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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<void>(
                      builder: (BuildContext context) => const AboutUsPage(),
                    ),
                  );
                },
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
    return Container(
      /*decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
              "lib/Assets/loop/2.jpg"), // Change the path accordingly
          fit: BoxFit.fitHeight,
        ),
      ),*/
      child: LayoutBuilder(builder: (context, constraints) {
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
                            Center(
                              child: Text(
                                "TO",
                                style: TextStyle(
                                  fontFamily: 'Mitr',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 80,
                                  color: Color.fromARGB(255, 10, 4, 70),
                                ),
                              ),
                            ),
                            Text(
                              "LET'S GOV",
                              style: TextStyle(
                                fontFamily: 'Mitr',
                                fontWeight: FontWeight.w800,
                                fontSize: 80,
                                color: Color.fromARGB(255, 1, 59, 101),
                              ),
                            ),
                          ],
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
                          child: Lottie.asset(
                              "lib/Assets/animations/homepage_animation.json") /*AutoScrollImages()*/,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
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
      }),
    );
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
                'Let’s gov - is a centralized hub redefining citizen-government interaction. This platform simplifies access to government services, facilitates easy ID verification, and delivers personalized recommendations, creating a more efficient and user-friendly experience for citizens. Embracing technology, it transforms governance into a connected, responsive, and streamlined process.',
                textAlign: TextAlign.start,
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

  //section 3 on the web
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

  Future chatbot() {
    return showDialog(
        context: context,
        builder: (context) {
          return SizedBox(
            child: AlertDialog(
              title: const Text('Smart Bot'),
              content: SizedBox(
                  width: width * 0.5,
                  height: height * 0.7,
                  child: const ChatHomePage()),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Close'))
              ],
            ),
          );
        });
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

//Animation looping
class AutoScrollImages extends StatefulWidget {
  const AutoScrollImages({super.key});

  @override
  _AutoScrollImagesState createState() => _AutoScrollImagesState();
}

class _AutoScrollImagesState extends State<AutoScrollImages> {
  final List<String> imageUrls = [
    "1.jpg",
    "3.jpg",
    "4.jpg",
    "1.jpg",
  ];

  final PageController _controller = PageController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(const Duration(seconds: 4), (Timer timer) {
      if (_controller.page == imageUrls.length - 1) {
        _controller.animateToPage(0,
            duration: const Duration(milliseconds: 2000),
            curve: Curves.bounceOut);
      } else {
        _controller.nextPage(
            duration: const Duration(milliseconds: 2000), curve: Curves.ease);
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 450,
          width: 590,
          child: PageView.builder(
            controller: _controller,
            itemCount: imageUrls.length,
            itemBuilder: (BuildContext context, int index) {
              return Image.asset(
                "lib/Assets/loop/${imageUrls[index]}",
                fit: BoxFit.fill,
              );
            },
          ),
        ),
      ],
    );
  }
}
