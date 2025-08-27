import 'package:flutter/material.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_text_style.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_text_form_field.dart';

class ResetPassword extends StatelessWidget {
  TextEditingController password=TextEditingController();
  TextEditingController newPassword=TextEditingController();
  TextEditingController newPasswordConfirm=TextEditingController();

  ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        leading: InkWell(
          onTap: () {},
          child: Icon(Icons.arrow_back,color: AppColors.yellow,),
        ),
      ),
      
      body: SingleChildScrollView(
        child: Padding
        (
          padding:  EdgeInsets.symmetric(
            horizontal: width*0.015
          ),
          child: Column(
            children: [
             Image.asset(AppAssets.forgotPassword),
              SizedBox(height: height*0.01,),
              CustomTextField(
                cursorColor: AppColors.white,
                style: AppTextStyle.normal16White,
                  controller: password,
                  hintText: 'password',
                prefixIcon: Icon(Icons.lock,color: AppColors.white,),
                suffixIcon: Image.asset( AppAssets.eyeOff_Icon,color: AppColors.white,),
              ),
              SizedBox(height: height*0.02,),
              CustomTextField(
                cursorColor: AppColors.white,
                style: AppTextStyle.normal16White,
                controller: newPassword,
                hintText: 'password',
                prefixIcon: Icon(Icons.lock,color: AppColors.white,),
                suffixIcon: Image.asset( AppAssets.eyeOff_Icon,color: AppColors.white,),
              ),
              SizedBox(height: height*0.02,),
              CustomTextField(
                cursorColor: AppColors.white,
                style: AppTextStyle.normal16White,
                controller: newPasswordConfirm,
                hintText: 'password',
                prefixIcon: Icon(Icons.lock,color: AppColors.white,),
                suffixIcon: Image.asset( AppAssets.eyeOff_Icon,color: AppColors.white,),
              ),
              SizedBox(height: height*0.02,),
               SizedBox(
                 width: double.infinity,
                 child: CustomButton(
                     onPressed: (){},
                     text: 'Reset Password',
                   textStyle: AppTextStyle.bold16Black,
                 ),
               )
            ],
        
          ),
        ),
      ),
    );
  }
}
