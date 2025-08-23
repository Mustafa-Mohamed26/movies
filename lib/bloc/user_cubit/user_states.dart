import 'package:movies/models/user_response.dart';

abstract class UserStates {}

class UserInitial extends UserStates {}

class UserLoaded extends UserStates {
  // represents the loaded state
  final User user;
  final String token;

  UserLoaded({required this.user, required this.token});

  // copyWith method to update the state
  UserLoaded copyWith({required User user, required String token}) {
    return UserLoaded(user: user, token: token);
  }
}
