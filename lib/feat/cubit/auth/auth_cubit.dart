import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tc_bootcamp_final/feat/core/exception/auth_exception.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/utils/validator/form_validator.dart';
import 'package:tc_bootcamp_final/feat/data/service/auth/auth_service.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthService _authService;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  AuthCubit(this._authService) : super(AuthInitial());

  Future<void> login() async {
    emit(AuthLoading());

    final email = emailController.text.trim();
    final password = passwordController.text.trim();

    final emailError = FormValidator.validateEmail(email);
    final passError = FormValidator.validatePassword(password);

    if (emailError != null) {
      emit(AuthError(emailError));
      return;
    }

    if (passError != null) {
      emit(AuthError(passError));
      return;
    }

    try {
      final user = await _authService.signIn(email, password);
      if (user != null) {
        emit(AuthSuccess());
      } else {
        emit(AuthError(AppTexts.loginFailed));
      }
    } on AuthException catch (e) {
      emit(AuthError(e.message));
    } catch (e) {
      debugPrint('${AppTexts.unexpectedError} $e');
      emit(AuthError(AppTexts.tryAgainMessage));
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
