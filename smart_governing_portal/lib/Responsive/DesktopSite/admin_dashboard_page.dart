import 'package:flutter/material.dart';
import 'package:smart_governing_portal/Responsive/DesktopSite/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminDashboardPage extends StatefulWidget {
  const AdminDashboardPage({super.key});
  

  @override
  State<AdminDashboardPage> createState() => _AdminDashboardPageState();
}

class _AdminDashboardPageState extends State<AdminDashboardPage> {
  int hoveredIndex = -1;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          //navbar
          AppBar(
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
            actions: [
              FittedBox(
                child: Row(
                  children: [
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const HomePage(),
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
                    TextButton(
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
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const HomePage(),
                            ),
                          );
                        },
                        child: const Text(
                          'User',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        )),
                    const SizedBox(
                      width: 20,
                    ),

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
              )
            ],
            backgroundColor: const Color.fromARGB(255, 115, 185, 250),
          ),
          
          //lists
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 120, right: 120, top: 20),
              child: Column(
                children: [
                  const FittedBox(
                    child: Text(
                      'Hello, Welcome Back!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 10, 4, 70),
                        fontFamily: 'Inter',
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 20,bottom: 40),
                    child: Text(
                      'The best service for the citizens from us',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontFamily: 'Inter'
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
                        children: _adminDashboardLists(tileSize),
                      );
                    },
                  ),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),


          //footer
          Container(
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
                                  'Constitution',
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
                                  'Local Authorities',
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
          )
        
        ],
      ),
    );
  }


  //functions for admin dashboard lists
  List<Widget> _adminDashboardLists(double tileSize) {
    return [
      _adminDashboardList(' The List of Users that Requesting Smart NIC',
          width: 380,
          height: 220,
          tileSize: tileSize,
          index: 0,
          imagePath: 'lib/Assets/lists.png'),
      _adminDashboardList(' The List of Users that Requesting Smart Driving License',
          width: 380,
          height: 220,
          tileSize: tileSize,
          index: 1,
          imagePath: 'lib/Assets/lists.png'),
      _adminDashboardList(' Previous List of Users for Smart NIC',
          width: 380,
          height: 220,
          tileSize: tileSize,
          index: 2,
          imagePath: 'lib/Assets/lists.png'),
      _adminDashboardList(' Previous List of Users for Smart Driving License',
          width: 380,
          height: 220,
          tileSize: tileSize,
          index: 3,
          imagePath: 'lib/Assets/lists.png'),
    ];
  }


  // ignore: unused_element
  Widget _adminDashboardList(String text,
      {required double width,
      required double height,
      required double tileSize,
      required int index,
      required imagePath}) {
    return SizedBox(
      width: tileSize,
      height: tileSize * (height / width),
      child: InkWell(
        onTap: () {},
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
                const SizedBox(height: 10,),
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




  
