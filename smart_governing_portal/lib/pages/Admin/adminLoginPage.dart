// ignore_for_file: file_names, library_private_types_in_public_api

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:smart_governing_portal/controllers/auth.dart';
import 'package:smart_governing_portal/controllers/constants.dart';
import 'package:smart_governing_portal/pages/Admin/adminDashboardPage.dart';
import 'package:smart_governing_portal/pages/Admin/admin_register_desktop.dart';
import 'package:smart_governing_portal/pages/User/user_homePage.dart';
import 'package:smart_governing_portal/pages/User/user_loginPage.dart';
import 'dart:async';

class AdminLoginPage extends StatefulWidget {
  const AdminLoginPage({super.key});

  @override
  _AdminLoginPageState createState() => _AdminLoginPageState();
}

class _AdminLoginPageState extends State<AdminLoginPage> {
  final db = FirebaseFirestore.instance;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String? errorMessage = '';
  late double width;
  late double height;

  Future signInWithEmailAndPassword(BuildContext context) async {
    // Get the currently signed-in user
    User? user = FirebaseAuth.instance.currentUser;

    // Update the user's display name
    await user?.updateDisplayName(_nameController.text);

    try {
      await Auth().signInWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
    _adminRights();
  }

  Future<void> _adminRights() async {
    User? currentUser = FirebaseAuth.instance.currentUser;

    // Check if the document already exists
    final existingDoc =
        await db.collection("AdminRights").doc(currentUser!.uid).get();

    if (existingDoc.exists) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const AdminDashboardPage()));
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Permission Denied'),
            content: const Text('You do not have admin rights.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    }
    return;
  }

  Widget _errorMessage() {
    return Text(
      errorMessage == '' ? '' : 'Humm ? $errorMessage',
      style: const TextStyle(color: Colors.red),
    );
  }

  Widget _loginForm() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'Login',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 30, 31, 30),
          ),
        ),
        Image.asset(
          'lib/Assets/RegisterPages/user.png',
          width: double.infinity,
          height: 70,
          fit: BoxFit.contain,
        ),
        const SizedBox(
          height: 10,
        ),
        //Username field
        TextFormField(
          controller: _nameController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your Username';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Username',
            hintText: 'Enter your Username',
            prefixIcon: const Icon(Icons.person),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // email Textfield
        TextFormField(
          controller: _emailController,
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your email address';
            }
            if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
              return 'Please enter a valid email address';
            }
            return null;
          },
          decoration: InputDecoration(
            labelText: 'Email',
            hintText: 'Enter your email',
            prefixIcon: const Icon(Icons.email),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        //password field
        TextFormField(
          controller: _passwordController,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter your password';
            }
            if (value.length < 6) {
              return 'Password must be at least 6 characters in length';
            }
            if (value != _passwordController.text) {
              return 'Confirm password doesn\'t match the password';
            }
            return null;
          },
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            hintText: 'Enter your password',
            prefixIcon: const Icon(Icons.lock_open),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue, width: 2.0),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: _errorMessage(),
        ),
        ElevatedButton(
          onPressed: () => signInWithEmailAndPassword(context),
          style: ElevatedButton.styleFrom(
            foregroundColor: const Color.fromARGB(255, 243, 242, 234),
            backgroundColor: const Color.fromARGB(255, 10, 4, 70),
            padding: const EdgeInsets.all(20),
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
            'Login',
            style: TextStyle(fontSize: 20),
          ),
        ),
        const SizedBox(height: 8.0),
        TextButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const AdminRegisterDesktop())),
          child: const Text(
            'Don\'t have an account? Sign Up',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 10, 4, 70),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 1.0),
        TextButton(
          onPressed: () {},
          child: const Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 15,
              color: Color.fromARGB(255, 10, 4, 70),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(height: 1.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                // Handle Google button tap
              },
              child: Image.asset(
                'lib/Assets/RegisterPages/google.png',
                width: 30,
                height: 30,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 3,
            ),
            GestureDetector(
              onTap: () {
                // Handle Facebook button tap
              },
              child: Image.asset(
                'lib/Assets/RegisterPages/facebook.png',
                width: 60,
                height: 60,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(
              width: 1,
            ),
            GestureDetector(
              onTap: () {
                // Handle Apple button tap
              },
              child: Image.asset(
                'lib/Assets/RegisterPages/apple.png',
                width: 40,
                height: 40,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ],
    );
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
          TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const UserLoginPage(),
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
    );
  }

  Widget _body() {
    return Center(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          width = constraints.maxWidth;

          if (width > 800) {
            // Desktop layout
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 100, left: 100, top: 50, bottom: 50),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 243, 236, 236), // Border color
                      width: 3.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: (width - 150) / 2,
                            child: _loginForm(),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Container(
                            width: (width - 150) / 2.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(
                                    255, 243, 236, 236), // Border color
                                width: 3.0, // Border width
                              ),
                              borderRadius:
                                  BorderRadius.circular(15), // Border radius
                            ),
                            child: AutoScrollImages(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            // Mobile layout (stack columns vertically)
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 30, bottom: 30),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 243, 236, 236), // Border color
                      width: 3.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: width - 16,
                          child: _loginForm(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: width - 16,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: const Color.fromARGB(
                                  255, 243, 236, 236), // Border color
                              width: 3.0, // Border width
                            ),
                            borderRadius:
                                BorderRadius.circular(15), // Border radius
                          ),
                          child: AutoScrollImages(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();
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
              actions: [_appbarActions()],
              backgroundColor: const Color.fromARGB(255, 115, 185, 250),
            ),
            body: _body());
      } else {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: const Color.fromARGB(255, 115, 185, 250),
            ),
            drawer: mobileDrawer(width * 0.4, context),
            body: _body());
      }
    });
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
    "0.jpg",
    "14.jpg",
    "15.jpg",
    "0.jpg",
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
            duration: Duration(milliseconds: 2000), curve: Curves.ease);
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
          width: 500,
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
