import 'package:flutter/material.dart';
import 'package:smart_governing_portal/constants.dart';
import 'LoginDesktop.dart';

class RegistorDesktop extends StatefulWidget {
  @override
  _RegistorDesktopState createState() => _RegistorDesktopState();
}

class _RegistorDesktopState extends State<RegistorDesktop> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [

            navbar, // navigation bar

            const SizedBox(
              height: 20,
            ),

            Expanded(
              child: Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(255, 243, 236, 236), // Border color
                       width: 3.0, // Border width
                    ),
                    borderRadius: BorderRadius.circular(15), // Border radius
                  ),
                  width: MediaQuery.of(context).size.width - 100,
                  height: MediaQuery.of(context).size.height - 100,
                  child: Row(
                    children: [

                      Expanded( // RIGHT SIDE PROPERTIES
                        flex: 1,
                        child: SingleChildScrollView(
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: [
                                    const Center(
                                      child: Column(
                                        children: [
                                          Center( // Register
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

                                    const SizedBox(
                                      height: 3
                                      ),

                                    Padding( // user image
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

                                    const SizedBox(
                                      height: 15
                                      ),

                                    TextFormField( // name field
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
                                        prefixIcon: Icon(Icons.account_circle),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color:Colors.blue, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 15
                                      ),

                                    TextFormField( // email Textfield
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
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 15
                                      ),

                                    TextFormField( //password field
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
                                        prefixIcon: Icon(Icons.lock_open),
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Colors.blue, width: 2.0),
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6.0
                                      ),

                                    Center( //Register button
                                      child: Padding(
                                        padding:
                                            const EdgeInsetsDirectional.all(15),
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            foregroundColor:
                                                const Color.fromARGB(
                                                    255, 243, 242, 234),
                                            backgroundColor:const Color.fromARGB(255, 10, 4, 70),   
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

                                    const SizedBox(
                                      height: 1.0
                                      ),

                                    TextButton(
                                      onPressed: () => Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginDesktop())),
                                      child: const Text(
                                        'Already have an Account?',
                                        style: TextStyle(
                                          fontSize: 15,
                                          color: Color.fromARGB(255, 10, 4, 70),
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 2.0
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
                      ),

                      Expanded( // RIGHT SIDE IMAGE
                        flex: 1,
                        child: Container(
                          child: Image.asset(
                            'lib/Assets/signup.png',
                            width: MediaQuery.of(context).size.width - 50,
                            height: MediaQuery.of(context).size.height - 50,
                            fit: BoxFit.contain,
                          ),
                        ),
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
