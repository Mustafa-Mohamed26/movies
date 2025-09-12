import 'package:colorful_iconify_flutter/icons/circle_flags.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/utils/app_routes.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import '../../../bloc/language_cubit.dart';
import '../../../l10n/app_localizations.dart';
import '../../../utils/app_assets.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/app_styles.dart';
import '../../../utils/dialog_utils.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_switch.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'bloc/login_states.dart';
import 'bloc/register_view_model.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = 'login_screen';


  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginViewModel viewModel = LoginViewModel();

  bool isEnglish = true;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var languageCubit = context.read<LanguageCubit>();
    return BlocListener<LoginViewModel, LoginStates>(
      bloc: viewModel,
      listener: (BuildContext context, state) {
        if (state is LoginLoadingState) {
          DialogUtils.showLoading(context: context, loadingText: AppLocalizations.of(context)!.loading);
        } else if (state is LoginSuccessState) {
          DialogUtils.hideLoading(context: context);
          DialogUtils.showMessage(
            context: context,
            message: state.successMessage,
          );
          Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.resetPassword, (route) => false,);
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
                  hintText: AppLocalizations.of(context)!.email,
                  hintStyle: AppStyles.regular16white,
                ),
                SizedBox(height: height * 0.02),
                CustomTextField(
                  controller: viewModel.passwordController,
                  prefixIcon: Image.asset(AppAssets.lockIcon),
                  suffixIcon: Image.asset(AppAssets.hiddenIcon),
                  hintText: AppLocalizations.of(context)!.password,
                  hintStyle: AppStyles.regular16white,
                ),
                SizedBox(height: height * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(AppLocalizations.of(context)!.forget_password, style: AppStyles.regular14yellow),
                  ],
                ),
                SizedBox(height: height * 0.03),
                CustomButton(
                  onPressed: () {
                    // todo: navigate to home Screen
                    viewModel.login();
                  },
                  text: AppLocalizations.of(context)!.login,
                  textStyle: AppStyles.regular20black,
                ),
                SizedBox(height: height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppLocalizations.of(context)!.donot_have_account,
                      style: AppStyles.regular14white,
                    ),
                    TextButton(
                      onPressed: () {
                        // todo : Navigate to register Screen
                      },
                      child: Text(AppLocalizations.of(context)!.create_account, style: AppStyles.bold14yellow),
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
                    Text(AppLocalizations.of(context)!.or, style: AppStyles.regular14yellow),
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
                  text: AppLocalizations.of(context)!.login_with_google,
                  textStyle: AppStyles.regular16black,
                  hasIcon: true,
                  iconWidget: Image.asset(AppAssets.googleIcon),
                  mainAxisAlignment: MainAxisAlignment.center,
                ),
                SizedBox(height: height * 0.03),
                CustomSwitch(
                  value: isEnglish,
                  onToggle: (val) {
                    if (val) {
                      isEnglish = true;
                      setState(() {
                        languageCubit.changeLanguage(Locale("en"));
                      });
                    } else {
                      isEnglish = false;
                      setState(() {
                        languageCubit.changeLanguage(Locale("ar"));
                      });
                    }
                  },
                  activeIcon: Iconify(CircleFlags.lr),
                  inactiveIcon: Iconify(CircleFlags.eg),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onToggle(bool value) {}
}
