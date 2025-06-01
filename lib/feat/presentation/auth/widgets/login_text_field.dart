import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/border/app_border_radius.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';

class LoginTextField extends StatelessWidget {
  final bool isObscure;
  final String label;
  final IconData prefixIcon;
  final TextInputType keyboartType;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  const LoginTextField({
    super.key,
    required this.isObscure,
    required this.label,
    required this.prefixIcon,
    required this.keyboartType,
    required this.controller,
    this.validator,
  });

  factory LoginTextField.email({
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return LoginTextField(
      keyboartType: TextInputType.emailAddress,
      isObscure: false,
      label: AppTexts.mailLabel,
      prefixIcon: Icons.email,
      controller: controller,
      validator: validator,
    );
  }

  factory LoginTextField.password({
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return LoginTextField(
      isObscure: true,
      label: AppTexts.passwordLabel,
      prefixIcon: Icons.lock,
      keyboartType: TextInputType.number,
      controller: controller,
      validator: validator,
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: keyboartType,
      controller: controller,
      obscureText: isObscure,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: AppBorderRadius.all(AppSizes.small),
        ),
      ),
      validator: validator,
    );
  }
}
