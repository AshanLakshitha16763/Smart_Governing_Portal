import 'package:flutter/material.dart';
import 'package:smart_governing_portal/Responsive/MobileSite/adminRegisterMobile.dart';
import 'package:smart_governing_portal/constants.dart';


class AdminLoginMobile extends StatefulWidget {
  const AdminLoginMobile({super.key});

  @override
  _AdminLoginMobileState createState() => _AdminLoginMobileState();
}

class _AdminLoginMobileState extends State<AdminLoginMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //Mobile AppBar
        title: const Center(
            child: Expanded(
                child: Text(
          'Login',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
        ))),
        toolbarHeight: 80, // Change the AppBar height
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(
                8.0), // Add padding to adjust the size of the image
            child: SizedBox(
              child: Image.asset(
                'lib/Assets/logo.png',
                width: 80,
                height: 80,
              ),
            ),
          ),
        ],
      ),

      drawer: mobileDrawer, // Mobile Drawer

      body: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                height: MediaQuery.of(context).size.height - 50,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                7, 0, 7, 0),
                            child: Image.asset(
                              'lib/Assets/RegisterPages/user.png',
                              width: double.infinity,
                              height: 100,
                              fit: BoxFit.contain,
                            ),
                          ),
                          const SizedBox(height: 20),
                         TextFormField( // email Textfield
                                    controller: _usernameController,
                                    validator: (String? value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Please enter your Username address';
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
                                        borderSide: const BorderSide(
                                        color: Colors.blue, width: 2.0),
                                        borderRadius: BorderRadius.circular(10),    
                                      ),
                                    ),
                                  ),
                          const SizedBox(height: 26.0),
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
                                borderSide: const BorderSide(
                                    color: Colors.blue, width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 14.0),
                          Center(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.all(15),
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  foregroundColor: const Color.fromARGB(
                                      255, 243, 242, 234),
                                  backgroundColor:
                                      const Color.fromARGB(255, 10, 4, 70),
                                  padding: const EdgeInsets.all(20),
                                  fixedSize: const Size(800, 65),
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
                                  textAlign: TextAlign.center,
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 1.0),
                          TextButton(
                            onPressed: () => Navigator.of(context).push(
                                MaterialPageRoute(
                                    builder: (context) => const AdminRegisterMobile())),
                            child: const Text(
                              'Don\'t have an account? Sign Up',
                              textAlign: TextAlign.center,
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
                          const SizedBox(height: 5.0),
                          Center(
                            child: Expanded(
                              child: Row(
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
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Center(
                            child: Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Privacy Policy',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      'Copyright 2023',
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
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
            ),
          ],
        ),
      ),
    );
  }
}
