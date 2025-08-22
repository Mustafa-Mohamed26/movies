import 'package:colorful_iconify_flutter/icons/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:movies/utils/app_assets.dart';
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
      body: Column(
        children: [
          Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomTextField(
                  controller: nameController,
                  prefixIcon: Image.asset(AppAssets.identification_Icon) ,
                hintText: 'Name',
                hintStyle: AppStyles.regular16white,
              ),
              SizedBox(height: height*0.02,),
              CustomTextField(
                  controller: emailController,
                  prefixIcon: Image.asset(AppAssets.email_Icon) ,
                hintText: 'Email',
                hintStyle: AppStyles.regular16white,
              ),
              SizedBox(height: height*0.02,),
              CustomTextField(
                  controller: passwordController,
                  prefixIcon: Image.asset(AppAssets.lock_Icon) ,
                hintText: 'Password',
                hintStyle: AppStyles.regular16white,
                suffixIcon: Image.asset(AppAssets.eyeOff_Icon),
              ),
              SizedBox(height: height*0.02,),
              CustomTextField(
                  controller: confirmPasswordController,
                  prefixIcon: Image.asset(AppAssets.lock_Icon) ,
                hintText: 'Confirm Password',
                hintStyle: AppStyles.regular16white,
                suffixIcon: Image.asset(AppAssets.eyeOff_Icon),
              ),
              SizedBox(height: height*0.02,),
              CustomTextField(
                  controller: phoneNumberController,
                  prefixIcon: Image.asset(AppAssets.phone_Icon) ,
                hintText: 'Phone Number',
                hintStyle: AppStyles.regular16white,
              ),
              SizedBox(height: height*0.02,),
              CustomButton(
                  onPressed: (){
                    // todo : create an account
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
    );
  }
}