import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/dialog_utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'bloc/login_states.dart';
import 'bloc/register_view_model.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = 'login_screen';

  LoginViewModel viewModel = LoginViewModel();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return BlocListener<LoginViewModel, LoginStates>(
      listener: (BuildContext context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, loadingText: "Loading...");
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: state.successMessage,
          );
        } else if (state is LoginErrorState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: state.errorMessage,
          );
        }
      },
      child: Scaffold(
        body: Form(
          key: viewModel.formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.04),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AppAssets.logo),
                CustomTextField(
                  controller: viewModel.emailController,
                  prefixIcon: Image.asset(AppAssets.mailIcon),
                  hintText: 'Email',
                  hintStyle: AppStyles.regular16white,
                ),
                SizedBox(height: height * 0.02),
                CustomTextField(
                  controller: viewModel.passwordController,
                  prefixIcon: Image.asset(AppAssets.lockIcon),
                  suffixIcon: Image.asset(AppAssets.hiddenIcon),
                  hintText: 'password',
                  hintStyle: AppStyles.regular16white,
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forget Password ?', style: AppStyles.regular14yellow),
                  ],
                ),
                SizedBox(height: height * 0.03),
                CustomButton(
                  onPressed: () {
                    // todo: navigate to home Screen
                    viewModel.login();
                  },
                  text: 'Login',
                  textStyle: AppStyles.regular20black,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don’t Have Account ?',
                      style: AppStyles.regular14white,
                    ),
                    TextButton(
                      onPressed: () {
                        // todo : Navigate to register Screen
                      },
                      child: Text('Create One', style: AppStyles.bold14yellow),
                    ),
                  ],
                ),
                SizedBox(height: height * 0.02),
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
                    Text('OR', style: AppStyles.regular14yellow),
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
                SizedBox(height: height * 0.02),
                CustomButton(
                  onPressed: () {
                    // todo : login with google
                  },
                  text: 'Login With Google',
                  textStyle: AppStyles.regular16black,
                  hasIcon: true,
                  iconWidget: Image.asset(AppAssets.googleIcon),
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(height: height * 0.03),
                CustomSwitch(
                value: true,
                onToggle: onToggle,
                activeIcon: Image.asset(AppAssets.americaFlag),
                inactiveIcon: Image.asset(AppAssets.egyptFlagIcon)
            )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onToggle(bool value) {}
}
