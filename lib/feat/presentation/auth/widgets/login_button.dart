import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/border/app_border_radius.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';
import 'package:tc_bootcamp_final/feat/cubit/auth/auth_cubit.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key, required this.cubit});

  final AuthCubit cubit;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (cubit.formKey.currentState!.validate()) {
          cubit.login();
        }
      },
      child: Container(
        padding: DevicePadding.medium.onlyVertical,
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: AppBorderRadius.all(AppSizes.small),
        ),
        child: Center(
          child: Text(
            AppTexts.loginHere,
            style: TextStyle(color: AppColors.white, fontSize: AppSizes.base),
          ),
        ),
      ),
    );
  }
}
