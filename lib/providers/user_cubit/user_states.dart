import 'package:movies/models/user_response.dart';

abstract class UserStates {}

class UserInitial extends UserStates {}

class UserUpdated extends UserStates {
  final User user;
  UserUpdated(this.user);
}