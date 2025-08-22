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

      initialRoute: AppRoutes.updateProfile,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.forgotPassword: (context) =>  ForgotPasswordScreen(),
        AppRoutes.onboarding1: (context) => const FirstOnBoarding(),
        AppRoutes.onboarding2: (context) => const OnBoarding(),
        AppRoutes.home: (context) =>  HomeScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
        AppRoutes.updateProfile: (context) => const UpdateProfile(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
