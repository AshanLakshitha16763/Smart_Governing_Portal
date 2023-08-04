import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:smart_governing_portal/widget_tree.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options:  const FirebaseOptions(
        apiKey: "AIzaSyAQGH-OoQz5jHZKxMR6t6GXXuQLo82RF6M", 
        appId: "1:913759630420:web:9fac7bd0a1c5cec94d69c1", 
        messagingSenderId: "913759630420", 
        projectId: "smart-governing-portal"
      )
    );
  }
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        home: const WidgetTree()
        /*const ResponsiveLayout(
          mobileDesign: MobileDesign(), 
          tabletDesign: TabletDesign(), 
          desktopDesign: DesktopDesign())*/
        );
  }
}
