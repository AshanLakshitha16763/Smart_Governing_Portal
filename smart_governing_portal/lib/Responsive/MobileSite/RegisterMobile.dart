import 'package:flutter/material.dart';
import 'LoginMobile.dart';

class RegistorMobile extends StatefulWidget {
  @override
  _RegistorMobileState createState() => _RegistorMobileState();
}

class _RegistorMobileState extends State<RegistorMobile> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); // GlobalKey for the form
  final TextEditingController _nameController = TextEditingController(); // Controller for name input
  final TextEditingController _emailController = TextEditingController(); // Controller for email input
  final TextEditingController _passwordController = TextEditingController(); // Controller for password input

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: MediaQuery.of(context).size.width - 50,
          height: MediaQuery.of(context).size.height - 50,
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey, // Assigning the GlobalKey to the form
                  child: Column(
                    children: [

                     const Center(
                        child: Column(
                          children: [
                            Center(
                              child: Text(
                                'Registor',
                                style: TextStyle(
                                  fontSize: 46,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 30, 31, 30),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 5
                        ),

                      Padding( //User image
                        padding: const EdgeInsetsDirectional.fromSTEB(7, 0, 7, 0),
                        child: Image.asset(
                          'lib/Assets/RegisterPages/user.png',
                          width: double.infinity,
                          height: 100,
                          fit: BoxFit.contain,
                        ),
                      ),

                     const SizedBox(
                      height: 15
                      ),

                      TextFormField(
                        controller: _nameController, // Assigning the name controller
                        validator: (String? value) {
                          // Name validation logic
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name';
                          }
                          // Return null if the entered name is valid
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Name',
                          hintText: 'Enter your Name',
                          prefixIcon: const Icon(Icons.account_circle),
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
                      height: 15
                      ),

                      TextFormField(
                        controller: _emailController, // Assigning the email controller
                        validator: (String? value) {
                          // Email validation logic
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email address';
                          }
                          if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                            return 'Please enter a valid email address';
                          }
                          // Return null if the entered email is valid
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
                        height: 20.0
                        ),

                      TextFormField(
                        controller: _passwordController, // Assigning the password controller
                        validator: (value) {
                          // Password validation logic
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters in length';
                          }
                          if (value != _passwordController.text) {
                            return 'Confirm password doesn\'t match the password';
                          }
                          // Return null if the entered password is valid
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

                      const SizedBox(
                        height: 14.0
                        ),

                      Center( // Register button
                        child: Padding(
                          padding: const EdgeInsetsDirectional.all(15),
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              foregroundColor: const Color.fromARGB(255, 243, 242, 234),
                              backgroundColor: const Color.fromARGB(255, 10, 4, 70),
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
                              'Register Now',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 1.0
                        ),

                      TextButton( // Go to the Login page
                        onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginMobile())),
                        child: const Text(
                          'Already have an account?',
                          style: TextStyle(
                            fontSize: 15,
                            color: Color.fromARGB(255, 10, 4, 70),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),

                      const SizedBox(
                        height: 8.0
                        ),

                       Center( // Google,Apple,Facebook logo 
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
                        height: 25,
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
      ),
    );
  }
}
