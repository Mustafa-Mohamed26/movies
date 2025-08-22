import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/models/user_response.dart';
import 'package:movies/providers/user_cubit/user_states.dart';

class UserCubit extends Cubit<UserStates>{

  UserCubit() : super(UserInitial());

  void updateUser(User user){
    emit(UserUpdated(user));
  }

  void updateToken(String token){
    emit(TokenUpdated(token));
  }
}