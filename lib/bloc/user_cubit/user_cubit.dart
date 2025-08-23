import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/models/user_response.dart';
import 'package:movies/bloc/user_cubit/user_states.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitial());

  // save user and token in cubit
  void setUserAndToken(User user, String token) {
    emit(UserLoaded(user: user, token: token));
  }

  // update user and token
  void updateUserAndToken({User? newUser, String? newToken}) {
    if (state is UserLoaded) {
      final currentState = state as UserLoaded; // cast to UserLoaded
      emit(
        currentState.copyWith(
          user: newUser ?? currentState.user,
          token: newToken ?? currentState.token,
        ),
      );
    }
  }

  // get user and token
  User? get currentUser =>
      state is UserLoaded ? (state as UserLoaded).user : null;

  String? get currentToken =>
      state is UserLoaded ? (state as UserLoaded).token : null;
}
