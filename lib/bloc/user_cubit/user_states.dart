import 'package:movies/models/user_response.dart';

abstract class UserStates {}

class UserInitial extends UserStates {}

class UserLoaded extends UserStates {
  final User user;
  final String token;

  UserLoaded({required this.user, required this.token});

  // copyWith method with optional parameters
  UserLoaded copyWith({User? user, String? token}) {
    return UserLoaded(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }
}

