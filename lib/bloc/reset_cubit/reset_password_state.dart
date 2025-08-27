import 'package:movies/models/reset_password_response.dart';

abstract class ResetPasswordState {}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordRequestSuccess extends ResetPasswordState {
  final String message;
  ResetPasswordRequestSuccess({required this.message});
}

class ResetPasswordCodeInput extends ResetPasswordState {
  final String email;
  ResetPasswordCodeInput({required this.email});
}

class ResetPasswordSuccess extends ResetPasswordState {
  final String message;
  ResetPasswordSuccess({required this.message});
}

class ResetPasswordFailure extends ResetPasswordState {
  final String error;
  ResetPasswordFailure({required this.error});
}

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoaded extends AuthState {
  final ResetPasswordResponse resetPasswordResponse;
  final String token;

  AuthLoaded({required this.resetPasswordResponse, required this.token});

  AuthLoaded copyWith({ResetPasswordResponse? resetPasswordResponse, String? token}) {
    return AuthLoaded(
      resetPasswordResponse: resetPasswordResponse ?? this.resetPasswordResponse,
      token: token ?? this.token,
    );
  }
}