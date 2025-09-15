import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practics/res/color.dart';
import 'package:practics/res/fonts.dart';
import 'package:practics/utils/routes/routes.dart';
import 'package:practics/utils/routes/routes_name.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social App',
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: AppColors.whiteColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 22,
            fontFamily: AppFonts.sfProDisplayBold,
            color: AppColors.primaryTextTextColor,
          ),
        ),
        textTheme: TextTheme(
          // Headlines
          headlineLarge: TextStyle(
            fontSize: 40,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),
          headlineMedium: TextStyle(
            fontSize: 32,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),
          headlineSmall: TextStyle(
            fontSize: 28,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
            fontWeight: FontWeight.w500,
            height: 1.6,
          ),

          // Titles
          titleLarge: TextStyle(
            fontSize: 25,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
            height: 1.6,
          ),
          titleMedium: TextStyle(
            fontSize: 20,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
            height: 1.6,
          ),
          titleSmall: TextStyle(
            fontSize: 17,
            fontFamily: AppFonts.sfProDisplayMedium,
            color: AppColors.primaryTextTextColor,
            height: 1.6,
          ),

          // Body
          bodyLarge: TextStyle(
            fontSize: 17,
            fontFamily: AppFonts.sfProDisplayBold,
            color: AppColors.primaryTextTextColor,
            height: 1.6,
          ),
          bodyMedium: TextStyle(
            fontSize: 15,
            fontFamily: AppFonts.sfProDisplayRegular,
            color: AppColors.primaryTextTextColor,
            height: 1.6,
          ),
          bodySmall: TextStyle(
            fontSize: 13,
            fontFamily: AppFonts.sfProDisplayRegular,
            color: AppColors.primaryTextTextColor,
            height: 1.6,
          ),

          // Labels (replacement for caption)
          labelSmall: TextStyle(
            fontSize: 12,
            fontFamily: AppFonts.sfProDisplayBold,
            color: AppColors.primaryTextTextColor,
            height: 1.26,
          ),
        ),
      ),
      // home: CounterPage(),
      initialRoute: RouteName.splashScreen,
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
