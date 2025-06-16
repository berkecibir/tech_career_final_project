import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/app_bar_cart_button.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/notification_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final Color? titleColor;
  final bool centerTitle;
  final double elevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
    this.backgroundColor,
    this.titleColor,
    this.centerTitle = false,
    this.elevation = 0,
  });

  factory CustomAppBar.auth() {
    return const CustomAppBar(
      title: AppTexts.loginHere,
      backgroundColor: Colors.transparent,
      titleColor: AppColors.white,
      centerTitle: true,
    );
  }

  factory CustomAppBar.home() {
    return CustomAppBar(
      title: AppTexts.homeAppBar,
      backgroundColor: Colors.transparent,
      titleColor: AppColors.white,
      centerTitle: false,
      actions: [
        NotificationButton(),
        AppBarCartButton(),
        const SizedBox(width: 8),
      ],
    );
  }

  factory CustomAppBar.cart() {
    return const CustomAppBar(
      title: AppTexts.cartAppBar,
      showBackButton: true,
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleColor: Color(0xFF1E293B),
      elevation: 1,
    );
  }

  factory CustomAppBar.detailAppBar({required String productName}) {
    return CustomAppBar(
      title: productName,
      showBackButton: true,
      centerTitle: true,
      backgroundColor: AppColors.white,
      titleColor: const Color(0xFF1E293B),
      elevation: 1,
      actions: [
        _buildFavoriteButton(),
        _buildShareButton(),
        const SizedBox(width: 8),
      ],
    );
  }

  static Widget _buildFavoriteButton() {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        ),
        child: const Icon(
          Icons.favorite_border_rounded,
          color: Color(0xFF64748B),
          size: 20,
        ),
      ),
    );
  }

  static Widget _buildShareButton() {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFF8FAFC),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFFE2E8F0), width: 1),
        ),
        child: const Icon(
          Icons.share_outlined,
          color: Color(0xFF64748B),
          size: 20,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(
          color: titleColor ?? const Color(0xFF1E293B),
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      backgroundColor: backgroundColor ?? AppColors.white,
      elevation: elevation,
      centerTitle: centerTitle,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: backgroundColor == Colors.transparent
                    ? const Color.fromRGBO(255, 255, 255, 0.15)
                    : const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: backgroundColor == Colors.transparent
                      ? const Color.fromRGBO(255, 255, 255, 0.2)
                      : const Color(0xFFE2E8F0),
                  width: 1,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: backgroundColor == Colors.transparent
                      ? Colors.white
                      : const Color(0xFF64748B),
                  size: 18,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      actions: actions,
      flexibleSpace: backgroundColor == Colors.transparent
          ? Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Color(0xFF667EEA), Color(0xFF764BA2)],
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  static void detailHelper(BuildContext context) {}
}

/* import 'package:flutter/material.dart';
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
} */
