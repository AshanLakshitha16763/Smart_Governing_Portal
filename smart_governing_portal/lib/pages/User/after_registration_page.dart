import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_governing_portal/controllers/constants.dart';
import 'package:smart_governing_portal/pages/User/SmartDL_applying_form.dart';
import 'package:smart_governing_portal/pages/User/SmartNIC_applyingForm.dart';
import 'package:smart_governing_portal/pages/User/dl_template.dart';
import 'package:smart_governing_portal/pages/User/nic_template.dart';
import 'package:smart_governing_portal/pages/User/user_homePage.dart';
import 'package:url_launcher/url_launcher.dart';

class AfterRegistrationPage extends StatefulWidget {
  const AfterRegistrationPage({super.key});

  @override
  State<AfterRegistrationPage> createState() => _AfterRegistrationPageState();
}

class _AfterRegistrationPageState extends State<AfterRegistrationPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  late double height;
  late double width;
  int hoveredIndex = -1;
  late String userName;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _section2Key = GlobalKey();
  final GlobalKey _section1Key = GlobalKey();
  late String currentUserDocumentId;
  

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  void profile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Log Out?'),
        content: const Text('Make sure all the work is completed.'),
        actions: [
          TextButton(
            onPressed: () {
              signOut();
              Navigator.pop(context);
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const UserHomePage();
              }));
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    User? user = FirebaseAuth.instance.currentUser;
    userName = user?.displayName ?? 'User';
    currentUserDocumentId = user?.uid ?? '';
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 800) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            toolbarHeight: 120,
            leadingWidth: 180,
            leading: SizedBox(
              width: 150,
              child: FittedBox(
                child: Image.asset(
                  'lib/Assets/logo.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            actions: [_appbarActions()],
            backgroundColor: const Color.fromARGB(255, 115, 185, 250),
          ),
          body: _body(),
        );
      } else {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 115, 185, 250),
          ),
          drawer: mobileDrawer(width * 0.6, context),
          body: _body(),
        );
      }
    });
  }

  //appbar actions
  Widget _appbarActions() {
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
              IconButton(
                onPressed: () {
                  profile();
                },
                icon: const Icon(Icons.person_outline_rounded),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          /*Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const LoginDesktop(),
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
                            builder: (BuildContext context) =>
                                const RegistorDesktop(),
                          ),
                        );
                      },
                      style: const ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              Color.fromARGB(255, 10, 4, 70))),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255)),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                  ],
                )*/
        ],
      ),
    );
  }

  Widget _section1({required String id}) {
    return ConstrainedBox(
      key: _section1Key,
      constraints: BoxConstraints(minHeight: height * 0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Column(
              children: [
                Text(
                  'Hello, Welocome Back! $userName',
                  style: const TextStyle(
                    color: Color.fromARGB(255, 10, 4, 70),
                    fontFamily: 'Inter',
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'The Best Service for the Citizens',
                  style: TextStyle(
                    color: Color.fromARGB(255, 10, 4, 70),
                    fontFamily: 'Inter',
                    fontSize: 24,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              SizedBox(
                child: SizedBox(
                  width: width / 2,
                  child: SizedBox(
                    child: Padding(
                      padding:
                          const EdgeInsets.only(left: 20, right: 20, top: 20),
                      child: Column(
                        children: [
                          LayoutBuilder(
                            builder: (context, constraints) {
                              return Wrap(
                                spacing: 300.0,
                                runSpacing: 60.0,
                                children: _OURserviceTiles(300),
                              );
                            },
                          ),
                          const SizedBox(height: 60),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Container(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _section2({required String id}) {
    return ConstrainedBox(
      key: _section2Key,
      constraints: BoxConstraints(minHeight: height * 0.9),
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

  Widget _body() {
    return SingleChildScrollView(
      controller: _scrollController,
      child: Column(
        children: [
          //Our Services & chat bot
          _section1(id: 'Home_section'),
          //GOV Services
          _section2(id: 'services_section'),
          //Footer
          const Footer()
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
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth = 300.0;
    int crossAxisCount = (screenWidth / tileWidth).floor();
    return crossAxisCount;
  }

  //functions for Our service tiles

  List<Widget> _OURserviceTiles(double tileSize) {
    return [
      _OURserviceTileNIC(' Smart National Identity Card Verification System',
          width: 360,
          height: 200,
          tileSize: tileSize,
          index: 0,
          imagePath: 'lib/Assets/ID.png',
          pageName2: const NICApplicationForm(),
          pageName1: const NICTemplate()),
      _OURserviceTileDL(' Smart Driving License Verification System',
          width: 360,
          height: 200,
          tileSize: tileSize,
          index: 1,
          imagePath: 'lib/Assets/DL.png',
          pageName2: const DLApplicationForm(),
          pageName1: const DLTemplate()),
    ];
  }

  // ignore: unused_element
  Widget _OURserviceTileNIC(String text,
      {required double width,
      required double height,
      required double tileSize,
      required int index,
      required pageName1,
      required pageName2,
      required imagePath}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 200),
      child: SizedBox(
        width: tileSize,
        height: tileSize * (height / width) + 60,
        child: InkWell(
          onTap: () async {
            final userUid = FirebaseAuth.instance.currentUser?.uid ?? '';
            final docSnapshot = await FirebaseFirestore.instance
                .collection('NICtest')
                .doc(userUid)
                .get();
            Future.delayed(const Duration(milliseconds: 20));
            if (docSnapshot.exists) {
              // Navigate to the NIC template page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pageName1),
              );
            } else {
              // Navigate to the NIC application form page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pageName2),
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
      ),
    );
  }

  Widget _OURserviceTileDL(String text,
      {required double width,
      required double height,
      required double tileSize,
      required int index,
      required pageName1,
      required pageName2,
      required imagePath}) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: 200),
      child: SizedBox(
        width: tileSize,
        height: tileSize * (height / width) + 60,
        child: InkWell(
          onTap: () async {
            final userUid = FirebaseAuth.instance.currentUser?.uid ?? '';
            final docSnapshot = await FirebaseFirestore.instance
                .collection('DLtest')
                .doc(userUid)
                .get();
            Future.delayed(const Duration(milliseconds: 20));
            if (docSnapshot.exists) {
              // Navigate to the NIC template page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pageName1),
              );
            } else {
              // Navigate to the NIC application form page
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => pageName2),
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
      ),
    );
  }

  //Check if thre user has formdata already
  /*void navigateBasedOnUserData() async {
  final userUid = FirebaseAuth.instance.currentUser?.uid ?? '';
  final docSnapshot = await FirebaseFirestore.instance.collection('YourCollectionName').doc(userUid).get();

  if (docSnapshot.exists) {
    // Navigate to the NIC template page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NicTemplatePage()),
    );
  } else {
    // Navigate to the NIC application form page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NicApplicationFormPage()),
    );
  }
  }*/
  /*Future<bool> checkFormData() async {
    try {
      // Get the current user
      User? currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null) {
        // Check if a document exists with the user's UID as the document ID
        DocumentSnapshot<Map<String, dynamic>> snapshot =
            await FirebaseFirestore.instance.collection('NICPT').doc(currentUser.uid).get();

        // Return true if the document exists, false otherwise
        return snapshot.exists;
      } else {
        return false;
      }
    } catch (e) {
      print('Error checking form data: $e');
      return false;
    }
  }*/
}

//url launcher
void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
