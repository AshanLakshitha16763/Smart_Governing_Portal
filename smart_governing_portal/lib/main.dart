import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_governing_portal/secrets.dart';
import 'package:smart_governing_portal/widget_tree.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options:  FirebaseOptions(
        apiKey:  apikey, 
        appId: appid, 
        messagingSenderId: messagingsenderid, 
        projectId: projectid,
        storageBucket: storagebucket
      )
    );
  }
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoading = true; // State variable to track loading

  @override
  void initState() {
    super.initState();

    // Simulate a 5-second delay and then update loading state
    Timer(const Duration(seconds: 3), () {
      setState(() {
        _isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Governing Portal',
      theme: ThemeData(
          fontFamily: 'Poppins',
          visualDensity: VisualDensity.adaptivePlatformDensity,
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 205, 219, 243)),
          useMaterial3: true,
        ),
      home: _isLoading ? const LinearProgressIndicator() : const WidgetTree(),
    );
  }
}

