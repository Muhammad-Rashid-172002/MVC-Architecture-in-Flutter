import 'dart:async';

import 'package:flutter/material.dart';
import 'package:practics/utils/routes/routes_name.dart';

class SplashService {
  void isLogin(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushNamed(context, RouteName.signUpScreen),
    );
  }
}
