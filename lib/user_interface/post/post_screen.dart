import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practics/user_interface/auth/Login_Screen.dart';
import 'package:practics/utils/utils.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  DateTime? lastPressed;
  @override
  Widget build(BuildContext context) {
    final auth = FirebaseAuth.instance;
    return WillPopScope(
      onWillPop: () async {
        final now = DateTime.now();

        if (lastPressed == null ||
            now.difference(lastPressed!) > Duration(seconds: 2)) {
          lastPressed = now;

          Fluttertoast.showToast(
            msg: "Press back again to exit",
            backgroundColor: Colors.black,
            textColor: Colors.white,
          );

          return false; // don’t exit yet
        }

        return true; // exit app
      },

      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Posts',
            style: GoogleFonts.aBeeZee(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () async {
                try {
                  await auth.signOut();

                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );

                  Utils().toastMessage(
                    "Logged out successfully",
                    backgroundColor: Colors.green,
                  );
                } catch (e) {
                  Utils().toastMessage("Error logging out: $e");
                }
              },

              icon: Icon(Icons.logout_outlined, color: Colors.white),
            ),
          ],
          backgroundColor: Colors.deepPurple,
        ),
      ),
    );
  }
}
