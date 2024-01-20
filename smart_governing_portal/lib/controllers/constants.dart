import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:smart_governing_portal/pages/Admin/adminLoginPage.dart';
import 'package:smart_governing_portal/pages/User/user_homePage.dart';
import 'package:url_launcher/url_launcher.dart';

/*This navbar1 contains the login and register 
button for desktop and tablet versions*/

var navbar = AppBar(
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
  actions: [
    FittedBox(
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
                    /*
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage(),
                      ),
                    );
                  */
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
                  onPressed: () {},
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
                  onPressed: () {},
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
            height: 20,
          ),
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
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
                onPressed: () {},
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
    ),
  ],
  backgroundColor: const Color.fromARGB(255, 115, 185, 250),
);

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//This is the Footer
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const UserHomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Home',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const UserHomePage(),
                              ),
                            );
                          },
                          child: const Text(
                            'Services',
                            style: TextStyle(fontSize: 15),
                          )),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute<void>(
                                builder: (BuildContext context) =>
                                    const UserHomePage(),
                              ),
                            );
                          },
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


//
Widget mobileDrawer(double width, context) {
  return Drawer(
    width: width,
    child: ListView(
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 115, 185, 250),
            image: DecorationImage(
              image: AssetImage(
                'lib/Assets/logo.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 10.0),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(
            Icons.home,
            color: Colors.blue,
          ),
          title: const Text(
            "Home",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.pop(context as BuildContext);
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const UserHomePage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.search,
            color: Colors.blue,
          ),
          title: const Text(
            "Services",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const UserHomePage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.groups,
            color: Colors.blue,
          ),
          title: const Text(
            "About us",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(
            Icons.supervised_user_circle_outlined,
            color: Colors.blue,
          ),
          title: const Text(
            "User",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const UserHomePage(),
              ),
            );
          },
        ),
        ListTile(
          leading: const Icon(
            Icons.admin_panel_settings,
            color: Colors.blue,
          ),
          title: const Text(
            "Admin",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          onTap: () {
            Navigator.pop(context as BuildContext);
            Navigator.push(
              context as BuildContext,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AdminLoginPage(),
              ),
            );
          },
        ),
      ],
    ),
  );
}
