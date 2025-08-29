import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/user_request.dart';
import 'package:movies/ui/auth/register_Screen_logic/bloc/register_states.dart';

import '../../../../models/user_response.dart';

class RegisterViewModel extends Cubit<RegisterStates> {
  RegisterViewModel() : super(RegisterInitialState());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  int? avaterId;

   final formKey = GlobalKey<FormState>();


  void register() async{
    if (formKey.currentState!.validate()){
      emit(RegisterLoadingState());
      try{
        var user = UserRequest(name: nameController.text,
            email: emailController.text,
            password: passwordController.text,
            confirmPassword: confirmPasswordController.text,
            phone: phoneController.text,
            avaterId: avaterId);
        var response = await ApiManager.register( user: user);
        if(response?.message != "User created successfully"){
          emit(RegisterErrorState(errorMessage: response?.message ?? "Error"));
          return;
        }
        emit(RegisterSuccessState(successMessage: response?.message ?? "Success"));
      }
          catch(e){
            emit(RegisterErrorState(errorMessage: e.toString()));
          }
    }
  }
}