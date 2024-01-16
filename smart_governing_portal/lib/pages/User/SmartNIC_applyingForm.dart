// ignore_for_file: deprecated_member_use, file_names, non_constant_identifier_names

/*import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';*/
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_governing_portal/controllers/constants.dart';

import 'package:smart_governing_portal/pages/Admin/adminFormPage.dart';
import 'package:smart_governing_portal/pages/User/dl_template.dart';
import 'package:smart_governing_portal/pages/User/nic_template.dart';
import 'package:smart_governing_portal/pages/User/user_homePage.dart';
import 'package:url_launcher/url_launcher.dart';

class NICApplicationForm extends StatefulWidget {
  const NICApplicationForm({super.key});

  @override
  State<NICApplicationForm> createState() => _NICApplicationFormState();
}

class _NICApplicationFormState extends State<NICApplicationForm> {
  late double width;
  late double height;
  final db = FirebaseFirestore.instance;
  final NICapplicationformKey = GlobalKey<FormState>();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController otherNamesController = TextEditingController();
  TextEditingController nicController = TextEditingController();
  TextEditingController birthPlaceController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController professionController = TextEditingController();
  TextEditingController areaCodeController = TextEditingController();
  TextEditingController docNoController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController issuedDateController = TextEditingController();
  TextEditingController provinceController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _NICformKey = GlobalKey();
  TextEditingController expiryDateController = TextEditingController();
  TextEditingController bloodGroupController = TextEditingController();
  //File? _pickedImage;
  //Uint8List webImage = Uint8List(8);

  // Function to show the date picker for Date of Birth
  Future<void> selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // You can set the initial date here.
      firstDate: DateTime(1900), // Set the minimum date for the picker.
      lastDate: DateTime.now(), // Set the maximum date for the picker.
    );

    if (picked != null && picked != DateTime.now()) {
      final String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      setState(() {
        dobController.text = formattedDate;
      });
    }
  }

  // Function to show the date picker for Issued Date
  Future<void> selectIssuedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // You can set the initial date here.
      firstDate: DateTime(2000), // Set the minimum date for the picker.
      lastDate: DateTime.now(), // Set the maximum date for the picker.
    );

    if (picked != null && picked != DateTime.now()) {
      final String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      setState(() {
        issuedDateController.text = formattedDate;
      });
    }
  }

  /*Future<void> selectExpiryDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // You can set the initial date here.
      firstDate: DateTime(2000), // Set the minimum date for the picker.
      lastDate: DateTime(2030), // Set the maximum date for the picker.
    );

    if (picked != null && picked != DateTime.now()) {
      final String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
      setState(() {
        expiryDateController.text = formattedDate;
      });
    }
  }*/

  String _province = '-Choose your Province-';
  String _district = '-Choose your District-';
  String _gender = '-Choose your Gender-';
  String _bloodGroup = '-Choose your Blood Group-';

  final List<String> _genderList = ['-Choose your Gender-', 'Male', 'Female'];

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
    'Kaluthara',
    'Kandy',
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
  void _submitForm() async {
    if (NICapplicationformKey.currentState!.validate()) {
      //get the current user's UID
      User? currentUser = FirebaseAuth.instance.currentUser;

      final user = <String, dynamic>{
        "Full Name": fullNameController.text,
        "Other Names": otherNamesController.text,
        "NIC No": nicController.text,
        "Date of Birth": dobController.text,
        "Birth Place": birthPlaceController.text,
        "Gender": genderController.text,
        "Profession": professionController.text,
        "Address": addressController.text,
        "Province": provinceController.text,
        "District": districtController.text,
        "Area Code": areaCodeController.text,
        "Issued Date": issuedDateController.text,
        "Doc No": docNoController.text,
        "Time": DateTime.now()
      };

      // Add a new document with user's UID
      await db.collection("NICtest").doc(currentUser!.uid).set(user);

      // All fields are valid, proceed with form submission
      // Clear the form after successful submission (if needed)
      NICapplicationformKey.currentState!.reset();

      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (BuildContext context) => const NICTemplate(),
        ),
      );
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

