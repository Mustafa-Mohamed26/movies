import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movies/ui/auth/forgot_password_screen.dart';
import 'package:movies/ui/auth/login_screen.dart';
import 'package:movies/ui/auth/register_screen.dart';
import 'package:movies/ui/home/home_screen.dart';
import 'package:movies/ui/home/profile_screen.dart';
import 'package:movies/ui/onboarding/onboarding_screen_1.dart';
import 'package:movies/ui/onboarding/onboarding_screen_2.dart';
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
      
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.login: (context) => const LoginScreen(),
        AppRoutes.register: (context) => const RegisterScreen(),
        AppRoutes.forgotPassword: (context) =>  ForgotPasswordScreen(),
        AppRoutes.onboarding1: (context) => const OnboardingScreen1(),
        AppRoutes.onboarding2: (context) => const OnboardingScreen2(),
        AppRoutes.home: (context) =>  HomeScreen(),
        AppRoutes.profile: (context) => const ProfileScreen(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
