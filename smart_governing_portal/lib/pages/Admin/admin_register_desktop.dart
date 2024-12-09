import 'package:flutter/material.dart';
import 'package:smart_governing_portal/pages/Admin/adminLoginPage.dart';
import 'package:smart_governing_portal/pages/User/after_registration_page.dart';
import 'package:smart_governing_portal/pages/User/user_homePage.dart';
import 'dart:async';

class AdminRegisterDesktop extends StatefulWidget {
  const AdminRegisterDesktop({super.key});

  @override
  _AdminRegisterDesktopState createState() => _AdminRegisterDesktopState();
}

class _AdminRegisterDesktopState extends State<AdminRegisterDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                            context,
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
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const AfterRegistrationPage(),
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
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (BuildContext context) =>
                                const AdminLoginPage(),
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
                                const AdminRegisterDesktop(),
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
                )
              ],
            ),
          ),
        ],
        backgroundColor: const Color.fromARGB(255, 115, 185, 250),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 243, 236, 236), // Border color
                      width: 3.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height - 100,
                  child: Row(
                    children: [
                      Expanded(
                        // RIGHT SIDE PROPERTIES
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  const Center(
                                    child: Column(
                                      children: [
                                        Center(
                                          // Register
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold,
                                              color: Color.fromARGB(
                                                  255, 30, 31, 30),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Padding(
                                    // user image
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            7, 0, 7, 0),
                                    child: Image.asset(
                                      'lib/Assets/RegisterPages/user.png',
                                      width: double.infinity,
                                      height: 70,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    // name field
                                    controller: _nameController,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your name';
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      labelText: 'Name',
                                      hintText: 'Enter your Name',
                                      prefixIcon:
                                          const Icon(Icons.account_circle),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    // email Textfield
                                    controller: _emailController,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your email address';
                                      }
                                      if (!RegExp(r'\S+@\S+\.\S+')
                                          .hasMatch(value)) {
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
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    //Username field
                                    controller: _usernameController,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your Username';
                                      }
                                      return null;
                                    },
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      labelText: 'Username',
                                      hintText: 'Enter your Username',
                                      prefixIcon: const Icon(Icons.person),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 15),
                                  TextFormField(
                                    //password field
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
                                        borderSide: const BorderSide(
                                            color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Center(
                                    //Register button
                                    child: Padding(
                                      padding:
                                          const EdgeInsetsDirectional.all(15),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          foregroundColor: const Color.fromARGB(
                                              255, 243, 242, 234),
                                          backgroundColor: const Color.fromARGB(
                                              255, 10, 4, 70),
                                          padding: const EdgeInsets.all(20),
                                          fixedSize: const Size(800, 50),
                                          textStyle: const TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          elevation: 5,
                                          side: const BorderSide(
                                            color: Color.fromARGB(
                                                255, 249, 252, 251),
                                            width: 4,
                                          ),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                          ),
                                        ),
                                        child: const Text(
                                          'Registor Now',
                                          style: TextStyle(fontSize: 20),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 1.0),
                                  TextButton(
                                    onPressed: () => Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const AdminLoginPage())),
                                    child: const Text(
                                      'Already have an Account?',
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: Color.fromARGB(255, 10, 4, 70),
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 2.0),
                                  Center(
                                    // Google,Apple,Facebook logo
                                    child: Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
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
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Center(
                                    child: Expanded(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                              child: Text(
                                            'Privacy Policy',
                                            textAlign: TextAlign.center,
                                          )),
                                          Expanded(
                                              child: Text(
                                            'Copyright 2023',
                                            textAlign: TextAlign.center,
                                          )),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        // RIGHT SIDE IMAGE
                        flex: 1,
                        child: AutoScrollImages(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
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
