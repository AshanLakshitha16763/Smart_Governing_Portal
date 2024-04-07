import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lottie/lottie.dart';
import 'package:smart_governing_portal/controllers/secrets.dart';
import 'package:smart_governing_portal/controllers/widget_tree.dart';
import 'package:smart_governing_portal/pages/chat/chat_hopmepage.dart';
import 'package:smart_governing_portal/pages/chat/gemini.dart';
import 'package:smart_governing_portal/pages/test/charts.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
      apiKey: apikey,
      appId: appid,
      messagingSenderId: messagingsenderid,
      projectId: projectid,
      storageBucket: storagebucket,
    ));
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

    // Simulate a 4-second delay and then update loading state
    Timer(const Duration(seconds:4), () {
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
      home: _isLoading
          ? Center(
              child: Lottie.asset('lib/Assets/animations/loading.json',
                  frameRate: const FrameRate(40)),
            )
          : const WidgetTree(),
    );
  }
}
