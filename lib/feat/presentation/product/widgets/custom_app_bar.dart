import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_theme.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/app_bar_cart_button.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/favorite_button.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/notification_button.dart';
import 'package:tc_bootcamp_final/feat/presentation/product/widgets/share_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final bool? centerTitle;
  final double? elevation;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.actions,
    this.backgroundColor,
    this.centerTitle,
    this.elevation,
  });

  factory CustomAppBar.auth() {
    return const CustomAppBar(
      title: AppTexts.loginHere,
      backgroundColor: Colors.transparent,
      centerTitle: true,
    );
  }

  factory CustomAppBar.home() {
    return const CustomAppBar(
      title: AppTexts.homeAppBar,
      backgroundColor: Colors.transparent,
      centerTitle: false,
      actions: [NotificationButton(), AppBarCartButton(), SizedBox(width: 8)],
    );
  }

  factory CustomAppBar.cart() {
    return const CustomAppBar(
      title: AppTexts.cartAppBar,
      centerTitle: true,
      elevation: 1,
    );
  }

  factory CustomAppBar.detailAppBar({required String productName}) {
    return CustomAppBar(
      title: productName,
      showBackButton: true,
      centerTitle: true,
      elevation: 1,
      actions: const [FavoriteButton(), ShareButton(), SizedBox(width: 8)],
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final customAppBarTheme = theme.extension<CustomAppBarTheme>()!;
    final bool isTransparent = backgroundColor == Colors.transparent;

    return AppBar(
      title: Text(title, style: theme.appBarTheme.titleTextStyle),
      backgroundColor: backgroundColor ?? theme.appBarTheme.backgroundColor,
      elevation: elevation ?? theme.appBarTheme.elevation ?? 0,
      centerTitle: centerTitle ?? theme.appBarTheme.centerTitle ?? true,
      automaticallyImplyLeading: showBackButton,
      leading: showBackButton
          ? Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isTransparent
                    ? customAppBarTheme.transparentBackgroundColor
                    : customAppBarTheme.defaultBackgroundColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isTransparent
                      ? customAppBarTheme.transparentBorderColor
                      : customAppBarTheme.defaultBorderColor,
                ),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: isTransparent
                      ? Colors.white
                      : theme.appBarTheme.iconTheme?.color,
                  size: theme.appBarTheme.iconTheme?.size ?? 18,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            )
          : null,
      actions: actions,
      flexibleSpace: isTransparent
          ? Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: customAppBarTheme.gradientColors,
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            )
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
