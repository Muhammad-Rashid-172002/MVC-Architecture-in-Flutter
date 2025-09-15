import 'package:flutter/material.dart';
import 'package:practics/user_interface/auth/sign_in.dart';
import 'package:practics/user_interface/auth/sign_up_Screen.dart';
import 'package:practics/user_interface/dashboard/dashboard_screen.dart';
import 'package:practics/user_interface/splash_screen.dart';
import 'package:practics/utils/routes/routes_name.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splashScreen:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case RouteName.SignInScreen:
        return MaterialPageRoute(builder: (_) => const SignInScreen());

      case RouteName.SignUpScreen:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      case RouteName.dashboardScreen:
        return MaterialPageRoute(builder: (_) => const DashboardSreen());

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
