import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_switch.dart';
import 'package:movies/widgets/custom_text_form_field.dart';

import '../../utils/app_colors.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(
          horizontal: width*0.04,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.logo),
            CustomTextField(
                controller: emailController,
              prefixIcon: Image.asset(AppAssets.mailIcon),
              hintText: 'Email',
              hintStyle: AppStyles.regular16white,
            ) ,
            SizedBox(height: height*0.02,),
            CustomTextField(
                controller: passwordController,
              prefixIcon: Image.asset(AppAssets.lockIcon),
              suffixIcon: Image.asset(AppAssets.hiddenIcon),
              hintText: 'password',
              hintStyle: AppStyles.regular16white,
            ),
            SizedBox(height: height*0.01,),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                    'Forget Password ?',
                  style: AppStyles.regular14yellow,
                )
              ],
            ),
            SizedBox(height: height*0.03,),
            CustomButton(
                onPressed: (){
                  // todo: navigate to home Screen
                },
                text: 'Login',
              textStyle: AppStyles.regular20black,
            ),
            SizedBox(height: height*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                    'Don’t Have Account ?',
                  style: AppStyles.regular14white,
                ),
                TextButton(
                    onPressed: (){
                      // todo : Navigate to register Screen
                    },
                    child: Text(
                      'Create One' ,
                      style: AppStyles.bold14yellow,
                    )
                )
              ],
            ),
            SizedBox(height: height*0.02,),
            Row(
              children: [
                Expanded(
                  child: Divider(
                    indent: width * 0.1,
                    endIndent: width * 0.05,
                    thickness: 2,
                    color: AppColors.yellow,
                  ),
                ),
                Text(
                 'OR',
                  style: AppStyles.regular14yellow,
                ),
                Expanded(
                  child: Divider(
                    indent: width * 0.05,
                    endIndent: width * 0.1,
                    thickness: 2,
                    color: AppColors.yellow,
                  ),
                ),
              ],
            ),
            SizedBox(height: height*0.02,),
            CustomButton(
                onPressed: (){
                  // todo : login with google
                },
                text: 'Login With Google' ,
              textStyle: AppStyles.regular16black,
              hasIcon: true,
              iconWidget: Image.asset(AppAssets.googleIcon),
              mainAxisAlignment: MainAxisAlignment.center,
            ),
            SizedBox(height: height*0.03,),
            CustomSwitch(
                value: true,
                onToggle: onToggle,
                activeIcon: Image.asset(AppAssets.americaFlag),
                inactiveIcon: Image.asset(AppAssets.egyptFlagIcon)
            )

          ],
        ),
      ),
    );
  }

  void onToggle(bool value) {

  }
}