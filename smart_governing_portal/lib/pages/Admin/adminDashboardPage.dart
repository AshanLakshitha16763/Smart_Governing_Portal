// ignore_for_file: deprecated_member_use

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_governing_portal/controllers/constants.dart';
import 'package:smart_governing_portal/pages/Admin/requestingNIC.dart';
import 'package:smart_governing_portal/pages/User/user_homePage.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  late String userName;
  late double height;
  late double width;
  int hoveredIndex = -1;

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    userName = user?.displayName ?? 'User';
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 120,
        centerTitle: true,
        title: const Text(
          'Government Admins Only',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold),
        ),
        leadingWidth: 180,
        leading: SizedBox(
          width: 150,
          child: Image.asset(
            'lib/Assets/logo.png',
            fit: BoxFit.cover,
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
        centerTitle: true,
        title: const Text(
          'Government Admins Only',
          style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontFamily: 'poppins',
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 115, 185, 250),
      ),
      drawer: mobileDrawer(width*0.6, context),
      body: _body(),
    );
      }
    });
  }

  Widget _appbarActions() {
    return FittedBox(
      child: Row(
        children: [
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const UserHomePage(),
                  ),
                );
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
          /*TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) =>
                        const AdminDashboardPage(),
                  ),
                );
              },
              child: const Text(
                'Dashboard',
                style: TextStyle(
                  color: Colors.black,
                ),
              )),
          const SizedBox(
            width: 20,
          ),*/

          //User profile image
          Padding(
            padding: const EdgeInsets.only(
              right: 20,
              top: 5,
            ),
            child: IconButton(
                onPressed: () {},
                icon: Image.asset(
                  'lib/Assets/person.png',
                  width: 40,
                  height: 40,
                )),
          )
        ],
      ),
    );
  }

  Widget _userLists() {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: Column(
          children: [
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                'Hello, Welcome Back! $userName',
                style: const TextStyle(
                  color: Color.fromARGB(255, 10, 4, 70),
                  fontFamily: 'Inter',
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20, bottom: 40),
              child: Text(
                'The best service for the citizens from us',
                textAlign: TextAlign.justify,
                style: TextStyle(
                    color: Colors.black, fontSize: 24, fontFamily: 'Inter'),
              ),
            ),
            LayoutBuilder(
              builder: (context, constraints) {
                final tileSize = constraints.maxWidth /
                    _calculateCrossAxisCountOURservices(context);

                return Wrap(
                  spacing: 300.0,
                  runSpacing: 60.0,
                  children: _adminDashboardLists(tileSize),
                );
              },
            ),
            const SizedBox(height: 60),
          ],
        ),
      ),
    );
  }

  Widget _body(){
    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height*0.88),
      child: ListView(
          children: [
            //lists
            _userLists(),
            //footer
            const Footer()
          ],
        ),
    );
  }

  //functions for admin dashboard lists
  List<Widget> _adminDashboardLists(double tileSize) {
    return [
      _adminDashboardList(' The List of Users that Requesting Smart NIC',
          width: 380,
          height: 200,
          tileSize: tileSize,
          index: 0,
          imagePath: 'lib/Assets/lists.png',
          pageName: RequestingNIC()),
      _adminDashboardList(
          ' The List of Users that Requesting Smart Driving License',
          width: 380,
          height: 200,
          tileSize: tileSize,
          index: 1,
          imagePath: 'lib/Assets/lists.png',
          pageName: null),
      _adminDashboardList(' Previous List of Users for Smart NIC',
          width: 380,
          height: 200,
          tileSize: tileSize,
          index: 2,
          imagePath: 'lib/Assets/lists.png',
          pageName: null),
      _adminDashboardList(' Previous List of Users for Smart Driving License',
          width: 380,
          height: 200,
          tileSize: tileSize,
          index: 3,
          imagePath: 'lib/Assets/lists.png',
          pageName: null),
    ];
  }

  // ignore: unused_element
  Widget _adminDashboardList(String text,
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
          Navigator.push(
            context,
            MaterialPageRoute<void>(
              builder: (BuildContext context) => pageName,
            ),
          );
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
                  width: 35,
                  height: 35,
                ),
                const SizedBox(
                  height: 10,
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

  int _calculateCrossAxisCountOURservices(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double tileWidth = 380.0;
    int crossAxisCount = (screenWidth / tileWidth).floor();
    return crossAxisCount;
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
