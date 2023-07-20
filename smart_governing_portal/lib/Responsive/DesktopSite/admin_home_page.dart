import 'dart:io';

import 'package:flutter/material.dart';
import 'package:smart_governing_portal/Responsive/DesktopSite/home_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:file_picker/file_picker.dart';

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
  var _mobile = '';
  String _personalAddress = '';
  String _gramaniladariDivision = '';
  String _areaCode = '';
  File? _imageFile;

  String _province = '-Choose your Province-';
  String _district = '-Choose your District-';

  final List<String> _provinceList = [
    '-Choose your Province-',
    'WESTERN',
    'CENTRAL',
    'SOUTHERN',
    'SABARAGAMUWA',
    'EASTERN',
    'UVA',
    'NORTH WESTERN',
    'NORTH CENTRAL',
    'NORTHERN'
  ];
  List<String> _districtList = [
    '-Choose your District-',
    'Galle',
    'Matara',
    'Hambanthota',
    'Gampaha',
    'Colombo',
    'Kaluthara' 'Kandy',
    'Matale',
    'Nuwara Eliya',
    'Kegalle',
    'Rathnapura',
    'Ampara',
    'Batticaloa',
    'Trincomalee',
    'Badulla',
    'Monaragala',
    'Kurunegala',
    'Puttalam',
    'Anuradhapura',
    'Polonnaruwa',
    'Jaffna',
    'Kilinochchi',
    'Mullaitivu',
    'Vavuniya',
    'Mannar',
  ];

  //form submission method
  void _submitForm() {
    if (_adminRegistrationformKey.currentState!.validate()) {
      // All fields are valid, proceed with form submission
      // Clear the form after successful submission (if needed)
      _adminRegistrationformKey.currentState!.reset();
    } else {
      // There are invalid fields, show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Form Error'),
          content: const Text('Please fill in all the required fields.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  //choose image function
  Future<void> _getImage() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(type: FileType.image);

    if (result != null && result.files.single.path != null) {
      setState(() {
        _imageFile = File(result.files.single.path!);
      });
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
            padding:
                const EdgeInsets.only(left: 80, right: 80, top: 30, bottom: 30),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color:
                      const Color.fromARGB(255, 243, 236, 236), // Border color
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
                        const SizedBox(
                          height: 10,
                        ),
                        //NIC
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your NIC number';
                              }
                              // Check if the NIC number has either 10 characters with the last character being 'v' or 'V',
                              // or it consists of 12 consecutive numbers.
                              if (!(RegExp(r'^\d{9}[vV]$').hasMatch(value) ||
                                  RegExp(r'^\d{12}$').hasMatch(value))) {
                                return 'Please enter a valid NIC number. It should either have 10 characters with the last character as "v" or "V", or consist of 12 consecutive numbers.';
                              }
                              return null;
                            },
                            decoration: decorations('NIC')),
                        const SizedBox(
                          height: 10,
                        ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        //Mobile no
                        TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Mobile No';
                              }
                              // Check if the mobile number has exactly 10 digits and starts with '07'
                              if (value.length != 10 ||
                                  !value.startsWith('07')) {
                                return 'Please enter a valid mobile number starting with "07" and having 10 digits.';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              _mobile = value!;
                            },
                            decoration: decorations('Mobile No')),
                        const SizedBox(
                          height: 10,
                        ),
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
                        const SizedBox(
                          height: 10,
                        ),
                        //Province
                        DropdownButtonFormField(
                          decoration: decorations('Province'),
                          value: _province,
                          items: _provinceList
                              .map((String province) => DropdownMenuItem(
                                    value: province,
                                    child: Text(province),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == '-Choose your Province-') {
                              return 'Please choose your Province';
                            }
                            return null;
                          },
                          onChanged: (String? newValue) {
                            setState(() {
                              _province = newValue!;

                              // Update the items in the district dropdown based on the selected province
                              if (_province == 'WESTERN') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Gampaha',
                                  'Colombo',
                                  'Kaluthara'
                                ];
                              } else if (_province == 'CENTRAL') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Kandy',
                                  'Matale',
                                  'Nuwara Eliya'
                                ];
                              } else if (_province == 'SOUTHERN') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Galle',
                                  'Matara',
                                  'Hambanthota'
                                ];
                              } else if (_province == 'SABARAGAMUWA') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Kegalle',
                                  'Rathnapura'
                                ];
                              } else if (_province == 'EASTERN') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Ampara',
                                  'Batticaloa',
                                  'Trincomalee'
                                ];
                              } else if (_province == 'UVA') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Badulla',
                                  'Monaragala'
                                ];
                              } else if (_province == 'NORTH WESTERN') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Kurunegala',
                                  'Puttalam'
                                ];
                              } else if (_province == 'NORTH CENTRAL') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Anuradhapura',
                                  'Polonnaruwa'
                                ];
                              } else if (_province == 'NORTHERN') {
                                _districtList = [
                                  '-Choose your District-',
                                  'Jaffna',
                                  'Kilinochchi',
                                  'Mullaitivu',
                                  'Vavuniya',
                                  'Mannar'
                                ];
                              } else {
                                _districtList = [
                                  '-Choose your District-'
                                ]; // Default value when '-Num-' is selected
                              }
                              // Reset the selected district to '-Choose your District-' when changing the province
                              _district = '-Choose your District-';
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        // District Dropdown
                        DropdownButtonFormField(
                          decoration: decorations('District'),
                          value: _district,
                          items: _districtList
                              .map((String district) => DropdownMenuItem(
                                    value: district,
                                    child: Text(district),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == '-Choose your District-') {
                              return 'Please choose your District';
                            }
                            return null;
                          },
                          onChanged: (String? newDistrict) {
                            setState(() {
                              _district = newDistrict!;
                            });
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),

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
                        const SizedBox(
                          height: 10,
                        ),
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
                        const SizedBox(
                          height: 45,
                        ),

                        Row(
                          children: [
                            InkWell(
                              onTap: _getImage,
                              child: Container(
                                width: 100,
                                height: 100,
                                color: Colors.grey,
                                child: _imageFile != null
                                    ? Image.file(_imageFile!, fit: BoxFit.cover)
                                    : Icon(Icons.add_a_photo),
                              ),
                            )
                          ],
                        ),

                        ElevatedButton(
                            onPressed: _submitForm,
                            style: ElevatedButton.styleFrom(
                              maximumSize: Size.fromWidth(w / 3),
                              foregroundColor:
                                  const Color.fromARGB(255, 243, 242, 234),
                              backgroundColor:
                                  const Color.fromARGB(255, 10, 4, 70),
                              fixedSize: const Size(800, 50),
                              textStyle: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                              ),
                              elevation: 5,
                              side: const BorderSide(
                                color: Color.fromARGB(255, 249, 252, 251),
                                width: 4,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            child: const Text(
                              'Submit',
                              style: TextStyle(fontSize: 20),
                            ))
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
