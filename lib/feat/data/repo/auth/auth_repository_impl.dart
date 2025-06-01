import 'package:tc_bootcamp_final/feat/core/exception/auth_exception.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/data/model/auth/user_model.dart';
import 'package:tc_bootcamp_final/feat/data/repo/auth/auth_repository.dart';
import 'package:tc_bootcamp_final/feat/data/service/auth/auth_service.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthService _authService;

  AuthRepositoryImpl(this._authService);

  @override
  Future<UserModel> signIn(String email, String password) async {
    final user = await _authService.signIn(email, password);
    if (user != null) {
      return user;
    } else {
      throw AuthException(AppTexts.userNotFoundMessage);
    }
  }

  @override
  Future<void> signOut() async {
    await _authService.signOut();
  }
}
