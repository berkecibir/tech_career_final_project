import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';

class FormValidator {
  static String? validateRequired(String? value) {
    return (value == null || value.isEmpty)
        ? AppTexts.validateFormMessage
        : null;
  }

  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return AppTexts.validateEmailMessage;
    }

    final regex = RegExp(AppTexts.emailPattern);
    return regex.hasMatch(email) ? null : AppTexts.validateRegexcontrollMessage;
  }

  /// Şifre doğrulayıcı
  static String? validatePassword(String? password, {int minLength = 6}) {
    if (password == null || password.isEmpty) {
      return AppTexts.validatePasswordMessage;
    }

    if (password.length < minLength) {
      return AppTexts.validatePasswordLengthMessage(minLength);
    }

    return null;
  }
}
