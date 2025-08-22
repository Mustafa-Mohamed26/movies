import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:colorful_iconify_flutter/icons/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_switch.dart';
import 'package:movies/widgets/custom_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController() ;

  TextEditingController emailController = TextEditingController() ;

  TextEditingController passwordController = TextEditingController() ;

  TextEditingController confirmPasswordController = TextEditingController() ;

  TextEditingController phoneNumberController = TextEditingController() ;

  bool isEnglish = true ;
  List<String> avatars = [
    AppAssets.avatar_1,
    AppAssets.avatar_2,
    AppAssets.avatar_3,
    AppAssets.avatar_4,
    AppAssets.avatar_5,
    AppAssets.avatar_6,
    AppAssets.avatar_7,
    AppAssets.avatar_8,
    AppAssets.avatar_9,
  ];

  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        title: Text(
          'Register',
          style: AppStyles.regular16yellow,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: height*0.01),
              child: CarouselSlider(
                options: CarouselOptions(
                  enlargeCenterPage: true,
                  viewportFraction: 0.5
                ),
                items: List.generate(avatars.length, (index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(
                        vertical: height*0.02
                    ),
                      child: Image.asset(avatars[index], fit: BoxFit.fill,),
                  );
        
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width*0.04),
              child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextField(
                    style: TextStyle(color: AppColors.white),
                    cursorColor: AppColors.white,
                      controller: nameController,
                      prefixIcon: Image.asset(AppAssets.identification_Icon) ,
                    hintText: 'Name',
                    hintStyle: AppStyles.regular16white,
                  ),
                  SizedBox(height: height*0.02,),
                  CustomTextField(
                    style: TextStyle(color: AppColors.white),
                    cursorColor: AppColors.white,
                    controller: emailController,
                      prefixIcon: Image.asset(AppAssets.email_Icon) ,
                    hintText: 'Email',
                    hintStyle: AppStyles.regular16white,
                  ),
                  SizedBox(height: height*0.02,),
                  CustomTextField(
                    style: TextStyle(color: AppColors.white),
                    cursorColor: AppColors.white,
                    controller: passwordController,
                      prefixIcon: Image.asset(AppAssets.lock_Icon) ,
                    hintText: 'Password',
                    hintStyle: AppStyles.regular16white,
                    suffixIcon: Image.asset(AppAssets.eyeOff_Icon),
                  ),
                  SizedBox(height: height*0.02,),
                  CustomTextField(
                    style: TextStyle(color: AppColors.white),
                    cursorColor: AppColors.white,
                    controller: confirmPasswordController,
                      prefixIcon: Image.asset(AppAssets.lock_Icon) ,
                    hintText: 'Confirm Password',
                    hintStyle: AppStyles.regular16white,
                    suffixIcon: Image.asset(AppAssets.eyeOff_Icon),
                  ),
                  SizedBox(height: height*0.02,),
                  CustomTextField(
                    style: TextStyle(color: AppColors.white),
                    cursorColor: AppColors.white,
                    controller: phoneNumberController,
                      prefixIcon: Image.asset(AppAssets.phone_Icon) ,
                    hintText: 'Phone Number',
                    hintStyle: AppStyles.regular16white,
                  ),
                  SizedBox(height: height*0.02,),
                  CustomButton(
                      onPressed: (){
                        // todo : create an account & Navigate to Home Screen
                        Navigator.of(context).pushNamed(AppRoutes.home);
                      },
                      text: 'Create Account',
                    textStyle: AppStyles.regular20black,
                  ),
                  SizedBox(height: height*0.01,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already Have Account ?',
                        style: AppStyles.regular16white,
                      ),
                      TextButton(
                          onPressed: (){
                            //todo : Navigate to Login Screen
                            Navigator.of(context).pushNamed(AppRoutes.login);
                          },
                          child: Text(
                            'Login',
                            style: AppStyles.bold14yellow,
                          )
                      )
                    ],
                  )
                ],
              )
              ),
            ),
            CustomSwitch(
                value: isEnglish,
                onToggle: (val) {
                  if (val) {
                    isEnglish = true;
                    setState(() {});
                  } else {
                    isEnglish = false;
                    setState(() {});
                  }
                },
                activeIcon: Iconify(CircleFlags.lr),
                inactiveIcon: Iconify(CircleFlags.eg),
            ),
          ],
        ),
      ),
    );
  }
}