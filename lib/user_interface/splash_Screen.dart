import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:practics/firebase_Service/splash_Service.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashService splashService = SplashService();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    splashService.isLogin(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 247, 227, 164), Colors.white],
          ),
        ),
        child: Center(
          child: Text(
            'Welcome to Social App',
            style: GoogleFonts.aBeeZee(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: const Color.fromARGB(255, 255, 208, 0),
            ),
          ),
        ),
      ),
    );
  }
}
