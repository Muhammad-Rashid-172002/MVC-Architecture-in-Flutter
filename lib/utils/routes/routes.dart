import 'package:flutter/material.dart';
import 'package:practics/user_interface/auth/login_screen.dart';
import 'package:practics/user_interface/auth/sign_up.dart';
import 'package:practics/user_interface/splash_screen.dart';
import 'package:practics/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.loginView:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.signUpScreen:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
