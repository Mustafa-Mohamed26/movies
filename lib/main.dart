import 'package:flutter/material.dart';
import 'package:movies/on%20boarding/first-on-boarding.dart';
import 'package:movies/utils/app_routes.dart';
import 'on boarding/on_boarding.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.firstOnBoarding,
      routes: {
        AppRoutes.firstOnBoarding: (context) => FirstOnBoarding(),
        AppRoutes.onBoarding: (context) => OnBoarding(),
      },
    );
  }
}

