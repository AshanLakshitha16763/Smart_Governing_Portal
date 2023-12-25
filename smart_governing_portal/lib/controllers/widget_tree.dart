import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:smart_governing_portal/pages/Admin/adminDashboardPage.dart';
import 'package:smart_governing_portal/pages/User/after_registration_page.dart';
import 'package:smart_governing_portal/pages/User/user_homePage.dart';

class Auth {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Add this method to get the current user
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  // Your existing methods for authentication state changes, sign in, sign out, etc.

  Stream<User?> get authStateChanges => _auth.authStateChanges();
}


class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading indicator or splash screen while checking user status
          return const LinearProgressIndicator();
        }

        if (snapshot.hasData) {
          // Check if the user is an admin
          return FutureBuilder(
            future: _isAdminUser(),
            builder: (context, adminSnapshot) {
              if (adminSnapshot.connectionState == ConnectionState.waiting) {
                // Loading indicator or splash screen while checking admin status
                return const LinearProgressIndicator();
              }

              if (adminSnapshot.hasData && adminSnapshot.data == true) {
                // Admin user, navigate to admin dashboard
                return const AdminDashboardPage();
              } else {
                // Normal user, navigate to after registration page
                return const AfterRegistrationPage();
              }
            },
          );
        } else {
          // Normal user, navigate to home page
          return const HomePage();
        }
      },
    );
  }

  Future<bool> _isAdminUser() async {
    // Check if the current user is an admin by querying the "AdminRights" collection
    final currentUser = Auth().getCurrentUser();
    if (currentUser != null) {
      final adminSnapshot =
          await db.collection("AdminRights").doc(currentUser.uid).get();
      if (adminSnapshot.exists) {
        final adminData = adminSnapshot.data();
        return adminData?["Admin"] == "true";
      }
    }
    return false; // Default to false if there's an issue or if the user is not an admin
  }
}