import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies/bloc/user_cubit/user_cubit.dart';
import 'package:movies/models/movie_data.dart';
import 'package:movies/ui/auth/login_screen/login_screen.dart';
import 'package:movies/ui/details/details_screen.dart';
import 'package:movies/ui/home/profile_tab/profile_tab_bloc/profile_view_model.dart';
import 'package:movies/ui/home/profile_tab/reset_password.dart';
import 'package:movies/ui/on_boarding/first-on-boarding.dart';
import 'package:movies/ui/on_boarding/on_boarding.dart';
import 'package:movies/ui/auth/forgot_password_screen.dart';
import 'package:movies/ui/auth/register_Screen_logic/register_screen.dart';
import 'package:movies/ui/home/home_screen.dart';
import 'package:movies/ui/home/profile_tab/profile_screen_tab.dart';
import 'package:movies/ui/home/profile_tab/update_profile.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_theme.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Initialize Flutter widgets
  final appDocumentDirectory =
      await getApplicationDocumentsDirectory(); // Get the app's document directory
  Hive.init(
    appDocumentDirectory.path,
  ); // Initialize Hive with the app's document directory path
  Hive.registerAdapter(MovieDataAdapter()); // Register the MovieData adapter

  // Run the app
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<ProfileViewModel>(
          create: (_) => ProfileViewModel()
            ..getProfile()
            ..getAllFavorites()
            ..loadHistory(),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  void main() {
    runApp(BlocProvider(create: (context) => UserCubit(), child: MyApp()));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: AppRoutes.register,
      routes: {
        AppRoutes.login: (context) => LoginScreen(),
        AppRoutes.register: (context) => RegisterScreen(),
        AppRoutes.forgotPassword: (context) => ForgotPasswordScreen(),
        AppRoutes.onboarding1: (context) => FirstOnBoarding(),
        AppRoutes.onboarding2: (context) => OnBoarding(),
        AppRoutes.home: (context) => HomeScreen(),
        AppRoutes.profile: (context) => ProfileTab(),
        AppRoutes.updateProfile: (context) => UpdateProfile(),
        AppRoutes.details: (context) {
          final movieId = ModalRoute.of(context)!.settings.arguments as int;
          return DetailsScreen(movieId: movieId);
        },
        AppRoutes.resetPassword: (context) => ResetPassword(),
      },

      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
