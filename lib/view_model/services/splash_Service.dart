import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:practics/utils/routes/routes_name.dart';
import 'package:practics/view_model/services/session_manger.dart';

class SplashService {
  void isLogin(BuildContext context) {
    FirebaseAuth auth = FirebaseAuth.instance;

    final user = auth.currentUser;
    if (user != null) {
      SessionController().userId = user.uid.toString();
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushNamed(context, RouteName.dashboardScreen),
      );
    } else {
      Timer(
        Duration(seconds: 3),
        () => Navigator.pushNamed(context, RouteName.signUpScreen),
      );
    }
  }
}