/*
  //choose image function
  Future<void> _pickImage() async {
    if (!kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var selected = File(image.path);
        setState(() {
          _pickedImage = selected;
        });
      } else {
        const SnackBar(content: Text('An image hasn\'t been picked'));
      }
    } else if (kIsWeb) {
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        var f = await image.readAsBytes();
        setState(() {
          webImage = f;
          _pickedImage = File('a');
        });
      } else {
        const SnackBar(content: Text('An image hasn\'t been picked'));
      }
    } else {
      const SnackBar(content: Text('Something went wrong'));
    }
  }
*/
  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: ListView(
        children: [
          //navbar
          _appbar(),
          //instructions
          _instructions(),
          //Form
          _form(id: 'NIC Application Form'),
          //footer
          const Footer()
        ],
      ),
    );
  }

  //appbar
  Widget _appbar() {
    return AppBar(
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
                        Navigator.push(
                          context as BuildContext,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const UserHomePage(),
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
                      onPressed: () {
                        Navigator.push(
                          context as BuildContext,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const AdminHomePage(),
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
      backgroundColor: const Color.fromARGB(255, 115, 185, 250),
    );
  }

  //instructions
  Widget _instructions() {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: height * 0.8,
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: width * 0.8,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 248, 247, 247),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: const Color.fromARGB(255, 187, 191, 190),
                  width: 1,
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      ' Please read the following before using the service. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Welcome to the online National Identity Card verification system.Lorem ipsum dolor sit amet, in vim nihil maiorum, vim et postea philosophia mediocritatem. Eu sit postea adolescens intellegam. Pri modus pericula ut, an vidisse aperiam nec, sed ea. animal inciderint. Etiam ceteros repudiandae ex usu, nec diam decore cu. Sea an libris.Loremipsum dolor sit amet, in vim nihil maiorum, vim et postea philosophia mediocritatem. Eu sit postea adolescens intellegam. Pri modus pericula ut, an vidisse aperiam nec, sed ea. ',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              ' Copyright 2023 ',
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const Text(
              ' To apply Smart  National Identity Card, please fill out this forum and submit ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            GestureDetector(
              onTap: () {
                Future.delayed(Duration.zero, () {
                  Scrollable.ensureVisible(
                    _NICformKey.currentContext!,
                    duration: const Duration(seconds: 1),
                    curve: Curves.easeInOut,
                  );
                });
              },
              child: Image.asset(
                'lib/Assets/belowicon.png',
                width: 32,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }

  //form
  Widget _form({required String id}) {
    return Padding(
      key: _NICformKey,
      padding: const EdgeInsets.only(left: 80, right: 80, top: 30, bottom: 30),
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
              key: NICapplicationformKey,
              child: Column(
                children: <Widget>[
                  const Text(
                    'Apply for Smart NIC',
                    style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  //Full Name
                  TextFormField(
                      controller: fullNameController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your full Name';
                        }
                        return null;
                      },
                      decoration: decorations('Full Name')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Other Names
                  TextFormField(
                      controller: otherNamesController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your other Names if have any';
                        }
                        return null;
                      },
                      decoration: decorations('Other Names')),
                  const SizedBox(
                    height: 10,
                  ),
                  //NIC
                  TextFormField(
                      controller: nicController,
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
                      decoration: decorations('NIC No')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Date of Birth
                  TextFormField(
                      controller: dobController,
                      onTap: () => selectDateOfBirth(context),
                      readOnly: true,
                      decoration: decorations('Date of Birth')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Birth Place
                  TextFormField(
                      controller: birthPlaceController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Birth Place';
                        }
                        return null;
                      },
                      decoration: decorations('Birth Place')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Gender
                  DropdownButtonFormField(
                    decoration: decorations('Gender'),
                    value: _gender,
                    items: _genderList
                        .map((String gender) => DropdownMenuItem(
                            value: gender, child: Text(gender)))
                        .toList(),
                    onChanged: (String? newGender) {
                      setState(() {
                        genderController.text = newGender!;
                      });
                    },
                    validator: (value) {
                      if (value == '-Choose your Gender-') {
                        return 'Please choose your Gender';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //Proffesion
                  TextFormField(
                      controller: professionController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Proffession';
                        }
                        return null;
                      },
                      decoration: decorations('Profesion')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Address
                  TextFormField(
                      controller: addressController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Personal Address';
                        }
                        return null;
                      },
                      decoration: decorations('Address')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Province Dropdown
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
                        provinceController.text = newValue!;

                        // Update the items in the district dropdown based on the selected province
                        if (provinceController.text == 'WESTERN') {
                          _districtList = [
                            '-Choose your District-',
                            'Gampaha',
                            'Colombo',
                            'Kaluthara'
                          ];
                        } else if (provinceController.text == 'CENTRAL') {
                          _districtList = [
                            '-Choose your District-',
                            'Kandy',
                            'Matale',
                            'Nuwara Eliya'
                          ];
                        } else if (provinceController.text == 'SOUTHERN') {
                          _districtList = [
                            '-Choose your District-',
                            'Galle',
                            'Matara',
                            'Hambanthota'
                          ];
                        } else if (provinceController.text == 'SABARAGAMUWA') {
                          _districtList = [
                            '-Choose your District-',
                            'Kegalle',
                            'Rathnapura'
                          ];
                        } else if (provinceController.text == 'EASTERN') {
                          _districtList = [
                            '-Choose your District-',
                            'Ampara',
                            'Batticaloa',
                            'Trincomalee'
                          ];
                        } else if (provinceController.text == 'UVA') {
                          _districtList = [
                            '-Choose your District-',
                            'Badulla',
                            'Monaragala'
                          ];
                        } else if (provinceController.text == 'NORTH WESTERN') {
                          _districtList = [
                            '-Choose your District-',
                            'Kurunegala',
                            'Puttalam'
                          ];
                        } else if (provinceController.text == 'NORTH CENTRAL') {
                          _districtList = [
                            '-Choose your District-',
                            'Anuradhapura',
                            'Polonnaruwa'
                          ];
                        } else if (provinceController.text == 'NORTHERN') {
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
                        districtController.text = newDistrict!;
                      });
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //area code
                  TextFormField(
                      controller: areaCodeController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Area (work)';
                        }
                        return null;
                      },
                      decoration: decorations('Area Code')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Issued Date
                  TextFormField(
                      controller: issuedDateController,
                      onTap: () => selectIssuedDate(context),
                      readOnly: true,
                      decoration: decorations('Issued Date')),
                  const SizedBox(
                    height: 10,
                  ),
                  //Doc No
                  TextFormField(
                      controller: docNoController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your Grama Niladari Division (work)';
                        }
                        return null;
                      },
                      decoration: decorations('Doc No')),
                  const SizedBox(
                    height: 10,
                  ),
                  /*
                        //Upload Image
                        Row(
                          children: [
                            const Text('Choose a profile image'),
                            InkWell(
                              onTap: pickImage,
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  color: Colors.grey,
                                  child: _pickedImage == null
                                      //? const Text("Not selected")
                                      : kIsWeb
                                          //? Image.memory(
                                              webImage,
                                              fit: BoxFit.fill,
                                            )
                                          : Image.file(
                                              _pickedImage!,
                                              fit: BoxFit.fill,
                                            )),
                            )
                          ],
                        ),
*/
                  ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        maximumSize: Size.fromWidth(width / 4),
                        foregroundColor:
                            const Color.fromARGB(255, 243, 242, 234),
                        backgroundColor: const Color.fromARGB(255, 10, 4, 70),
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
    );
  }

  // Calculate the offset of form
  double _formOffset() {
    final RenderBox renderBoxRed =
        _NICformKey.currentContext!.findRenderObject() as RenderBox;
    final positionRed = renderBoxRed.localToGlobal(Offset.zero);
    return positionRed.dy - kToolbarHeight; // Adjusted for app bar height
  }
}

void _launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
