import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart_governing_portal/Responsive/DesktopSite/home_page.dart';
import 'package:url_launcher/url_launcher.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  final _adminRegistrationformKey = GlobalKey<FormState>();
  String _fullName = '';
  String _nic = '';
  String _gramaNiladhariID = '';
  String _mobile = '';
  String _personalAddress = '';
  String _gramaniladariDivision = '';
  String _areaCode = '';
  String selectedProvince = '';
  String selectedDistrict = '';

  final Map<String, List<String>> districtsByProvince = {
    'SOUTHERN PROVINCE': ['Galle', 'Matara', 'Hambanthota'],
    'WESTERN PROVINCE': ['Gampaha', 'Colombo', 'Kaluthara'],
    'CENTRAL PROVINCE': ['Kandy', 'Matale', 'Nuwara Eliya'],
    'SABARAGAMUWA PROVINCE': ['Kegalle', 'Rathnapura'],
    'EASTERN PROVINCE': ['Ampara', 'Batticaloa', 'Trincomalee'],
    'UVA PROVINCE': ['Badulla', 'Monaragala'],
    'NORTH WESTERN  PROVINCE': ['Kurunegala', 'Puttalam'],
    'NORTH CENTRAL PROVINCE': ['Anuradhapura', 'Polonnaruwa'],
    'NORTHERN PROVINCE': [
      'Jaffna',
      'Kilinochchi',
      'Mullaitivu',
      'Vavuniya',
      'Mannar'
    ],
  };

  List<String> getDistrictsByProvince(String province) {
    return districtsByProvince[province]!;
  }

  Future<void> _getImage() async {
    final imagePicker = ImagePicker();
    final image = await imagePicker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      // Handle the image, you can save it or use it as needed.
      // For this example, we will not store the image in this code snippet.
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const SizedBox(
                      height: 15,
                    ),

                    //Quick links in navbar
                    Row(
                      children: [
                        TextButton(
                            onPressed: () {},
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
                      ],
                    ),

                    //login and register buttons
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

          //first section
          SizedBox(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          width: w * 0.5,
                          child: const Align(
                            alignment: Alignment.center,
                            child: FittedBox(
                              child: Text(
                                "WELCOME TO \nADMIN PORTAL \nOF \nLET'S GOV",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Mitr',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 75,
                                  color: Color.fromARGB(255, 10, 4, 70),
                                ),
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
                  FittedBox(
                    child: Column(
                      children: [
                        const Text(
                          'You need to use your Grama Niladhari ID number as the username for register / login.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Text(
                          'Create Your Admin Profile',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Image.asset(
                          'lib/Assets/belowicon.png',
                          width: 32,
                          height: 40,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),

          //form
          Padding(
            padding: const EdgeInsets.only(left: 80,right: 80,top: 30,bottom: 30),
            child: Container(
              decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color.fromARGB(255, 243, 236, 236), // Border color
                        width: 3.0, // Border width
                      ),
                      borderRadius: BorderRadius.circular(15), // Border radius
                    ),
              child: Padding(
                padding: const EdgeInsets.all(50),
                child: Form(
                    key: _adminRegistrationformKey,
                    child: Column(
                      children: <Widget>[
                        //Full Name
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your full Name';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _fullName = value!;
                            },
                            decoration: decorations('Full Name')),
                        const SizedBox(height: 10,),
                        //NIC
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your NIC number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _nic = value!;
                            },
                            decoration: decorations('NIC')),
                        const SizedBox(height: 10,),
                        //grama niladhari ID
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Grama Niladhari ID';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _gramaNiladhariID = value!;
                            },
                            decoration: decorations('Grama Niladhari ID')),
                        const SizedBox(height: 10,),
                        //MObile no
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Mobile No';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _mobile = value!;
                            },
                            decoration: decorations('Mobile No')),
                        const SizedBox(height: 10,),
                        //personal address
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Personal Address';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _personalAddress = value!;
                            },
                            decoration: decorations('Personal Address')),
                        const SizedBox(height: 10,),
                        //Province
                        
                        //district
              
                        //grama niladari division (work)
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Grama Niladari Division (work)';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _gramaniladariDivision = value!;
                            },
                            decoration:
                                decorations('Grama Niladari Division (work)')),
                        const SizedBox(height: 10,),
                        //area code
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Area (work)';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _areaCode = value!;
                            },
                            decoration: decorations('Area (work)')),
                        const SizedBox(height: 10,),
                      ],
                    )),
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
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

//input decoration for the form fields
InputDecoration decorations(String _formfieldName) {
  return InputDecoration(
    labelText: _formfieldName,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2.0),
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
