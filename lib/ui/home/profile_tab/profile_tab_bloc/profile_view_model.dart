import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/models/movie_data.dart';
import 'package:movies/ui/home/profile_tab/profile_tab_bloc/profile_tab_states.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileViewModel extends Cubit<ProfileStates> {
  ProfileViewModel() : super(ProfileInitialState());

  // controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  // reset password controllers
  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  // GlobalKey for the form state
  var formKey = GlobalKey<FormState>();

  // GlobalKey for the reset password form state
  var resetPasswordFormKey = GlobalKey<FormState>();

  // selected avatar index
  int selectedAvatarIndex = 0;

  void getProfile({BuildContext? context }) async {
    try {
      emit(ProfileLoadingState());
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      var response = await ApiManager.getProfile(token: token ?? '');
      await pref.setString('userId', "${response?.data?.sId}");
      loadHistory();
      getAllFavorites(context: context!);
      if (response?.message != "Profile fetched successfully") {
        emit(ProfileErrorState(response?.message ?? "AppLocalizations.of(context)!.error"));
        return;
      }
      
      if (response?.data == null) {
        emit(ProfileErrorState(response?.message ?? "AppLocalizations.of(context)!.profile_view_model_user_missing"));
        return;
      }

      if (state is ProfileSuccessState) {
        final currentState = state as ProfileSuccessState;
        emit(
          currentState.copyWith(
            user: response?.data,
            successMessage: response?.message,
          ),
        );
      } else {
        emit(
          ProfileSuccessState(
            successMessage: response?.message,
            user: response?.data,
          ),
        );
      }

      nameController.text = response?.data?.name ?? '';
      phoneController.text = response?.data?.phone ?? '';
      selectedAvatarIndex = response?.data?.avaterId ?? 0;
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
  
  void getAllFavorites({BuildContext? context}) async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? token = pref.getString('token');
      var response = await ApiManager.getAllFavorites(token: token ?? '');

      if (response?.movies == null) {
        emit(ProfileErrorState(response?.message ?? "AppLocalizations.of(context!)!.error"));
        return;
      }

      if (state is ProfileSuccessState) {
        final currentState = state as ProfileSuccessState;
        emit(currentState.copyWith(movies: response!.movies));
      } else {
        emit(ProfileSuccessState(movies: response!.movies));
      }
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }

  void loadHistory() async {
    try {
      SharedPreferences pref = await SharedPreferences.getInstance();
      String? sId = pref.getString('userId');
      var box = await Hive.openBox<MovieData>(sId ?? '');
      var historyMovies = box.values.toList();
      await box.close();

      if (state is ProfileSuccessState) {
        final currentState = state as ProfileSuccessState;
        emit(currentState.copyWith(historyMovies: historyMovies));
      } else {
        emit(ProfileSuccessState(historyMovies: historyMovies));
      }
    } catch (e) {
      emit(ProfileErrorState(e.toString()));
    }
  }
}