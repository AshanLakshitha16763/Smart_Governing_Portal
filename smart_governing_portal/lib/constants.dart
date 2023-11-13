import 'package:flutter/material.dart';


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

//This is the Footer
var footer = Container(
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
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Discover',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Country Overview',
                        style: TextStyle(fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Government',
                        style: TextStyle(fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Costitution',
                        style: TextStyle(fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Legal System',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Quick Links',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Ministry Websites',
                        style: TextStyle(fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Departments Websites',
                        style: TextStyle(fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Statutory Boards',
                        style: TextStyle(fontSize: 15),
                      )),
                  TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Authorization Websites',
                        style: TextStyle(fontSize: 15),
                      )),
                ],
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    'Easy Navigate To',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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

//
var mobileDrawer = Drawer(
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
          color: Colors.brown,
        ),
        title: const Text(
          "Home",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.search,
          color: Colors.brown,
        ),
        title: const Text(
          "Services",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(
          Icons.groups,
          color: Colors.brown,
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
          Icons.admin_panel_settings,
          color: Colors.brown,
        ),
        title: const Text(
          "Admin",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        onTap: () {},
      ),
    ],
  ),
);

//homepage sections

var section01 = SizedBox(
  child: Row(
    children: [
      SizedBox(
        //width: w * 0.5,
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
            //width: w * 0.5,
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
