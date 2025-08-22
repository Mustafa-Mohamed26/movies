import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/providers/user_cubit/user_cubit.dart';
import 'package:movies/ui/on_boarding/first-on-boarding.dart';
import 'package:movies/ui/on_boarding/on_boarding.dart';
import 'package:movies/ui/auth/forgot_password_screen.dart';
import 'package:movies/ui/auth/login_screen.dart';
import 'package:movies/ui/auth/register_screen.dart';
import 'package:movies/ui/home/home_screen.dart';
import 'package:movies/ui/home/profile_tab/profile_screen_tab.dart';
import 'package:movies/ui/home/profile_tab/update_profile.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void main() {
  runApp(
    BlocProvider(
      create: (context) => UserCubit(),
      child: MyApp(),
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.updateProfile,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
        AppRoutes.forgotPassword: (context) => ForgotPasswordScreen(),
        AppRoutes.onboarding1: (context) => FirstOnBoarding(),
        AppRoutes.onboarding2: (context) => OnBoarding(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.profile: (context) => ProfileScreen(),
        AppRoutes.updateProfile: (context) => UpdateProfile(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
