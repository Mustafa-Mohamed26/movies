
import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:movies/bloc/reset_cubit/reset_password_state.dart';
import 'package:movies/models/reset_password_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../api/api_manager.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordLoading());
  void changePassword({required String newPass, required String oldPass})async{
    try{
      emit(ResetPasswordLoading());
      var response=await ApiManager.changePassword(newPass: newPass, oldPass: oldPass);
      if(response!.statusCode == "400"){
        emit(ResetPasswordError(errorMessage: response.message.toString()));
        return;
      } if(response!.statusCode =='200'){
        emit( ResetPasswordSuccess());
        return;
      }

    }catch(e){
      emit(ResetPasswordError(errorMessage: e.toString()));
    }
  }

}