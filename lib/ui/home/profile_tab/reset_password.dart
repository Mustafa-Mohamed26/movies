
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

import '../../../l10n/app_localizations.dart';
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
    var height= MediaQuery.of(context).size.height;
    var width= MediaQuery.of(context).size.width;
    return BlocListener<ResetPasswordCubit,ResetPasswordState>(
       bloc: viewModel,
        listener: (context, state) {
          if (state is ResetPasswordError) {
              DialogUtils.showMessage(
                  context: context,
                  message: state.errorMessage);

            }
          if(state is ResetPasswordSuccess){
            DialogUtils.showMessage(
                context: context,
                message: AppLocalizations.of(context)!.success);
          }
         },
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.reset_password),
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back, color: AppColors.yellow),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.symmetric(
              horizontal: width*0.02
            ),
            child: Column(
              children: [
                Image.asset(AppAssets.forgotPassword),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                       SizedBox(height:height*0.02),
                      CustomTextField(
                        validate: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validate_enter_password;
                          }
                          return null;
                        },
                        // obscureText: true,
                        cursorColor: AppColors.white,
                        style: AppTextStyle.normal16White,
                        controller: password,
                        hintText: AppLocalizations.of(context)!.validate_enter_password,
                        prefixIcon: Icon(Icons.lock, color: AppColors.white),
                        suffixIcon: Image.asset(
                          AppAssets.eyeOff_Icon,
                          color: AppColors.white,
                        ),
                      ),
                       SizedBox(height: height*0.02),
                      CustomTextField(
                        validate: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validate_enter_password;
                          }
                          if (text.length < 8) {
                            return AppLocalizations.of(context)!.validate_8_characters;
                          }
                          return null;
                        },
                        cursorColor: AppColors.white,
                        style: AppTextStyle.normal16White,
                        controller: newPassword,
                        hintText: AppLocalizations.of(context)!.password,
                        prefixIcon: Icon(Icons.lock, color: AppColors.white),
                        suffixIcon: Image.asset(
                          AppAssets.eyeOff_Icon,
                          color: AppColors.white,
                        ),
                      ),
                       SizedBox(height: height*0.02),
                      CustomTextField(
                        validate: (text) {
                          if (text == null || text.trim().isEmpty) {
                            return AppLocalizations.of(context)!.validate_enter_password;
                          }
                          if (text != newPassword.text) {
                            return AppLocalizations.of(context)!.validate_not_match;
                          }
                          return null;
                        },
                        // obscureText: true,
                        cursorColor: AppColors.white,
                        style: AppTextStyle.normal16White,
                        controller: newPasswordConfirm,
                        hintText: AppLocalizations.of(context)!.confirm_password,
                        prefixIcon: Icon(Icons.lock, color: AppColors.white),
                        suffixIcon: Image.asset(
                          AppAssets.eyeOff_Icon,
                          color: AppColors.white,
                        ),
                      ),
                       SizedBox(height: height*0.03),
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
                    text: AppLocalizations.of(context)!.reset_password,
                    textStyle: AppTextStyle.bold16Black,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

}

