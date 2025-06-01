import 'package:tc_bootcamp_final/feat/data/model/auth/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> signIn(String email, String password);
  Future<void> signOut();
}
