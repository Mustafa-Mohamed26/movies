import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_styles.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_text_form_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
   ForgotPasswordScreen({super.key});
TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text('Forget Password',style: AppStyles.regular16yellow,),
        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(width*0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(AppAssets.forgotPassword),
            SizedBox(height: height*0.02,),
            CustomTextField(controller: emailController,
            hintText: 'Email',
              prefixIcon: Icon(Icons.email,color: AppColors.white,),
            ),
            SizedBox(height: height*0.03,),

            CustomButton(onPressed: (){},
                text: 'Verify Email',textStyle: AppStyles.regular20black,)
          ],
        ),
      ),
    );
  }
}