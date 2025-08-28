
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/bloc/reset_cubit/reset_password_cubit.dart';
import 'package:movies/bloc/reset_cubit/reset_password_state.dart';
import 'package:movies/utils/app_assets.dart';
import 'package:movies/utils/app_colors.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:movies/utils/app_text_style.dart';
import 'package:movies/widgets/custom_button.dart';
import 'package:movies/widgets/custom_text_form_field.dart';

import '../../../widgets/dialog_utils.dart';

class ResetPassword extends StatefulWidget {



  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final TextEditingController password = TextEditingController(
      text: "VeryStrongNewPassword456!"
  );

  final TextEditingController newPassword = TextEditingController(
      text: "VeryStrongNewPassword456!21"
  );

  final TextEditingController newPasswordConfirm = TextEditingController(
      text: "VeryStrongNewPassword456!21"
  );

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  ResetPasswordCubit viewModel=ResetPasswordCubit();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ResetPasswordCubit,ResetPasswordState>(
       bloc: viewModel,
        builder: (context, state) {
          if (state is ResetPasswordError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    state.errorMessage,
                    style: AppTextStyle.bold16White,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.resetPassword, (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.yellow,
                    ),
                    child: Text(
                      'Try Again',
                      style: AppTextStyle.bold16White,
                    ),
                  ),
                ],
              ),
            );
          }

      return Scaffold(
        appBar: AppBar(
          title: Text('Reset Password'),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: AppColors.yellow),
          ),
        ),
         body: SingleChildScrollView(
           child: Padding(
             padding: const EdgeInsets.all(8.0),
             child: Column(
               children: [
                 Image.asset(AppAssets.forgotPassword),
                 Form(
                   key: formKey,
                   child: Column(
                     children: [
                       const SizedBox(height: 16),
                       CustomTextField(
                         validate: (text) {
                           if (text == null || text.trim().isEmpty) {
                             return 'Please enter old password';
                           }
                           return null;
                         },
                         // obscureText: true,
                         cursorColor: AppColors.white,
                         style: AppTextStyle.normal16White,
                         controller: password,
                         hintText: 'Old Password',
                         prefixIcon: Icon(Icons.lock, color: AppColors.white),
                         suffixIcon: Image.asset(
                           AppAssets.eyeOff_Icon,
                           color: AppColors.white,
                         ),
                       ),
                       const SizedBox(height: 16),
                       CustomTextField(
                         validate: (text) {
                           if (text == null || text.trim().isEmpty) {
                             return 'Please enter new password';
                           }
                           if (text.length < 6) {
                             return 'Password must be at least 6 characters';
                           }
                           return null;
                         },
                         cursorColor: AppColors.white,
                         style: AppTextStyle.normal16White,
                         controller: newPassword,
                         hintText: 'New Password',
                         prefixIcon: Icon(Icons.lock, color: AppColors.white),
                         suffixIcon: Image.asset(
                           AppAssets.eyeOff_Icon,
                           color: AppColors.white,
                         ),
                       ),
                       const SizedBox(height: 16),
                       CustomTextField(
                         validate: (text) {
                           if (text == null || text.trim().isEmpty) {
                             return 'Please confirm new password';
                           }
                           if (text != newPassword.text) {
                             return 'Passwords do not match';
                           }
                           return null;
                         },
                         // obscureText: true,
                         cursorColor: AppColors.white,
                         style: AppTextStyle.normal16White,
                         controller: newPasswordConfirm,
                         hintText: 'Confirm New Password',
                         prefixIcon: Icon(Icons.lock, color: AppColors.white),
                         suffixIcon: Image.asset(
                           AppAssets.eyeOff_Icon,
                           color: AppColors.white,
                         ),
                       ),
                       const SizedBox(height: 24),
                     ],
                   ),
                 ),
                 SizedBox(
                   width: double.infinity,
                   child:
                   CustomButton(
                     onPressed: () {
                      viewModel.changePassword(
                          newPass: newPassword.text,
                          oldPass: password.text);
                     },
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
    );
  }

}

