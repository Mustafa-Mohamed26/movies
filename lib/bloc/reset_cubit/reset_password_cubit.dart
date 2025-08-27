import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/api/api_manager.dart';
import 'package:movies/bloc/reset_cubit/reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  ResetPasswordCubit() : super(ResetPasswordInitial());

  final ApiManager _apiService = ApiManager();

  Future<void> changePassword({
    required String currentPassword,
    required String newPassword,
    required String confirmPassword,
  }) async {
    if (currentPassword.isEmpty) {
      emit(ResetPasswordFailure(error: "كلمة المرور الحالية مطلوبة"));
      return;
    }

    if (newPassword.isEmpty || newPassword.length < 6) {
      emit(ResetPasswordFailure(error: "كلمة المرور الجديدة يجب أن تكون至少 6 أحرف"));
      return;
    }

    if (newPassword != confirmPassword) {
      emit(ResetPasswordFailure(error: "كلمتا المرور غير متطابقتين"));
      return;
    }

    emit(ResetPasswordLoading());

    try {
      // استدعاء الـ API هنا داخل التراى كاتش
      await _apiService.changePassword(
        currentPassword: currentPassword,
        newPassword: newPassword,
      );

      emit(ResetPasswordSuccess(message: "تم تغيير كلمة المرور بنجاح!"));

    } catch (e) {
      emit(ResetPasswordFailure(error: "خطأ في تغيير كلمة المرور: ${e.toString()}"));
    }
  }

  void resetState() {
    emit(ResetPasswordInitial());
  }
}