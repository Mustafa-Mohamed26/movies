import 'package:movies/models/reset_password_response.dart';

abstract class ResetPasswordState {}


class ResetPasswordLoading extends ResetPasswordState {}
class ResetPasswordInitial extends ResetPasswordState {}


class ResetPasswordSuccess extends ResetPasswordState {}

class ResetPasswordError extends ResetPasswordState {
  String errorMessage;
  ResetPasswordError({required this.errorMessage});
}


