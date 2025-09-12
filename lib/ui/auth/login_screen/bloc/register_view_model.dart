import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../api/api_manager.dart';
import '../../../../models/login_request.dart';
import 'login_states.dart';

class LoginViewModel extends Cubit<LoginStates>{
  LoginViewModel():super(LoginInitialState());

  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController(
    text: 'ans122@gmail.com'
  );
  var passwordController = TextEditingController(
    text: 'VeryStrongNewPassword456!'
  );

  void login() async {
    if (formKey.currentState!.validate()) {
      try {
        emit(LoginLoadingState());
        var response = await ApiManager.login(
          LoginRequest(
            email: emailController.text,
            password: passwordController.text,
          ),
        );
        if (response?.message != "Success Login") {
          emit(LoginErrorState(errorMessage: response?.message ?? "Error"));
          return;
        }
        if (response?.message == "Success Login") {
          emit(
            LoginSuccessState(
              successMessage: response?.message ?? "success",
              
            ),
          );
        }
      } catch (e) {
        emit(LoginErrorState(errorMessage: e.toString()));
      }
    }
}
}
