import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/on%20boarding/first-on-boarding.dart';
import 'package:movies/on%20boarding/on_boarding.dart';
import 'package:movies/ui/auth/forgot_password_screen.dart';
import 'package:movies/ui/auth/login_screen.dart';
import 'package:movies/ui/auth/register_screen.dart';
import 'package:movies/ui/home/home_screen.dart';
import 'package:movies/ui/home/profile_screen.dart';
import 'package:movies/ui/home/update_profile/update_profile.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      
      initialRoute: AppRoutes.onboarding1,
      routes: {
        AppRoutes.login: (context) =>  LoginScreen(),

        AppRoutes.register: (context) =>  RegisterScreen(),
        AppRoutes.forgotPassword: (context) =>  ForgotPasswordScreen(),
        AppRoutes.onboarding1: (context) =>  FirstOnBoarding(),
        AppRoutes.onboarding2: (context) =>  OnBoarding(),
        AppRoutes.home: (context) =>  HomeScreen(),
        AppRoutes.profile: (context) => ProfileScreen(),
        AppRoutes.updateProfile: (context) => UpdateProfile(),

      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
