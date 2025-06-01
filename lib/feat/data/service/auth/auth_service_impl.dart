import 'package:tc_bootcamp_final/feat/core/durations/app_duration.dart';
import 'package:tc_bootcamp_final/feat/core/exception/auth_exception.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/auth/user_model.dart';
import 'package:tc_bootcamp_final/feat/data/service/auth/auth_service.dart';

class MockAuthService implements AuthService {
  final List<UserModel> _mockUsers = [
    UserModel(email: AppTexts.mockMail, password: AppTexts.mockPassword),
  ];

  @override
  Future<UserModel?> signIn(String email, String password) async {
    await Future.delayed(AppDuration.oneSecond);

    try {
      return _mockUsers.firstWhere(
        (user) => user.email == email && user.password == password,
      );
    } catch (_) {
      throw AuthException(AppTexts.authError);
    }
  }

  @override
  Future<void> signOut() async {
    await Future.delayed(AppDuration.oneSecond);
  }
}
