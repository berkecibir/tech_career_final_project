import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppBar({super.key, required this.title});

  factory CustomAppBar.auth() {
    return const CustomAppBar(title: AppTexts.loginHere);
  }

  factory CustomAppBar.home() {
    return const CustomAppBar(title: AppTexts.homeAppBar);
  }

  factory CustomAppBar.cart() {
    return const CustomAppBar(title: AppTexts.cartAppBar);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(title: Text(title));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static detail(BuildContext context) {}
}
