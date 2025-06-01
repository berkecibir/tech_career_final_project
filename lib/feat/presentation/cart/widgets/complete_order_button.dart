import 'package:flutter/material.dart';
import 'package:tc_bootcamp_final/feat/core/configs/theme/app_colors.dart';
import 'package:tc_bootcamp_final/feat/core/utils/const/app_texts.dart';
import 'package:tc_bootcamp_final/feat/core/sizes/app_sizes.dart';
import 'package:tc_bootcamp_final/feat/core/widgets/device_padding/device_padding.dart';

class CompleteOrderButton extends StatelessWidget {
  const CompleteOrderButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text(AppTexts.checkOutPageNavigation)),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.deepPurple,
          foregroundColor: AppColors.white,
          padding: DevicePadding.medium.all,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppSizes.medium),
          ),
        ),
        child: const Text(
          AppTexts.completeOrder,
          style: TextStyle(fontSize: AppSizes.base),
        ),
      ),
    );
  }
}
