import 'dart:async';
import 'package:flutter/material.dart';
import 'package:practics/user_interface/auth/Login_Screen.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
      ),
    );
  }
}
